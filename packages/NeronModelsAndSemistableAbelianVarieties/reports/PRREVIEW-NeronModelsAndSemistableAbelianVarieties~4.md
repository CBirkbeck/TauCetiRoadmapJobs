# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at 12643b0)

**Verdict:** needs changes

Incremental re-review of the 43 lines changed since 753e52a (one commit, README only: the Scope bullet that now names PadicMeasuresIwasawaAlgebras §5.1, the §2.3 Chevalley passage, and the §5.3d determinant-of-cohomology target), plus everything that cites those passages (§5.3e, the supplier contracts, Layer 2 and Layer 5 dependencies), the gate, the elaboration, and every finding of the previous report. The two blocking findings below are carried from the previous report, unrepaired at this head; the diff itself is sound.

## R01 (P2) — Excellence still narrows the principal reduction theorems

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1664 "Let `R` be an excellent discrete valuation ring", likewise 1708, 1736, 2850 and 2912 (§§3.10, 3.11, 3.12, 5.1, 5.2).

**Claim:** potential semistability, the monodromy and full-level criteria, Néron–Ogg–Shafarevich and isogeny invariance of good reduction are stated only over excellent DVRs.

**Witness:** conrad line 321 opens §4 with an arbitrary DVR; the word "excellent" occurs nowhere in conrad (searched the whole extraction). conrad lines 348–352: `R′` is module-finite over `R` by separability of `K′/K`, no excellence needed. `LocalExistence` in Suggested.lean already has the arbitrary-DVR scope.

**Repair:** as in the previous report (its R02): state §§3.10–3.12, 5.1 and 5.2 over an arbitrary DVR, henselian where a chosen inertia action is used, with the henselisation descent already written in §§3.1 and 5.2; replace the excellence-based finiteness sentence at line 1684 by finiteness of the integral closure in a finite separable extension (trace-lattice argument, or SchemeAndStackFoundations §§0.20–0.21 at its separable-finiteness statement). Instances that must still pass: the zero abelian variety over any DVR has model `Spec R` and extension degree one; a split Tate curve has `N ≠ 0`, `N² = 0`; a good model and every isogenous abelian variety have trivial inertia. None of these uses excellence. Re-raised from the previous report's R02; no repair report marks it not actionable.

## R02 (P2) — GoodIsogeny is statable at the pins but absent from Suggested.lean

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean:35–37 "The excellent-DVR hypothesis in the good-reduction isogeny theorem also has no predicate at the pins"; README §5.2 (line 2912).

**Claim:** the docstring says the isogeny-invariance headline cannot be stated against the pins.

**Witness:** a scratch copy of Suggested.lean with an added `import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`, a real-bodied predicate "there is a smooth proper geometrically connected group-object model of `A` over `Spec R`" (the same conjunction as the second clause of `EquationGoodComparison`), and the theorem "for `f : A ⟶ B` with `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f`, the two predicates are equivalent", over an arbitrary DVR, elaborated with `sorry` as the only warning. `IsIsogeny` is at TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61 (finite and surjective; inseparable isogenies included).

**Repair:** after R01, add that predicate and the theorem `GoodIsogeny` to Suggested.lean (Layer 5 section comment), with `(R K : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] [Field K] [Algebra R K] [IsFractionRing R K]` and the isogeny hypothesis in the signature; drop the excellence excuse from the docstring. Tested instances: identity and `[p]` on a good elliptic curve over `ℤ_p` give (true, true), `[p]` having degree `p²` even when inseparable; a Tate isogeny `E_q → E_{q³}` gives (false, false). Re-raised from the previous report's R03.

## R03 (P3) — The new determinant supplier has no entry under Exact supplier contracts

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:203–207 (Scope bullet) and 3316–3335 (§5.3d); the section `## Exact supplier contracts` (lines 334–635) has no subsection for PadicMeasuresIwasawaAlgebras.

**Claim:** §5.3d imports "the determinant functor on bounded finite-projective complexes over any commutative ring, with its quasi-isomorphism invariance and transitivity, short-exact-sequence, dual, shift and ring-base-change isomorphisms" from PadicMeasuresIwasawaAlgebras §5.1.

**Witness:** main TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md §5.1 supplies exactly `detLine`, `detLine_quasiIso` (with transitivity), `detLine_shortExact`, `detLine_baseChange`, `detLine_dual`, `detLine_shift`, `detLine_acyclic`; its short-exact-sequence isomorphism is stated for degreewise split sequences, and its lines are graded (parity in ℤ/2, Koszul symmetry, rank-one module in degree 0 odd). The README names none of these declarations and does not record the split hypothesis or the parity convention it later "forgets".

**Repair:** add `### From PadicMeasuresIwasawaAlgebras` under Exact supplier contracts naming those seven declarations, stating that short exact sequences are degreewise split (automatic over a DVR: the quotient of a short exact sequence of finite free modules is free) and that the lines are graded with the supplier's parity and Koszul sign, forgotten only at the final ungraded `λ_n`. Instance: `[R --π→ R]` in degrees −1, 0 has `detLine = R` of even parity, rational trivialization coefficient `π⁻¹`, canonical section `π`; the README's order convention must take `ord = 1` on it, which the Tate-curve Check (order `v(q)`) does.

## R04 (P3) — The Chevalley ownership split is stated in a layer, hedged, and points at a roadmap whose direction is unsettled

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1092–1095 "a general Chevalley theorem for possibly noncommutative groups, such as GroupSchemesOverABase GS4.2, restricts to this construction on commutative groups through its comparison theorem".

**Claim:** §2.3 owns the Chevalley decomposition of every smooth connected commutative group over a perfect field; the general theorem lives elsewhere and compares to it.

**Witness:** GroupSchemesOverABase is open pull request #1522 (another author, new roadmap), not in the merge order; its README at that head lists this roadmap's §2.3 as the consumer of its GS4.2 `chevalley` through `chevalley_comm` (its ownership table) and, at the same time, uses this roadmap's §§2.3 and 2.7 in a GS5 Check (the Néron identity component of a split multiplicative Weierstrass model). Its last listed supplier in the merge order is FiniteFlatGroupsAndIntegralPadicHodgeTheory (#36), immediately before this roadmap (#37). The house shape makes `## Scope and ownership` the only place that says "stated by roadmap X"; GroupSchemesOverABase is not mentioned there. No other owner of the commutative case was found on main or at the open heads (search for Chevalley's theorem and maximal connected affine subgroups: only CFSGStatement's structure constants and AdicSpacesPartII's Chevalley constructibility, unrelated).

**Repair:** keep the mathematics of §2.3 (it is correctly the owner of what it needs, since GroupSchemesOverABase cannot be placed before this roadmap while it consumes §§2.3 and 2.7). Move the ownership sentence to `## Scope and ownership`, without "such as": "§2.3 owns the Chevalley decomposition of smooth connected commutative groups over a perfect field; the theorem for noncommutative groups and its comparison with §2.3 are GroupSchemesOverABase GS4.2's." Instances the two statements must agree on: an elliptic curve `(L, B) = (0, E)`; `𝔾_m` gives `(𝔾_m, 0)`; `𝔾_a` gives `(𝔾_a, 0)`; a nonsplit extension of an abelian variety by `𝔾_a` in characteristic 0 has `L = 𝔾_a` while its affinization kernel is everything, so `L` is the maximal smooth connected affine subgroup, not the affinization kernel.

## Previous findings

- R01 — repaired: SmoothRepresentationsOfLocalGroups at its open head now defines *wd-parameter-operations* (its README line 4452) and *wd-frobenius-semisimplification* (line 4558), with "No Frobenius-semisimplicity hypothesis is imposed", `(r,N) ≅ (r,aN)` for `a ≠ 0`, `q ≥ 2`, finite inertia image. Matches README lines 536–538. Supplier-side repair; this folder unchanged there.
- R02 — not repaired: README 1664, 1708, 1736, 2850, 2912 still read "excellent"; written again as R01 above.
- R03 — not repaired: Suggested.lean still states three theorems and its docstring still excuses GoodIsogeny by excellence; written again as R02 above.
- R04 — repaired: §5.3d now imports the determinant functor from PadicMeasuresIwasawaAlgebras §5.1 and keeps only perfectness, base change, the Mumford isomorphism, the discriminant section and the elliptic identification; AlgebraicVectorBundles L0C no longer cited. The supplier's §5.1 verified on main (R03 above records only the missing contract entry).
- R05 — repaired: the worker's gate at this head passes every check (`depcheck=0`, `build=0`); my rerun of the movable dependency check prints `depcheck: 201 roadmaps, 1325 edges, 0 problem(s)` with no UPWARD or CYCLE line.
- R06 — not repaired: README 2673–2679 and 2689, the Layer 4 good-place and two-place exports still *Need* "5.0a–5.0c", which Layer 5 supplies. P3, not blocking; stands.
- R07 — not repaired: README 2808 still "Milne 2008, Ch. I, Prop. 10.20, p. 52, and Ch. IV, Thm 3.5, p. 141"; 3326 still "Liu 1994, Introduction, p. 51". P3; stands.
- R08 — not repaired: README 684–702 and 745–761 still carry backticked API and Check names (`NeronMappingProperty.bijective`, `extend_restrict_test`, …) absent from Suggested.lean. P3; stands.
- R09 — not repaired: §§1.1 and 1.3 Checks unchanged. P3; stands.

## Verified sound

**Scope of this pass.** The diff (27 insertions, 16 deletions, README only; no file outside the folder changed: `git diff --stat origin/main...HEAD` excluding the folder is empty), the three changed passages and their dependants, the previous report's nine findings, the gate, the elaboration, the `#check` audit, the seeded sample where it touches the changed passages (5.3e through its dependence on 5.3d), ownership of the two objects the diff introduces (determinant lines; commutative Chevalley), and the one supplier resolution the diff forced (PadicMeasuresIwasawaAlgebras §5.1 on main).

**Gate.** Worker's gate at 12643b0: every check zero, `OK`. My rerun of the dependency check (movable, against the board's merge order and main):

```text
depcheck: 201 roadmaps, 1325 edges, 0 problem(s)
```

**Build and signatures.** `lake env lean` on TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean (Mathlib and Tau Ceti at the manifest pins, object files present): three `declaration uses 'sorry'` warnings at lines 60, 75, 90 and nothing else, exit 0. A scratch copy with `#check @LocalExistence`, `#check @DedekindExistence`, `#check @EquationGoodComparison` elaborated: each printed type retains the DVR, domain, field, algebra and fraction-ring binders, the integral, Noetherian, integrally-closed-stalk and Krull-dimension-one hypotheses of `DedekindExistence`, and the `IsElliptic` and `IsMinimal` instances of `EquationGoodComparison`, exactly as the README states them. Nothing changed. The same scratch run elaborated the GoodIsogeny probe of R02. The Lean file is byte-identical to the one the previous report probed with one tactic, so the padding verdict (none) carries forward.

**Headline theorems.** Unchanged since the previous report: `LocalExistence`, `DedekindExistence`, `EquationGoodComparison` stated; the other headlines named in the docstring by missing carrier, except GoodIsogeny (R02).

**Supplier resolutions this round, at main or at the cited open head.**

| Supplier and location | Consumed contract and conclusion |
|---|---|
| main TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md §5.1 | `detLine` over any commutative ring on bounded finite-projective complexes; quasi-isomorphism invariance with transitivity; degreewise-split short exact sequences; base change along any ring map; dual; shift; acyclic trivialization with coefficient `det(f)⁻¹`. Supports everything §5.3d imports; contract entry missing (R03). Its own text says AlgebraicVectorBundles L0C imports it, so dropping L0C here reverses no direction. |
| SmoothRepresentationsOfLocalGroups at pull request #1688 head, lines 4384–4572 | raw parameters with a separate semisimplicity predicate; operations including `(r,N) ≅ (r,aN)` for `a ≠ 0`, `q ≥ 2`, finite inertia image, no semisimplicity imposed; Frobenius semisimplification retaining `N`. Repairs the previous R01. Earlier in the merge order (#13). |
| GroupSchemesOverABase at pull request #1522 head, GS4.2 and ownership table | general Chevalley theorem with `chevalley_comm`; lists this roadmap as consumer and consumes §§2.3, 2.7 in a Check; not in the merge order (R04). |
| TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean:132; TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean:50 | `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical` and `HopfIdeal.IsMaximalTorus` exist at the pin, both for affine (Hopf-algebra) groups as §2.3 says. |
| TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56, :61 | `isogenies`, `IsIsogeny`: finite and surjective, inseparable included (R02 probe). |
| TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95–103, :127 | `AbelianVariety` fields `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`; smoothness instance. |

**Source check at the changed passages.** conrad (Stanford notes, 35 pages, extraction in the sources cache): Theorem 2.6 (Chevalley) at line 108, printed p. 3 with proof continuing on p. 4; Proposition 2.16 at line 228, p. 6, parts (1)–(3), with the splitting `T × U` in (2) requiring perfect `k`; Theorem 3.1 at line 259, pp. 7–8, torus-affine-part case with commutativity concluded. All three §2.3 locators correct; hypotheses (perfect field; commutativity only for the splitting) match the README. Conrad §4, line 321: arbitrary DVR (R01 witness). The sampled target 5.3e depends on 5.3d only through `ord Δ_{X/R}`; its Saito locator remains unreadable (below) and its Liu page is the previous R07.

**Adversarial table.** Rows for the changed statements and for every target a finding touches are computed here; rows for the statements the diff leaves untouched are carried from the previous report (its 123-row table), cited as "prev".

| Statement or convention | Instances tried | Computed values | Result / change |
|---|---|---|---|
| Scope bullet: PadicMeasures §5.1 supplies determinant lines "over any commutative ring" | `A = R` a DVR; `A = ℚ[ε]/(ε²)` | supplier's standing assumption is an arbitrary commutative ring; for `[R --π→ R]` in degrees −1,0: `detLine = R`, parity even, trivialization coefficient `π⁻¹`, canonical section `π` | matches; same values as the previous R04 repair asked for |
| §5.3d: `Rf_*ω^n` perfect and finite free | `R` complete DVR, `X` regular proper flat, genus 1 | `R` regular of dimension 1 so every coherent `R`-module has projective dimension ≤ 1; finite projective over a local ring is free; `H⁰(ω)` rank 1, `H¹(ω)` rank 1 | correct; no change |
| §5.3d: short exact sequences degreewise split | `0 → R → R² → R → 0` of finite free `R`-modules | quotient free, hence projective, so the sequence splits in every degree | supplier's hypothesis automatic over a DVR; record it (R03) |
| §5.3d: `λ_1^{13} ⊗ λ_2^{−1}` is the twelfth power of the invariant-differential line for genus 1 | elliptic generic fibre, `ω ≅ O ⊗ ω_E` | `λ_1 = ω_E ⊗ (H⁰(O)^∨)^{−1} = ω_E`; `λ_2 = ω_E^{2} ⊗ (ω_E)^{−1}` via `H¹(ω²) ≅ H⁰(ω^{−1})^∨`; `13·1 − 1 = 12` | exponent 12 consistent with 13 and the Mumford isomorphism; no change |
| §5.3d: order of `Δ_{X/R}` | smooth elliptic reduction; Tate curve `v(q) = 5`; basis change by unit `u`; scaling `x = π²x′, y = π³y′` | orders 0 and 5; `v(u) = 0` leaves order unchanged; scaling multiplies the differential basis by `π⁻¹`, its twelfth power by `π^{−12}`, so the scalar `a` by `π^{12}` and the equation discriminant by `π^{12}`, order of `Δ_{X/R}` unchanged | Checks consistent; no change |
| §5.3d: parity "forgotten only for the final ungraded lines" | `P = R[0]` (odd) and `P ⊕ P[1]` (even) | the ungraded lines agree (`R`), the graded ones differ by parity; the Koszul sign `(−1)^{|L||L′|}` enters only in symmetry isomorphisms, never in the valuation of a scalar | forgetting parity at the end changes no order; no change |
| §5.3e (sampled) Ogg–Saito through 5.3d | `I₅`; `I₀*` tame; `y² = x³ − x` over `ℚ₂` | `5 = 1 + 5 − 1`; `6 = 2 + 5 − 1`; `6 = 5 + 2 − 1` (prev) | unchanged; Saito text not certified (below) |
| §2.3 commutative Chevalley, `t + a + u = g` | elliptic `E`; `𝔾_m`; `𝔾_a`; `E × 𝔾_m` | `(L,B)` = `(0,E)`, `(𝔾_m,0)`, `(𝔾_a,0)`, `(𝔾_m,E)`; `(t,a,u)` = `(0,1,0)`, `(1,0,0)`, `(0,0,1)`, `(1,1,0)`; sums 1,1,1,2 | correct |
| §2.3 wrong model: `L` = affinization kernel | nonsplit extension of `A` by `𝔾_a`, characteristic 0 | affinization `Spec O(G) = pt`, kernel all of `G`, while Chevalley `L = 𝔾_a`, `B = A` | "maximal smooth connected affine subgroup" excludes it; no change |
| §2.3 perfectness | conrad Remark 2.7; `k` imperfect | Chevalley's sequence need not exist; README asserts descent only via 2.4 | correct scope |
| §2.3 splitting `L = T × U` | conrad Prop 2.16(2) | needs `k` perfect; `k` perfect is standing in §2.3 | correct |
| §2.3 noncommutative control | `GL_n` | not commutative, outside §2.3's statement; covered by GS4.2 | ownership split consistent (R04) |
| §5.3 raw Weil–Deligne operations (prev R01) | `F = [[1,1],[0,1]]`, `N = 0`; `F = diag(5,1)`, `N = E₁₂`, `q = 5` | first is admitted (no semisimplicity imposed), `s = I`, `u = F`, `r^{F-ss}(Φ) = I`; second satisfies `FNF⁻¹ = 5N`, and `diag(2,1)` conjugates `N` to `2N`, the supplier's `(r,N) ≅ (r,aN)` with `a = 2` | both inputs admitted at the supplier head; repaired |
| §5.3 normalization transport (prev) | `q = π⁵`, `e_K = 2`, further `e = 2` | `N_K = 5`, `N_p = 5/2`, `N_L = 10`; `10/4 = 5/2` | unchanged |
| §5.2 GoodIsogeny (R02) | identity; `[p]` on good elliptic, `p` = residue characteristic; Tate isogeny | (true,true), (true,true) with `deg [p] = p²` inseparably, (false,false); probe elaborated over an arbitrary DVR | statable; absent |
| §§3.10–3.12, 5.1 excellence (R01) | zero abelian variety over a non-excellent DVR; split Tate curve; good elliptic curve | extension degree 1 and model `Spec R`; `N ≠ 0`, `N² = 0`; trivial inertia on `T_ℓ` | none uses excellence; narrowing stands |
| 1.7 `LocalExistence` (headline) | dimension 0; good elliptic; split `I₅` | `Spec R`; abelian scheme; five components; `#check` type unchanged | correct (prev) |
| 1.9 `DedekindExistence` (headline) | dimension-zero `A` over integral Dedekind `S` | `X = S`; `1 → 1` on terminal Hom sets; binders retained | correct (prev) |
| 6.5 `EquationGoodComparison` (headline, sampled) | `y² = x³ − x` at 5 and 2 | `Δ = 64`, unit at 5, non-unit at 2; flags true/false | correct (prev) |
| 1.2 marked finite-type model (sampled) | zero abelian variety; split rank-one torus | one component, quasi-compact; lft torus components indexed by ℤ | prev |
| 1.3 extension (sampled) | good elliptic model, translation by `P ≠ 0` | extension sends 0 to `P` | prev |
| 2.6 reduction filtration (sampled) | split `I₅` over `𝔽₅` | `E/E₀ = ℤ/5`, `E₀/E₁ = 𝔽₅^×` of order 4 | prev |
| 2.8 Kodaira component groups (sampled) | `I₁, I₂, I₅, I₀*, II, III, IV` | `0, ℤ/2, ℤ/5, (ℤ/2)², 0, ℤ/2, ℤ/3` | prev |
| 3.2 isogeny invariance (sampled) | `[p]` in characteristic `p`; Tate quotient | both stay semistable; kernel scheme rank `p²` | prev |
| 4.9 generalized Jacobian (sampled) | split versus conjugate pair at infinity | kernel `𝔾_m` versus norm-one torus; dimension `1 + g` | prev |
| 5.3a elliptic conductor (sampled) | good; split multiplicative; additive with Swan `δ` | invariants 2, 1, 0; conductor `0, 1, 2 + δ` | prev |
| 5.6 bad Euler factor (sampled) | split and non-split Tate; `g = 2, t = 1, a = 1` | `1 − T`, `1 + T`; degree `2a + t = 3` | prev |
| 5.7 residual conductor (sampled) | split `I₅`, residual `ℓ = 5` and `3` | `Φ[5]` rank 1, drop 1 → 0; `Φ[3] = 0`, no drop | prev |
| 6.4b localization (sampled) | finite residue field, connected group; `I₅` | `H¹(k, N⁰_k) = 0`; quotient `ℤ/5` remains | prev |
| 6.10 compatible system (sampled) | `y² + y = x³` over `𝔽₂`; `q = 2, d = 1` | three points, polynomial `X² + 2`; traces 3 and 1 | prev |
| 6.11 ordinary semistability (sampled) | good ordinary; Tate; supersingular | multiplicative heights 1, 1, 0 | prev |
| 4.14 exports (prev R06) | two good places of an elliptic curve | graph lattices 0; shared `T` of dimension 2 needs both Frobenius actions from 5.0 | layer order defect stands |
| 5.0b locators (prev R07) | `y² = x³ − x` over `𝔽₅` | `#E = 8`, `P = X² + 2X + 5`, `X²P(5/X) = 5P(X)` | formulas right, pages wrong; stands |

**Ownership.** Searched by object (determinant lines of perfect complexes; Chevalley decomposition and maximal connected affine subgroups) on main, at the open heads through the roadmap service, and in the board's package index: the determinant owner is PadicMeasuresIwasawaAlgebras §5.1 (now cited); the general Chevalley owner is GroupSchemesOverABase GS4.2 (R04); no third owner. The open pull requests this brief lists by path were covered by the service index (430 pull requests, 2026-10-29); ownership against pull requests outside that index was not checked.

## Not verifiable

- saito (Saito 1988, Theorem 1 and §1), the primary source of §§5.3d–5.3e: Project Euclid landing page without PDF, as in the previous report; the general conductor–discriminant statement is checked only through its elliptic instances above.
- deligne, *Le discriminant d'une courbe* (letter to Quillen, appendix): no legal text located; the determinant-line formulation is checked against Knudsen–Mumford as read previously and against PadicMeasures §5.1.
- blr for the sampled 1.2 and 1.3, faltings-chai, silverman, serre-tate, serre1987, serre-topics, milne-etale, yuan-zhang-erratum: unchanged from the previous report (paywalled or no open copy); none is touched by this diff.
- The Lean file's three admitted theorems are elaboration-checked, not proved.

## Source issues

- none new. The three conrad items of the previous report (Theorem 4.4 smoothness hypothesis; the corank misprint after Lemma 5.4; the finite-level inference in the proof of Theorem 5.8) stand as recorded there; this round's reading of conrad Theorem 2.6, Proposition 2.16, Theorem 3.1 and §4's opening found nothing further.
