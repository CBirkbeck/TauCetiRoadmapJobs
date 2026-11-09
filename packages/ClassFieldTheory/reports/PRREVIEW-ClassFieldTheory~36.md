# Review of ClassFieldTheory (pull request #617 at 2670a4e)

**Verdict:** needs changes

Incremental re-review. `TauCetiRoadmap/ClassFieldTheory/` is byte-identical to 39e8628 (0 changed
lines); the commit since then touches only `TauCetiRoadmap/QuadraticFormInvariants/`. None of the five
previous findings is repaired, so all five are carried below. All are P3; none blocks. The push gate
still fails on `outside-folder`, so this folder cannot be accepted this round.

## R01 (P3) — the push gate fails on files outside the pull request's roadmap folders

**Location.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/{ClassFieldTheory,
IntegralLattices, QuadraticFormInvariants}`: `Completed/LocalFieldsRamification/{COMPLETION.md,
README.md, Suggested.lean}`, `Completed/LocalGaloisGroups/README.md` (gate-listed) and
`Completed/LocalGaloisGroups/Suggested.lean` (12 lines, no longer listed by the gate).

**Claim.** The worker's gate at this head reads `outside-folder=4 … build=0 FAIL`, and every
inside-folder count is 0. The pull request's metadata names `LocalFieldsRamification` as its
subject, but that roadmap is under `Completed/` on main. The brief names only `IntegralLattices` and
`QuadraticFormInvariants` as this pull request's own folders.

**Witness.** gate.md: "outside-folder (4) – Completed/LocalFieldsRamification/COMPLETION.md, …/README.md,
…/Suggested.lean, Completed/LocalGaloisGroups/README.md".

**Repair.** A human decides whether the `Completed/` edits belong to this pull request. If they do,
the brief lists them and the gate passes; if not, they move to a separate pull request. Nothing in
this folder changes.

## R02 (P3) — two open pull requests change this roadmap and state the same open targets differently, with no stated order

**Location.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` lines 322–326, 593–595 and 602–607.
The pull request description has no merge-order sentence that names #1215 or #1411.

**Claim.** #1215 (head 3ef2860) and #1411 (head 26b1788) both conflict with this head in `README.md`
and `Suggested.lean`.
- #1411 `Suggested.lean` line 401 states `algebraMap_vle_algebraMap_iff_of_finite_padic`, which is
  `valuativeExtension_of_finite` at `K = ℚ_p`. Its lines 684 and 694 give its own
  `isPrincipal_map_hilbertClassField` and `relDiscr_eq_finprod_abelianConductor`.
- #1215 states `isPrincipal_map_hilbertClassField` (line 145) and the exponent form
  `count_relDiscr_eq_finsum_abelianConductor_exponent` (line 156), together with
  `abelianConductor_eq_lcm` (line 170).

**Witness.** overlaps.md: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`,
`TauCetiRoadmap/ClassFieldTheory/Suggested.lean`", and the same for #1411. The description's only
merge-order sentence names #1410.

**Repair.** In the merge-order paragraph of the pull request, state which of #617, #1215 and #1411
merges first for this folder. The later ones rebase onto it and keep one statement of each shared
target.

## R03 (P3) — four Tau Ceti declarations are cited in files that do not contain them at the pin

**Location.** README.md lines 911–912: "`TauCeti.relDiscr`, `TauCeti.multiplicity_relDiscr`
(`TauCeti/RingTheory/DedekindDomain/Discriminant/Valuation.lean`)". Lines 918–922 cite
`abelianConductor`, `isAdmissibleModulus_abelianConductor`,
`isAdmissibleModulus_iff_abelianConductor_dvd` and
`IsAdmissibleModulus.conductorExponent_le_exponent` together under "(`…/Global/AdmissibleModulus/Ramification.lean`)".

**Claim.** At the Tau Ceti pin, only `multiplicity_relDiscr` and `conductorExponent_le_exponent` are
in the cited files.

**Witness.** `relDiscr` is at `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean` line 33.
`abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd` and
`isAdmissibleModulus_abelianConductor` are at
`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean` lines 193, 200 and 208.

**Repair.** Cite `relDiscr` with `Discriminant/Basic.lean` and the three conductor declarations with
`AdmissibleModulus/Basic.lean`. Keep `Valuation.lean` for `multiplicity_relDiscr` (line 52) and
`Ramification.lean` for `conductorExponent_le_exponent` (line 116).

## R04 (P3) — nine re-exported theorems that no consumer's Lean file uses

**Location.** `Suggested.lean`:
- line 125 `tateTheorem`
- line 145 `ClassFormation.artinMap_conj`
- line 294 `bijective_muNRepToTateDual`
- line 300 `tateDualityPairing_muNRepToTateDual`
- line 335 `finite_H`
- line 344 `tateDualityPairing_perfect_mixed`
- line 434 `denseRange_artinMap`
- line 446 `unramifiedCoordinate_artinMap`
- line 468 `artinMap_restrict`

README.md line 1141: "The Lean files of `LocalGaloisGroups` and `GlobalQuadraticForms` import
`Suggested.lean` and use the following names".

**Claim.** Each of the nine closes by one `exact` of the Tau Ceti theorem it names. No `.lean` file
under `TauCetiRoadmap/` or `Completed/` outside this folder contains any of the nine names, at this
head or on main. So the §6 sentence is false for them, and under the acceptance-test rule they are
padding.

The seven declarations that only these nine use go with them:
- line 168 `absoluteGaloisGroupComparison`
- line 256 `localSymbol`
- line 274 `instFactIsSmoothDiscreteTateDual`
- line 282 `tateDualityPairing`
- line 399 `restrictAbsolute`
- line 441 `unramifiedCoordinate`
- line 455 `localArtinMap`

Only one Lean file anywhere uses any of the nine. Open pull request #1187 has a stale copy of
`LocalGaloisGroups` under `TauCetiRoadmap/` (its lines 568–600), which uses three of them. That pull
request revises a roadmap that is now completed, so it is not a consumer.

**Witness.** `grep -rlw` over every `.lean` file under `TauCetiRoadmap/` and `Completed/`, run per
name, finds nothing outside this folder.
- `Completed/LocalGaloisGroups/Suggested.lean` (line 11 imports this module) uses `GalRep`, `H`,
  `muNRep`, `kummerEquiv_mixed`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`, `artinMap`,
  `artinMap_norm` and similar names, but none of the nine.
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` lines 55–92 use only the idele, norm and
  Hilbert names.

**Repair.** Delete the nine theorems and the seven declarations only they use from `Suggested.lean`.
List each under "Earlier identifiers, old → new" with its Tau Ceti name, for example
`finite_H → TauCeti.ClassFieldTheory.finite_H`. Remove them from:
- the §6 table;
- the `absoluteGaloisGroupComparison` bullet in §2.7;
- the `localSymbol` definition in Layer 5;
- the `restrictAbsolute` definition in Layer 7.

Their Checks stay, as prose about Tau Ceti's names. If instead they are kept for the completed
roadmap's prose contract, replace the Lean-usage claim in §6 with a sentence that says so.

## R05 (P3) — the module docstring's universe claim is false for Layer 0

**Location.** `Suggested.lean` lines 60–62: "Everything except the valuation comparison is stated in
universe `0`".

**Witness.** The elaborated types at this head (`#check @`) show that
`TateCohomology.projective_ker_of_isZero_res` and `primaryComponent_tateCohomology_eq_bot` are
universe-polymorphic. Both have `{k G : Type u_1}` with `Rep.{u_1, u_1, u_1} k G`, from
`universe u` at line 74.

**Repair.** Replace the sentence with: "The two Layer 0 theorems and the valuation comparison are
universe-polymorphic; everything else is in universe `0`".

## Previous findings

- R01 — not repaired: the gate at 2670a4e reads "outside-folder=4 … FAIL" on
  `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and
  `Completed/LocalGaloisGroups/README.md`; carried as R01.
- R02 — not repaired: `Suggested.lean` 322–326, 593–595, 602–607 unchanged; #1215 and #1411 still
  conflict and restate the three open targets; the description names only #1410; carried as R02.
- R03 — not repaired: README 911–912 still pairs `TauCeti.relDiscr` with `Discriminant/Valuation.lean`,
  918–922 still pairs `abelianConductor` with `AdmissibleModulus/Ramification.lean`; carried as R03.
- R04 — not repaired: the nine re-exports are still at `Suggested.lean` lines 125–473, and README
  line 1141 still says the consumers' Lean files use them; carried as R04.
- R05 — not repaired: `Suggested.lean` line 60 still reads "Everything except the valuation
  comparison is stated in universe `0`"; carried as R05.

## Verified sound

**Change set.** `git diff 39e8628 HEAD -- TauCetiRoadmap/ClassFieldTheory` is empty. The only change
since then is `TauCetiRoadmap/QuadraticFormInvariants/{README.md, Suggested.lean}`: 151 and 25 lines,
reviewed separately. I checked what that change does to this folder:
- It retires QuadraticFormInvariants' `hilbertSymbol_productFormula` alias. No such name occurs in
  this README or `Suggested.lean`.
- QuadraticFormInvariants still cites "TauCetiRoadmap.ClassFieldTheory ([Layers 5 and 14])"
  (its README lines 98–104 and 341–353). That matches §6 here (README line 1123) and the scope
  paragraph (lines 81–85), including the direction `ClassFieldTheory → QuadraticFormInvariants`.
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` uses none of the retired names; its uses of
  this module are lines 4 and 55–92.

**Gate.** The worker's gate at 2670a4e has every inside-folder count 0, including `build=0`, and
`outside-folder=4 FAIL` (R01). I re-ran the gate: `statement-hygiene=0`, `stray-files=0`,
`depcheck=0`, `imports=0`. My run lists outside-folder 9, because it also counts the two sibling
folders that the worker's run treats as the pull request's own. `PROGRESS.md`, `STATUS.md` and
`metadata.toml` are in this folder on main too.

**Dependency check.** Run this round: `depcheck: 235 roadmaps, 2256 edges, 0 problem(s)`, with no
UPWARD or CYCLE line.

**Elaboration.** I elaborated a scratch copy of `Suggested.lean` with `lake env lean` from the
worktree (18.9 s, all 25 `TauCeti.*` imports built at the pin). Its diagnostics were:
- `declaration uses sorry` at lines 322, 593 and 602, which are the three open targets;
- the three probe failures below.

Nothing else was reported. `#check @` printed:
- `valuativeExtension_of_finite` in `Type u_1`/`Type u_2`;
- `isPrincipal_map_hilbertClassField`, which has `K : Type` with `[NumberField K]`;
- `relDiscr_eq_finprod_abelianConductor`, which has `[IsAbelianGalois K L]` and the product over
  `IsCyclic Gal(↥M/K)`;
- `hilbertProductFormula`;
- the two Layer 0 theorems, which are universe-polymorphic (R05).

Each agrees with its README statement. No section binder is lost: `signatures.md` reports 0 of 61,
and I found none.

**Padding probe.** I probed each open target on a scratch copy:
- `valuativeExtension_of_finite`: `first | infer_instance | simp` fails.
- `isPrincipal_map_hilbertClassField`: `first | infer_instance | rfl | simp` fails.
- `relDiscr_eq_finprod_abelianConductor`: `first | rfl | simp` fails.

None of the three is padding; the one-`exact` re-exports are R04.

**Seeded sample.** Every sampled passage is untouched; the previous review checked them at the text.
I re-opened the Milne CFT locators:
- V Theorem 3.17 is at milne-cft line 7252 (the principal ideal theorem, PDF page 170 = printed 161).
- Theorem 3.27 is at line 7423 and Remark 3.28 at line 7436: the discriminant is the product of the
  finite parts of the characters' conductors, and the conductor of a character is that of the
  fixed field of its kernel.
- Example 8.2 is at lines 10059–10075: the local symbol acts by `[p^s]` at `p ≠ ℓ` (line 10072) and
  by `[u⁻¹]` at `ℓ` (line 10075). These are the README's arithmetic-Frobenius normalization and
  `χ_cyc(Art(u)) = u⁻¹`.

The README flags no locator as unverified.

**Library declarations opened at the Tau Ceti pin.**
- `relDiscr`: `RingTheory/DedekindDomain/Discriminant/Basic.lean` 33.
- `multiplicity_relDiscr`: `…/Discriminant/Valuation.lean` 52.
- `abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`,
  `isAdmissibleModulus_abelianConductor`: `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean`
  193, 200, 208.
- `conductorExponent_le_exponent`: `…/AdmissibleModulus/Ramification.lean` 116.
- `brauerGroupEquivBr`: used in `NumberTheory/LocalField/Quaternion/Invariant.lean` lines 17 and 80.

**Cross-roadmap citations resolved.**
- QuadraticFormInvariants at this head, as above.
- GlobalQuadraticForms on main: its `Suggested.lean` lines 4 and 55–92.
- `Completed/LocalGaloisGroups/Suggested.lean` line 11 imports this module.
- #1215 at 3ef2860 (lines 145, 156, 170) and #1411 at 26b1788 (lines 401, 684, 694) for R02.
- #1187 at 66ed0d4: its `LocalGaloisGroups/Suggested.lean` lines 568–600, for R04.

overlaps.md lists no dropped ids and no ids that only an open revision defines; I confirmed both
against the README's citations.

**Remark on untouched text (no change asked).** QuadraticFormInvariants now also consumes
`TauCeti.ClassFieldTheory.brauerGroupEquivBr`. §6 of this README (line 1123) summarizes its
consumption as "the cohomological local symbol, the local invariant and the Hilbert product
formula". That summary still covers it, since the declaration is the domain of the local invariant.

**Adversarial table.** No statement changed, so the rows below are carried from the review of
39e8628 (PRREVIEW-ClassFieldTheory~35). Rows marked † were recomputed this round, with the same
values.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `valuativeExtension_of_finite`, route | `K = ℚ₂`, `F = ℚ₂(i)`, `u = −3`, `ℓ = 3` | `u^{q−1} = −3 ≡ 1 mod 2`; `X^{3^k} − (−3)` has derivative `3^k` (unit) at `1`; `(q−1)·w(u) = w(u) ∈ 3^k ℤ` ∀k ⇒ `w(u) = 0`; `w(2) = 2 > 0`; `2 ≤ᵥ 1` on both sides, `1 ≤ᵥ 2` on neither | holds; normalized values differ (`2` vs `1`) as the README says |
| same, `ℓ = p` | `K = ℚ₂`, `u = 3`, `ℓ = 2` | `3 ≡ 3 mod 8` not a square | route needs `ℓ ≠ p`, as stated |
| same, inseparable | `K = F = 𝔽_p((t))`, `t ↦ t^p` | degree `p`; `w(t^p) = p > 0`; min. polynomial `X^p − t` with `c₀ = −t` | holds without separability |
| same, trivial relation on `F` | `1 ≤ᵥ ϖ` true in `F`, false in `K` | excluded by `IsNontrivial` in `IsNonarchimedeanLocalField F` | negative control correct |
| same, `w(ϖ) = 0` branch | `α` with `w(α) < 0` | `w(αⁿ) = n w(α) < i w(α) = w(c_i α^i)`, `i < n` | sum cannot vanish; branch closes |
| `eulerCharacteristic_mixed` | `ℚ_p`, `ℤ/p`, `p` odd | `#H⁰ = p`, `#H² = #μ_p(ℚ_p) = 1`, `#H¹ = p²`; RHS `p·1·p^{1·1} = p²` | equal |
| same | `ℚ₂`, `ℤ/2` | `2, 2, 8`; `2·2·2 = 8` | equal |
| same | `ℚ_p`, `ℤ/ℓ`, `ℓ ∤ p(p−1)` | `ℓ, 1, ℓ`; `ℓ·1·p⁰` | equal |
| same, non-trivial action | `ℚ₂`, `ℤ/3` with Frobenius `−1` | `#H⁰(A) = 1`, `A ≅ μ₃`, `#H⁰(Aᴰ) = 3 = #H²(A)`; trivial `ℤ/3`: `3` and `1` | both agree with duality |
| `eulerCharacteristic_finrank_fp` | `ℚ₂`, `𝔽₂` | `dim H¹ = 3 = 1 + 1 + 1·1` | equal |
| `finite_H` hypothesis | `𝔽₂((t))`, `𝔽₂`, `n = 2` | `H¹ = F/℘(F)` infinite (`t⁻¹, t⁻³, …` independent); `(2 : F) = 0` excluded | hypothesis necessary |
| `cyclotomicCharacter_artinMap` | `p = 2`, `u = −1`; `u = −3` on `μ₁₆` | `(−1)⁻¹ = −1`; `(−3)⁻¹ ≡ 13⁻¹ ≡ 5 mod 16` (`13·5 = 65`), not `13` | arithmetic convention detected |
| same | `K = ℚ₂(i)`, `u = i` | `N(i) = i·(−i) = 1` ⇒ trivial on `2`-power roots | holds |
| Milne Ex. 8.2 vs §2.6 † | `a = u ℓ^s` | `φ_ℓ(a) = [u⁻¹]` (milne-cft line 10075), `φ_p(a) = [p^s]` for `p ≠ ℓ` (line 10072) | same normalization |
| `isPrincipal_map_hilbertClassField` † | `K = ℚ(√−5)`, `H = ℚ(√−5, i)` | `𝔭₂² = (2)`, `(1+i)² = (2i)` ⇒ `𝔭₂𝓞_H = (1+i)`; `𝔭₂𝔭₃ = (1+√−5)` ⇒ `𝔭₃𝓞_H = ((1+√−5)/(1+i))`; no `x²+5y² ∈ {2, 3}` | both non-principal primes become principal |
| same, degenerate | `K = ℚ`; `I = 0` | `H = ℚ`, every ideal principal; `0` maps to `0`, principal | holds |
| `relDiscr_eq_finprod_abelianConductor` † | `ℚ(ζ₅)/ℚ` | cyclic `M`: `ℚ` (`φ(1) = 1`, `𝔣₀ = 1`), `ℚ(√5)` (`φ(2) = 1`, `5`), `ℚ(ζ₅)` (`φ(4) = 2`, `5`): `1·5·5² = 125 = 𝔡` | equal |
| same † | `ℚ(ζ₈)/ℚ` | `Gal = V₄`, so `L` itself is not cyclic and is excluded; `ℚ, ℚ(i), ℚ(√2), ℚ(√−2)`: `1·4·8·8 = 256 = 𝔡` | equal |
| same | `ℚ(i)/ℚ` at `2` | local exponents `0, 2`; `𝔣 = 4·∞`, exponent `2`; `𝔡 = (4)` | equal |
| same | `ℚ(√5)/ℚ` at `2` | inert, exponents `0`; `2 ∤ (5)` | equal |
| same, degenerate † | `L = K` | `relDiscr = ⊤`; only `M = ⊥`, trivial group cyclic, `φ(1) = 1`, `(𝔣 1).finitePart^1 = ⊤` | equal |
| same, step 1 | `ℚ(ζ₅)` at `5` | `g = 1`, `f = 1`, `d = 3`: `multiplicity = 1·3 = 3 = δ` | agrees with `multiplicity_relDiscr` |
| same, step 3 | `D ≤ G` abelian | restriction `Ĝ → D̂` onto with fibres `#(G/D)^ = g` | correct |
| same, step 2 | `ℚ₅(ζ₅)/ℚ₅`, tame | characters' Artin exponents `0, 1, 1, 1`, sum `3 = δ` | agrees |
| §2.3 fundamental class | `[U:V] = 4`, `[U:U'] = 2`, `[V:V'] = 3` | `inv(res u) = 2·¼ = ½`; `cor = 2·u_{U,V}`; `inv(u_{U,V'}) = 1/12`, `3·(1/12) = ¼` ⇒ `inf = 3·u_{U,V'}` | consistent |
| Tate's criterion, Layer 0 | `C₂` on `ℂˣ` by conjugation; trivial `ℤ/2` | `H¹ = 0`, `H²` order 2, `Ĥ⁻²(C₂, ℤ) = C₂`; `H¹(C₂, ℤ/2) = ℤ/2 ≠ 0` | criterion applies / fails as stated |
| Tate–Nakayama hypothesis | `M = ℤ/2`, `C = ℂˣ` | `Tor₁ = ℂˣ[2] = μ₂ ≠ 0` | excluded as stated |
| `kummerEquiv_mixed` | `ℚ₂`, `n = 2`; `−7`; `−1`; `ℚ₃` `n = 2, 1` | `8` classes; `−7 ≡ 1 mod 8` square; cocycle of `−1` sends `i ↦ −i` to `−1`; `4`, `1` | agrees |
| `h2MuEquivZMod_mixed` | `ℚ₂`, `n = 1, 2, 3`; `ℚ₇`, `n = 3` | orders `1, 2, 3`; invariant `1/3 ↦ 1`, the other equivalence `↦ 2` | normalization fixed by the invariant |
| `h2FpEquivZMod_of_mu` | `T = 0`; `p = 3`, `e ∘ inv` | `#μ_p = p ≠ 1`, no `e`; `H²(0) = 0 ≄ ℤ/p`; negated | `e` is data |
| `kummerCupPairing` | `n = 2`, `ζ = −1`; `n = 0`; `ℚ₇`, `n = 3`, `ζ` vs `ζ²` | `(−1,−1) ↦ −1`, `(1, y) ↦ 1`; `log_{ζ²}(ζ) = 2` ⇒ `(ζ,ζ) ↦ ζ²` | root is data; `n = 0` branch total |
| `localSymbol` | `ℚ₂`, `(−1,−1)`, `(5,−1)` | `(−1,−1)₂ = −1 ↦ 1`; `5 = 1²+2²` norm from `ℚ₂(i)` ↦ `0` | agrees with the quadratic Artin test |
| `restrictAbsolute` | `ℚ(i)/ℚ`; `X³−2`, `iota ∘ τ` | conjugation `i ↦ −i`; a transposition fixing `∛2` conjugated by `τ` fixes `τ⁻¹∛2 ≠ ∛2` | embedding is data |
| §5.6 transfer | `C₄ = ⟨g⟩ ⊃ ⟨g²⟩`; `V₄ ⊃ C₂` | `V(g) = g²`; `V(g) = g² = 1` on `V₄` | distinguishes transfer, inclusion, quotient |
| `card_ideleClassNormQuotient` | `ℚ(√5)/ℚ`; `L = K` | index `2 = [L:K]`; `1` | agrees |
| Layer 10 lift obstruction | `ℚ(√13, √17)` | at `2`: `13 ≡ 5`, `17 ≡ 1 mod 8`; at `13`: `17 ≡ 2²`; at `17`: `13 ≡ 8²`; `H²(G, I_L)` killed by `2`, `H²(G, C_L) ≅ ℤ/4` | no lift for a generator |
| Hasse norm failure | `25` in `ℚ(√13,√17)` | local norm everywhere (`13·17 ≡ 1 mod 5`, `v₅ = 2`); not a global norm | principle fails for `V₄` |
| Layer 12 intersection formula | two `D₄`-fields with common biquadratic `B` | `G = D₄ ×_{V₄} D₄`, order `16`, `[G,G]` order `2`, `G^{ab}` order `8`; `N(L₁) ∩ N(L₂) = N(B)` index `4` | formula needs abelian layers |
| ray-class criterion | `𝔪 = 4·∞` over `ℚ`; `𝔪 = 4` | `(5)` splits in `ℚ(i)`; `(3)` inert; at `4`: group trivial | real place needed |
| Hilbert criterion | `ℚ(√−5)`; `ℚ(√3)` | one prime above each non-principal prime, two above norm `29`; `(√3)` inert in `ℚ(√3, i)` | class group, not narrow |
| Hilbert reciprocity | `(3,7)`; `(−1,−1)` over `ℚ` | `0, 1, 0, 1` at `∞, 2, 3, 7`, sum `0`; `1, 1` at `2, ∞` | sums vanish |
| ring class fields | `ℤ[√−3]`, `ℤ[2i]` | `h(−12) = h(−16) = 1` | ring class field is `K` |
| unramified normalization | `ℚ₂(ζ₅)`, `Art(8)`, `Art(2)`; `K = ℚ₂`, `m = 2` | `ζ₅ ↦ ζ₅³`; `ζ₅ ↦ ζ₅²`; identity fixes `−1` while `(−1)² = 1` | `m` prime to `q` needed |
| Layer 7 conductors, Kronecker–Weber | `ℚ(√5)`, `ℚ(i)`, `ℚ(√2)` | least levels `5, 4, 8`; `ℚ(∛2, ζ₃)` ramifies at `2` | abelianity needed |

## Not verifiable

- Artin–Tate, *Class Field Theory* (waived). Serre, *Local Fields* and *Galois Cohomology*;
  Neukirch, *Algebraic Number Theory*; NSW, *Cohomology of Number Fields*; Engler–Prestel, *Valued
  Fields* (uncertified). All are cited by locator only, as the manifest settles them.
- Brown, *Cohomology of Groups* VI §8; Rim 1959; Lang, *Algebra* III 7.1; Cox §§7, 9; Weil 1951;
  Tate, Corvallis. These are background citations in §8 with no manifest entry, and were not read.
- Ownership against open pull requests: I checked against the sibling checkouts the brief lists,
  and through `roadmaps grep` and `roadmaps show` for #1187, #1215 and #1411.

## Source issues

- none
