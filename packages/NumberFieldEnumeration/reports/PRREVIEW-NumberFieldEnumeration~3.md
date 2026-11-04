# Review of NumberFieldEnumeration (pull request #1718 at 98f9ddf)

**Verdict:** accepted

Incremental re-review of the 71 lines changed since 9f24910: the new `prefix_characterization` theorem and its README paragraph, the three new §2.3 Checks, the deletion of `abs_coeff_le_of_t2`, the added `TauCeti.NumberTheory.NumberField.IntrinsicLabel` import and supplier-contract lines, and the Martinet page corrections. No blocking finding remains; one style note.

## R01 (P3) — Say what separability does in the prefix paragraph

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:620`, “Separability identifies real-root multiplicity with the number of real embeddings”.

**Claim:** The sentence equates a multiplicity (which is 1) with a count (which is `r`). What the route needs is: the irreducible polynomial `Q.map ℚ` is separable in characteristic zero, so every real root has multiplicity one, and the number of real roots counted with multiplicity (what `(Q.map (Int.castRingHom ℝ)).roots.card` measures) equals the number of distinct real roots, which is the number of real embeddings `K →+* ℂ` by `NumberField.InfinitePlace.card_real_embeddings`.

**Witness:** For `Q = X³ − X² + 2X + 8`, `(Q.map ℝ).roots.card = 1`, each root has multiplicity `1`, and `nrRealPlaces = 1`; the sentence as written would read “multiplicity `1` equals `1` real embedding”, which is a coincidence of this example, not the argument (for `X² − X − 1` it would read “`1 = 2`”).

**Repair:** Replace the sentence by: “Since `Q.map (Int.castRingHom ℚ)` is irreducible in characteristic zero it is separable, so each real root has multiplicity one and the root count with multiplicity is the number of real embeddings (`NumberField.InfinitePlace.card_real_embeddings`).” The Lean statement needs no change.

## Previous findings

- R01 — repaired: `Suggested.lean:306`, `prefix_characterization (d r D : ℕ)`, the set equality between `{polredabs K | HasLMFDBIntrinsicLabel K d r D}` and the `canonicalPolys d D` subset cut out by `r` real roots and field discriminant `natAbs = D`; README:613 states it with the field-discriminant and admissibility caveats and the three Checks the previous review asked for.
- R02 — repaired: `abs_coeff_le_of_t2` is gone from `Suggested.lean`; README:189–190 keeps the integer specialization as prose without a backticked name. The file now has 18 admitted theorems again (17 after the deletion, plus the prefix theorem).
- R03 — not repaired, and withdrawn: the folder still has no `sources.toml`, but none of the 124 roadmaps on main (`TauCetiRoadmap/*`, `Completed/*`) carries one, and the gate's `stray-files` rule treats a non-roadmap file in the folder as a finding. The repository's convention is that sources are the README's references; this review does not re-raise it.
- R04 — repaired: README:391, README:517 and README:751 now read “Proposition 2.3, p. 6”; `martinet1985` line 249 is the printed header “6” of PDF page 8, where Proposition 2.3 appears (lines 279–281).

## Verified sound

**Scope of this round.** The diff (51 insertions, 20 deletions, `README.md` and `Suggested.lean` only; no file outside the folder, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NumberFieldEnumeration'` empty) was read in full, with every passage that cites or is cited by it: §1.1's coefficient bullet, §1.2's canonical-membership and quotient-field theorems, §2.3's prime equality and finiteness, the Tau Ceti supplier contract, the Layer 1 and Layer 2 Dependencies paragraphs, the References, and the Lean module docstring. The seeded sample falls in §1.1 (the changed coefficient bullet), §2.2 (the changed Martinet locator) and §2.3 (the prefix paragraph and Checks); the untouched sampled targets §1.2, §1.3 and §2.1 carry the previous report's verification.

**Adversarial table: changed statements** (values computed on both sides).

| # | Statement | Instances and values | Result; change |
|---|---|---|---|
| N1 | `prefix_characterization`, `2.2.5` | LHS: `ℚ(√5)` has `finrank 2`, `nrRealPlaces 2`, `discr 5`, `polredabs = X²−X−1`. RHS: `X²−X−1 ∈ canonicalPolys 2 5` (`|5| ≤ 5`), real roots `φ, φ'` give `roots.card = 2`, `AdjoinRoot(X²−X−1) ≃ ℚ(√5)` has `discr 5`, `natAbs = 5`. | Both sides `{X²−X−1}`; no change. |
| N2 | same, `2.0.4` | `ℚ(i)`: `nrRealPlaces 0`, `discr −4`, `polredabs = X²+1` (`t2 = 2`, minimal since any monic quadratic with nonzero constant term has `t2 ≥ 2|b| ≥ 2`). RHS: `(X²+1).map ℝ` has no real roots, `card = 0`; field discriminant `natAbs 4`. | Both sides `{X²+1}`; no change. |
| N3 | same, `2.1.5` | LHS: a quadratic field has `nrRealPlaces ∈ {0,2}` (`d − r` even), so no `K`. RHS: a monic irreducible quadratic over ℚ has `0` or `2` real roots, so `roots.card = 1` is impossible. | Both sides `∅`; no change. |
| N4 | same, `3.1.503`, field versus polynomial discriminant | `Q = X³−X²+2X+8`: `disc Q = b²c² − 4c³ − 4b³d − 27d² + 18bcd = 4 − 32 + 32 − 1728 − 288 = −2012 = 2²·(−503)`; negative, so one real root, `roots.card = 1`; the pinned `dedekindCubic_discr_eq_neg_five_hundred_three` gives field `discr = −503`, `natAbs 503`. With `Q.discr.natAbs` in the filter the RHS would demand `2012 = 503` and drop `Q`. | Field discriminant is the right filter; the README Check records the wrong model; no change. |
| N5 | same, degenerate `d = 0`, `D = 0`, `r > d` | `d = 0`: no number field has `finrank 0` (LHS `∅`) and `canonicalPolys 0 D = ∅` (RHS `∅`). `D = 0`: `|discr K| ≥ 1` for every number field, both sides `∅`. `r = 3, d = 2`: `nrRealPlaces ≤ finrank`, and a quadratic has at most 2 real roots, both sides `∅`. | Junk parameters give `∅ = ∅`; no change. |
| N6 | same, `d = 1` | `1.1.1`: `ℚ` has `polredabs = X` (norm 0), `X.map ℝ` has root `0`, `card 1`; `AdjoinRoot (X : ℚ[X]) ≃ ℚ`, `discr 1`. `1.0.1`: `nrRealPlaces ℚ = 1 ≠ 0` and `card 1 ≠ 0`, both `∅`. | `{X}` and `∅` on both sides; no change. |
| N7 | same, forward inclusion route | Given `K` with the label and `Q = polredabs K`: `polredabs_mem` gives `Q = minpoly ℤ θ`, monic irreducible of degree `d`; `Q.map ℚ = minpoly ℚ θ` irreducible (the `h` witness); `AdjoinRoot (Q.map ℚ) ≃ₐ[ℚ] K` by §1.2's quotient-field theorem (`AdjoinRoot.equiv` with `f ≠ 0`, `L = K` a domain, picks the root `θ`), so `discr` agrees; real roots of `minpoly ℚ θ` ↔ real embeddings, `card_real_embeddings` gives `r`. `|discr K| = D ≤ D` gives canonical membership. | Every input is a §1.2 target, a §2.3 target or a pinned declaration; no change. |
| N8 | same, reverse inclusion route | `Q ∈ canonicalPolys d D` gives `K` with `polredabs K = Q`, `finrank d`; `Q ∈ definingPolys K` gives `AdjoinRoot (Q.map ℚ) ≃ K`, so `(discr K).natAbs = D` from the RHS condition and `nrRealPlaces K = r` from the root count; the `|discr K| ≤ D` clause is then implied. | Label holds; no change. |
| N9 | README:621, prime-degree corollary with `Γ` admissible in rank `d−1` | `d = 2, D = 5, Γ = 0`: `hunterBound 2 5 0 = ⌊1⌋²/2 + 0 = 1/2`; a monic quadratic `X² + aX + b` has `t2 ≥ 2|b| ≥ 2 > 1/2` when `b ≠ 0`, and `b = 0, t2 = a² ≤ 1/2` forces `X²`, reducible; so `hunterCandidates 2 5 0 = ∅`, `hunterImage = ∅`, while prefix `2.2.5 = {X²−X−1}` (norm `3`). Rank-one admissibility with `Γ = 0` demands `x² ≤ 0` for `x ≠ 0`: false at `A = (1)`, `x = 1`. | The admissibility hypothesis is stated and necessary; no change. |
| N10 | README:189–190, integer specialization in prose | `X² + 2`: `t2 = 4`; `k = 2`: `|2| ≤ 1·(4/2)^1 = 2`; `k = 1`: `|0| ≤ 2·√2`; `k = 0`: `1 ≤ 1`. Via `P.map ℂ` monic of the same degree and `‖(a : ℂ)‖ = |a|`. | Immediate from `norm_coeff_le_of_complexT2`; correctly demoted to prose. |
| N11 | README:391, :517, :751, Martinet Proposition 2.3 locator | `martinet1985` line 248 `=== page 8 ===`, line 249 printed `6`, lines 279–281 Proposition 2.3 (covolume of a subfield lattice, factor `m^{n'/2}`); Theorem 2.6 at line 323 under printed page 7 (PDF page 9, line 313). | Locators agree with the corrected author version; no change. |
| N12 | README:93–97, supplier lines for `AdjoinRoot.equiv` and `card_real_embeddings` | `Mathlib/RingTheory/AdjoinRoot.lean:920`: `(AdjoinRoot f →ₐ[F] L) ≃ {x // x ∈ f.aroots L}` for `F` a field, `L` a commutative domain and `F`-algebra, `f ≠ 0`. `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:444`: `card {φ : K →+* ℂ // ComplexEmbedding.IsReal φ} = nrRealPlaces K`; `nrRealPlaces` is the `abbrev` at line 437. | The README describes both with their hypotheses; file paths correct; no change. |
| N13 | `Suggested.lean:6`, new import | `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72` defines `HasLMFDBIntrinsicLabel K d r D := finrank ℚ K = d ∧ nrRealPlaces K = r ∧ (discr K).natAbs = D` with `hasLMFDBIntrinsicLabel_iff` (:80), `.unique` (:95), `.discr_eq` (:109), all named in README:118–120. | The module exists at the pin and is used by the acceptance statement; no change. |

**Adversarial table: carried rows.** Every statement the diff leaves untouched keeps its row of the previous report (`PRREVIEW-NumberFieldEnumeration~2`, rows 1–60): `complexT2`/`t2` (rows 1–5), `candidates` and finiteness (6–7, 13), the complex coefficient bound (8), Maclaurin and Cauchy–Schwarz (10–12), the element norm and all-real formulas (14–16), `signVector`, `polredabsKey`, `definingPolys`, `polredabs` and classification (17–27), admissibility and projected lattices (28–30), `hunter` and the trace reduction (31–32), `hunterBound`, `hunterCandidates` (33–37), prime and primitive completeness (38–39), the subfield reduction (40–42), `hunter_relative`, `relT2`, `relCandidates`, `relativeBound`, maximal-subfield completeness, `relativeImage` (43–52), `canonicalPolys`, `hunterImage`, both list equalities, finiteness and the count comparison (53–58), and the carrier/universe controls (60). Row 9 (the integer coefficient bound) is superseded by N10 and row 59 (the prefix end theorem) by N1–N9 above. Row 42's locator repair is N11.

**Library declarations opened at the pins** (Mathlib `f6090c70`, Tau Ceti `358314d4`, from `lake-manifest.json`): `Mathlib/RingTheory/AdjoinRoot.lean:920` (`AdjoinRoot.equiv`, hypotheses as in N12); `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:437` (`nrRealPlaces`), `:444` (`card_real_embeddings`); `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72`, `:80`, `:95`, `:109`; `TauCeti/NumberTheory/NumberField/WorkedExamples/DedekindCubic/Invariants.lean:49` (`disc(X³−X²−2X−8) = −2012`), `:61` (`discr K = −503`), `:93` (`HasLMFDBIntrinsicLabel K 3 1 503`). The 22 entries of the previous report's pinned-library audit are unchanged by this diff.

**Cross-roadmap citations resolved this round:** Number Field Arithmetic §8.1 at `Completed/NumberFieldArithmetic/README.md:2140` on main (defines the prefix predicate and sign recovery; its warning paragraph says explicitly that the canonical defining polynomial and a complete-list certificate are not its targets, so this roadmap's prefix theorem has no second owner). `roadmaps grep -i polredabs` at the index of 2026-11-03 hits only this roadmap (53 lines) and BianchiModularForms README:136, which lists the polredabs normalization as outside its scope; `roadmaps grep 'IntrinsicLabel|intrinsic prefix'` hits no other roadmap. The downstream-consumer rows (ArtinRepresentations, BianchiModularForms) are prospective consumers, not supply edges. Ownership against open pull requests was checked through that index and the sibling checkouts the brief lists; nothing else was searched.

**Dependency check** (candidate order, main content, `--movable`):

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Gate.** The worker's gate at 98f9ddf reports every check zero and `OK` (build, depcheck, imports, stray files, outside-folder, README ids). Not waived.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean` from the worktree root exits 0 with exactly 18 `declaration uses sorry` warnings (lines 39, 53, 82, 86, 91, 96, 104, 132, 143, 156, 172, 199, 214, 259, 269, 290, 296, 306) and nothing else. The worker's `signatures.md` lists 33 declarations with 0 dropped binders; `#check @prefix_characterization` in a scratch copy reproduces the README statement exactly (`∀ (d r D : ℕ)`, the two set-builder sides with the `Irreducible` witness and `NumberField.discr (AdjoinRoot …)`). The theorem binds no section variables, so nothing can have been lost.

**Padding probe.** In a scratch copy the new theorem was tried with `simp`, `rfl`, `ext Q; simp [canonicalPolys, …]` and `infer_instance`: none closes it. The residual goal after `ext`/`simp` is the genuine content (transporting `polredabs K = Q` to `nrRealPlaces K = r` and `(discr K).natAbs = D` through the quotient-field comparison), so the declaration is a headline, not padding. The deleted `abs_coeff_le_of_t2` was the only one-tactic declaration of the previous round. No Lean process was left running; the worktree is clean at `98f9ddf78037108d41754427fd620e92b95d92c7`.

**Form and policy on the changed lines.** No LaTeX delimiters, process words, pull-request numbers, `set_option`, `lemma`, sorry'd data or machine path entered; every new backticked name of the roadmap's own (`prefix_characterization`) is declared; the new import is an individual `TauCeti.*` module that exists at the pin; the new theorem has a docstring stating the mathematics. The README's new Checks are prose and are not mirrored in Lean.

## Not verifiable

- `hlp1952` Chapter II, `hermite1850`, `cohen1993` §§4.4.12 and 6.4.1, `pohst1982` §§2–3: unchanged by this diff; as in the previous report they are background texts not readable legally through the service, and the roadmap's routes do not depend on them.
- The LMFDB knowls `nf.label` and `nf.discriminant` cited for the prefix paragraph are the same web texts the previous report read (`lmfdb-label`, `lmfdb-discriminant` lines 90–100); they were not refetched this round.
- Global minimality of the displayed canonical polynomials in the new Checks (`X²−X−1`, `X²+1`, `X³−X²+2X+8`) rests on the norm argument of N2 for quadratics and on the previous report's numerical comparison for the Dedekind cubic; no exhaustive certificate is claimed.

## Source issues

- none
