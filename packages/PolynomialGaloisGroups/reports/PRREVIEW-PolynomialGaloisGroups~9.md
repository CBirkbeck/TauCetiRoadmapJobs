# Review of PolynomialGaloisGroups (pull request #986 at a099640)

**Verdict:** needs changes

Incremental re-review of the 51 lines changed since 93a4832 (the diff of `README.md` and `Suggested.lean`, nothing outside the folder), plus the gate, a fresh elaboration, the dependency check and the seeded sample where it falls in the changed passages (§§2.2, 2.3 in full; §§1.1, 2.1, 3.1, 3.2 re-opened at their locators). The one blocking finding is carried from the previous review; the repairs this head makes are correct and introduce no new defect.

## R01 (P2) — Give the continuation a separate roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, "This roadmap continues the completed Polynomial Galois Groups roadmap"; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:17`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** the roadmap is, by its own summary, an extension of a completed roadmap, and the binding principle is that extensions are Part roadmaps. The head still files the extension under the completed base's folder name and Lean namespace, so "PolynomialGaloisGroups, Layer 1" names both the base's permutation representation and this roadmap's radical criterion. The change since 93a4832 does not touch this.

**Witness:** `Completed/PolynomialGaloisGroups/Suggested.lean:60` opens the same namespace `TauCetiRoadmap.PolynomialGaloisGroups`; `Completed/PolynomialGaloisGroups/README.md:532` makes Layer 1 the permutation theory while this README's line 122 makes Layer 1 the radical criterion. The folder also carries the base's generated `STATUS.md` (coverage "Layer 1 … done") and `PROGRESS.md`, which now describe a different Layer 1 from the one this README states. The open Part II (`TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:21`, namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartII`) already consumes "Polynomial Galois Groups Layers 0–1" meaning the base.

**Exact repair:** as in the previous review: move the three layers to a separately named Part (the next free number after the existing Part II, whose ramified-merging scope is disjoint from this one) with the matching folder and `namespace`, keep the introduction that says where the base stops, and keep every statement as it is. Retest: the Part II citation of "Layers 0–1" must still resolve to the base's permutation theory; the three Lean names of this roadmap must then live in a namespace no completed file opens. Not repaired at this head: carried from the previous report's R01.

## R02 (P3) — Record the three sources in a manifest

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:310`–317, "Source id `milne-fields`", "`dummit-quintics`", "`chapman-quintics`".

**Claim:** the README names three source ids and §3.1 cites "lines 8–30 of `chapman-quintics`", but the folder has no `sources.toml`, so the ids resolve to nothing a reader of the repository can open. The locator half of the previous R03 (a source for §2.2) is repaired; the manifest half is not.

**Witness:** `ls TauCetiRoadmap/PolynomialGaloisGroups/` lists `PROGRESS.md README.md STATUS.md Suggested.lean metadata.toml` and no manifest. All three works are legally readable: Milne v5.10 at the author's page (Theorem 5.34 at printed p. 77, Proposition 4.16 at p. 52), Dummit's author's copy (Theorem 1 at p. 389), Chapman's note on Dummit's page (lines 16–30).

**Exact repair:** add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one entry per work under the ids the README already uses, each with authors, title, year, `locator_scheme`, locator and `cited_for` (§1.1, §2.1, §2.2, §2.3 for Milne; §3.2 and the Conventions for Dummit; §3.1 for Chapman), recorded through the sources service so that `url`, `fetched_from`, `sha256` and `licence_class` are filled in. Partly repaired: carried from the previous report's R03.

## Previous findings

- R01 — not repaired: `README.md:3` "This roadmap continues the completed Polynomial Galois Groups roadmap"; `Suggested.lean:17` `namespace TauCetiRoadmap.PolynomialGaloisGroups`. Re-raised above as this report's R01.
- R02 — repaired: `Suggested.lean:55` `isSolvable_gal_iff_exists_rootSet_mem_solvableByRad` with `(hq : Irreducible q)`, and `Suggested.lean:64` `not_mem_solvableByRad_of_prime_degree_two_nonreal` with irreducibility, `q.natDegree.Prime`, `5 ≤ q.natDegree` and the root-count hypothesis. Both elaborate; both match §§2.2–2.3 word for word; neither closes under a one-tactic probe (below).
- R03 — partly repaired: §2.2 now cites "Milne, Theorem 5.34, p. 77, with the irreducible some-root deduction" (`README.md:197`), which is the right locator; no `sources.toml` was added. Re-raised as this report's R02 (P3).
- R04 — repaired: `README.md:287` "Irreducibility cannot be omitted in 3.1: `X⁵ − X` over `ℚ` is separable but reducible". The Check now names the hypothesis the theorem assumes.

## Verified sound

**Scope of this pass.** The diff since 93a4832 touches: the Summary's clause "for an irreducible polynomial" (line 8); the `Polynomial.rootSet` file citation (lines 71–73); "for some `n ≠ 0`" in the Layer 1 negative control (line 165); §2.2 (name and locator); §2.3 (name and the explicit form of the two-nonreal-roots hypothesis); a new reducible negative control for 2.3 (lines 228–229); the §3.1 Check wording (line 287); and the two new Lean theorems (`Suggested.lean:52`–68). Every one of these was checked below. Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PolynomialGaloisGroups'` is empty) and the worktree is clean.

**Gate.** The worker's gate at a099640 reports every scanner, the dependency check, the metadata check, the outside-folder check, the stray-file check and the targeted build passing (`build=0 OK`). The dependency check run for this review printed exactly:

```text
depcheck: 208 roadmaps, 1457 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The `*Needs:*` lines of §§2.2 and 2.3 cite only 2.1 and pinned Mathlib declarations; Layer 2's Dependencies line is "Layer 1; Mathlib"; no supplier later in the merge order is named anywhere.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean` exited 0 with exactly seven `declaration uses sorry` warnings (lines 32, 46, 55, 64, 76, 85, 94) and the one intended `#check` output. A scratch copy with `#check @name` for all **seven** declarations elaborated; the printed types carry every binder the README states: `CharZero F` on the three Layer 2 theorems and the radical form of Layer 3, `Irreducible q` on the some-root theorem, `Irreducible q`, `Nat.Prime q.natDegree`, `5 ≤ q.natDegree` and `Fintype.card (q.rootSet ℂ) = Fintype.card (q.rootSet ℝ) + 2` on the obstruction, `Monic`, `Irreducible`, `natDegree = 5` and `(5 : F) ≠ 0` on the separation and group-form theorems. No section variable was lost (the file has none). The worker's signature failure was the missing object file of the imported Tau Ceti module, as in the previous round; it is built in this worktree and the direct elaboration succeeds.

**Padding probes on the two new theorems.** `simp`, `rfl` and `infer_instance` were each tried on `isSolvable_gal_iff_exists_rootSet_mem_solvableByRad` and on `not_mem_solvableByRad_of_prime_degree_two_nonreal`: **6 trials, 0 closures** (`simp made no progress`, `rfl` not a binary relation or not definitional, `type class instance expected`). The only one-lemma step available at the pin is the radical-to-solvable direction of the some-root theorem (`isSolvable_gal_of_irreducible` with `mem_rootSet`), which a scratch probe did prove in two tactics; the converse direction, which needs Layer 2.1, has no pinned proof, so the equivalence is not padding. The five previously probed theorems are unchanged and keep the previous report's 15-trial result.

**Headline coverage.** The README promises seven outputs (§§1.1, 2.1, 2.2, 2.3, 3.1, 3.2 group form, 3.2 radical form). All seven now appear in `Suggested.lean` (lines 32, 46, 55, 64, 76, 85, 94), each on native carriers, with no definition, stand-in or weakened substitute. The docstring's claim that nothing is omitted for want of a carrier is now true.

**Source sample.** Cache ids used: Milne v5.10 (`milne-fields`), Dummit (`dummit-quintics`), Chapman (`chapman-quintics`), all fetched legally through the service in the previous round and re-opened here.

| Sample | Evidence at this head |
|---|---|
| §2.2, some root (changed) | `milne-fields line 3409`–3410: Theorem 5.34, characteristic 0, "solvable in radicals iff Galois group solvable", on printed page 77 (`line 3403` is the page-77 marker). The irreducible some-root form is the README's own deduction, as it says; it needs 2.1 and `isSolvable_gal_of_irreducible` (`Mathlib/FieldTheory/AbelRuffini.lean:313`, hypotheses: `x ∈ solvableByRad F E`, `Irreducible q`, `aeval x q = 0`). Locator correct. |
| §2.3, prime degree (changed) | `milne-fields line 2217`–2218: Proposition 4.16, irreducible of prime degree `p` in `ℚ[X]`, exactly two nonreal roots, then `G_f = S_p`, on printed page 52 (`line 2203` is the page-52 marker). The pinned statement `Mathlib/Analysis/Complex/Polynomial/Basic.lean:128`–131 has exactly the README's three hypotheses, the root-count one in the README's new explicit form. `Equiv.Perm.not_isSolvable` at `Mathlib/GroupTheory/Solvable.lean:297` needs `5 ≤ Cardinal.mk X`, which is where `5 ≤ q.natDegree` enters. Locator correct. |
| §1.1 (unchanged) | `milne-fields line 3409` (Theorem 5.34), `line 3400` (Lemma 5.33, p. 76, restriction injective `Gal(E′/F′) → Gal(E/F)` at lines 3405–3408). As in the previous report. |
| §2.1 (unchanged) | Theorem 5.34 as above; the `⟸` proof at lines 3411–3420 builds the radical tower over `F[ζ]` with `n = (deg f)!`. |
| §3.1 (unchanged but for the Check wording) | `chapman-quintics line 8`–30: the gap in Dummit's Theorem 1, the two difference identities (lines 18, 22), the sign argument (lines 25–28) and `5x₂ = x₁ + … + x₅` rational (line 30). The README's labelling `(a,b,c,d,e)` is a relabelling of Chapman's `(1,4,3,5,2)`. |
| §3.2 (unchanged) | `dummit-quintics line 102`–105: Theorem 1, irreducible quintic over `ℚ` solvable by radicals iff `f₂₀` has a rational root; page marker `line 82` = PDF page 3 = printed p. 389. `line 31`–32: valid over any field of characteristic different from 2 and 5 (PDF page 1 = p. 387). `line 99`–101: the trinomial sextic, matching the Conventions formula. |

**Pinned declarations opened this round** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, content main `9c6e95d9`): `Polynomial.rootSet` is at `Mathlib/Algebra/Polynomial/Roots.lean:576` (the README's corrected file citation is right; it was wrongly placed in `PolynomialGaloisGroup.lean` before); `galActionHom_bijective_of_prime_degree` at `Mathlib/Analysis/Complex/Polynomial/Basic.lean:128`; `Equiv.Perm.not_isSolvable` at `Mathlib/GroupTheory/Solvable.lean:297`; `isSolvable_gal_of_irreducible` at `Mathlib/FieldTheory/AbelRuffini.lean:313`. No new fully qualified name of this file occurs in `Completed/PolynomialGaloisGroups/Suggested.lean` or in the open Part II's `Suggested.lean` (both grepped for the two new names: no hit).

**Adversarial mathematics.** Rows 1–37 of the previous report (at 93a4832) cover the statements the diff leaves untouched: §1.1 (rows 3–15), §2.1 (rows 1–2, 16–18), §3.1 (rows 22–30, 37), §3.2 (rows 31–36) and the native conventions; their values stand and are carried by reference, since neither the statements nor the Lean signatures they test changed. The rows below are computed anew for every changed statement.

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| §2.2 some-root iff, degree 1 | `q = X − 1` over `ℚ` | `q.Gal` order 1 (solvable); root set `{1}`, `1 ∈ ℚ ⊆ solvableByRad`. `true ↔ true`. | Holds; no positivity hypothesis needed beyond irreducibility (constants are not irreducible). |
| §2.2 some-root iff, quadratic | `q = X² − 2` | Group `C₂`, derived series `2 → 1`; `(√2)² = 2`, so `√2` radical. `true ↔ true`. | Retain. |
| §2.2 some-root iff, nonsolvable | `q = X⁵ − 4X + 2` | Eisenstein at 2; values at `−2,−1,0,1,2` are `−22, 5, 2, −1, 26` (three sign changes); derivative `5X⁴ − 4` has two real zeros `±0.9457…`, so exactly three real roots; group `S₅`, derived series `120 → 60 → 60`. By `isSolvable_gal_of_irreducible` no root is radical. `false ↔ false`. | Retain. |
| §2.2, irreducibility needed | `q = (X⁵ − 4X + 2)(X − 1)` | Some root radical (`1`); `q.Gal` surjects onto `S₅`, not solvable. Unrestricted some-root form: `false ↔ true`. | Hypothesis `Irreducible q` is in the Lean signature (`Suggested.lean:56`) and the README; the Example at line 222 is the negative control. |
| §2.3 obstruction, the intended case | `q = X⁵ − 4X + 2` | `Fintype.card (rootSet ℂ) = 5`, `Fintype.card (rootSet ℝ) = 3`, `5 = 3 + 2`; `natDegree = 5` prime, `5 ≤ 5`; conclusion: all five roots nonradical (row above). | All hypotheses satisfied, conclusion true. |
| §2.3, lower bound needed | `q = X³ − 2` | Complex roots 3, real roots 1, `3 = 1 + 2` holds; prime; but `5 ≤ 3` false. Group `S₃` solvable; roots `2^(1/3) ζ₃ᵏ` radical. | `5 ≤ q.natDegree` cannot be dropped; the README says so (line 211). |
| §2.3, irreducibility needed (new Check) | `q = (X² + 1)(X − 1)(X − 2)(X − 3)` | Expanded `X⁵ − 6X⁴ + 12X³ − 12X² + 11X − 6`, degree 5 prime, `5 ≤ 5`; distinct complex roots `i, −i, 1, 2, 3` (5), real roots `1, 2, 3` (3), `5 = 3 + 2`; splitting field `ℚ(i)`, group `C₂`; `i² = −1 ∈ ℚ` so every root radical. | New Check at line 228 is correct and discriminating: every hypothesis but irreducibility holds and the conclusion fails. |
| §2.3, non-monic input | `q = 2X⁵ − 8X + 4` | Same roots as `X⁵ − 4X + 2`; irreducible in `ℚ[X]` (units are the nonzero constants); same counts `5 = 3 + 2`. | No monicity hypothesis needed; none is stated. |
| §2.3, root-count hypothesis form | `q = X⁵ − 4X + 2` versus `q = X⁵ − X − 1` | First: `5 = 3 + 2`. Second: `X⁵ − X − 1` has one real root (derivative `5X⁴ − 1` vanishes at `±0.6687…`, where the polynomial takes the values `−0.4650…` and `−1.5350…`, both negative, so the graph crosses the axis once), hence `5 ≠ 1 + 2`; the hypothesis fails although the group is still `S₅`. | The hypothesis is sufficient, not necessary; the README claims only sufficiency. |
| Summary clause "for an irreducible polynomial" (line 8) | `isSolvable_gal_of_irreducible`, `isSolvable_gal_minpoly` | Both pinned theorems carry an irreducible polynomial (`Irreducible q` at `AbelRuffini.lean:314`; the minimal polynomial at `:301`). | Wording now matches the pin. |
| Layer 1 negative control, "`n ≠ 0`" (line 165) | `x = ζ₇ + ζ₇⁻¹`, `n = 0` versus `n = 3` | `x⁰ = 1 ∈ ℚ` for every `x`, so without `n ≠ 0` the argument would wrongly conclude `ℚ(x) = E` normal for the trivial reason; with `n ≠ 0` the argument needs an actual power in `ℚ`, and `u³ + u² − 2u − 1 = 0` shows no such power exists for `u ∉ ℚ` (degree 3 is odd). | The added clause aligns the Check with the native `n ≠ 0` in `solvableByRad.rad_mem`. |
| §3.1 Check wording (line 287) | `X⁵ − X` over `ℚ` | `disc = −256 ≠ 0` (separable), reducible; sextic `(X − 2)⁴ (X² + 16)`, gcd with its derivative `(X − 2)³ ≠ 1`. | "Irreducibility cannot be omitted" is the correct hypothesis name; R04 repaired. |
| `rootSet` citation (lines 71–73) | file lookup | `def rootSet` at `Mathlib/Algebra/Polynomial/Roots.lean:576`; not in `PolynomialGaloisGroup.lean`. | Corrected citation is right. |

**Ownership.** The two new theorems were searched by object (radical closure membership of roots, prime-degree symmetric action with a radical conclusion) in the completed base, the open Part II at its head and the pinned libraries: the base's acceptance file has neither; Part II's scope (`README.md:15`–54 at its open head) is ramified cycle types; Mathlib has only the radical-to-solvable direction. This roadmap is the owner of both statements, as the previous review concluded for the all-roots form.

## Not verifiable

- Ownership against open pull requests whose files this brief does not provide was not checked; the service index lists another revision of the base folder (the pull request the description refers to), which is not a supplier and was not read.
- The seven admitted theorems remain unproved; elaboration and the instance computations above establish their signatures and the tested instances, not the universal statements.

## Source issues

- none new this round. The four items of the previous report (the Chapman gap in Dummit's Theorem 1 proof, p. 389; the sign misprint in Dummit's second example, p. 399; the `F× → F×` misprint in Milne Proposition 5.27, p. 74; "Theorem 5.27" for Proposition 5.27 in Milne's proof of Theorem 5.34, p. 77, visible at `milne-fields line 3419`) stand.
