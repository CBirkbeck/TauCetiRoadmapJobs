# Review of HermitianFormsAndLattices (pull request #2882 at b74b836)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** needs changes

**Summary.** Changes are needed, but not to the mathematics. Every Check and worked example I recomputed holds, including the Eisenstein masses in ranks 1 to 8 and the brute-force local-density counts, and both Landherr statements in `Suggested.lean` are correct at the README's generality. The four findings are about sourcing, ownership and one sentence:
- R01: results taken from the literature, the four headline theorems among them, have no exact locators.
- R02: the split Hermitian spaces of 0.1 restate MetaplecticAutomorphicForms §3.2a without citing it.
- R03: the Hermitian mass and the unitary mass formula are also planned in AbelianSchemesAndArithmeticModuliPartII F5.7.
- R04: one sentence in the route of 2.1 is false as written.

There are also two small corrections and no format notes. The human reviewers decide two points: the source wording, which could not be checked because no cited text was legally readable, and where the Lean statements come from.

## R01 (P2) — The results the README takes from the literature, including all four headline theorems, have no exact locators

**Why it matters.** Without locators, a reader cannot check a statement or its generality against its source. This matters most where the README claims more than the usual setting, for example 2.1 "any characteristic, any residue characteristic" and 6.1(g) "every characteristic ≠ 2". An implementer also has no published proof to fall back on.

**What I found.** Inside the layers, only four citations carry a locator: Scharlau, Chapter 7 (1.1); O'Meara 71:19a (3.2); O'Meara §91 (4.1); and Nikulin, Proposition 1.6.1 (4.9). The other attributions name a source with no theorem or page: [Jacobowitz] in 4.3, [Shimura64] and [GHY] in 4.4, [GanYu] in 6.1a, [Feit] in 6.3, and [Ennola] in 1.5. The References list then assigns sources to whole sections, again without theorem or page. For example, [Landherr] is given for "Layer 3", [Jacobowitz] for "2.1, 4.1–4.4", [Shimura97] for "6.2, 6.3", [Weil65] for "6.0a, 6.0b, 6.5", and [Braun] for "6.5, 7.1" (lines 3413–3466). As a result, none of these has a locator:
- Landherr's theorem (3.1, 3.2);
- `τ(U(V)) = 2` (6.0b);
- the mass formula (6.2, 6.3);
- Siegel's main theorem (6.5).

None of the 15 sampled sections has a locator either.

**Repair.** At each statement the README attributes to a source, give the theorem (or section) number and the page next to the claim. Start with the headline theorems, then Jacobson's theorem (1.3), the local classification and lattice theory (2.1, 4.1–4.4), the local densities (6.1a, 6.1d) and Minkowski's bound (5.2(c)). The results that are the roadmap's own, such as 4.0b, 4.11, 4.13 and 6.4a–6.4c, carry full routes and need no locator.

## R02 (P2) — Split Hermitian spaces and their isometry group are owned by MetaplecticAutomorphicForms §3.2a on main, and 0.1 restates them without citing it

**Why it matters.** With two owners of one object, an implementer would build a second carrier for the split case. The Scope section (line 3159) also claims the split algebra as owned here.

**What I found.** MetaplecticAutomorphicForms §3.2a on main (its README lines 564–568) handles `E = F × F` with the exchange involution in characteristic `≠ 2`. It identifies every split ε-Hermitian space with `A ⊕ A^∨`, with the pairing `(ℓ(y), εk(x))` in the convention that is conjugate-linear in the first variable. It also identifies the isometry group with `GL(A)`, acting by `(g, (g⁻¹)^∨)`. The last sentence of 0.1 (lines 228–231) states the same three things:
- the decomposition `V = V_1 ⊕ V_2`;
- the perfect pairing `V_1 × V_2 → F`;
- `U(V) ≅ GL(V_1)`.

1.4 and 2.3 then build on it. The README never cites §3.2a. GanGrossPrasadUnitaryGroups (pull request #1404) records §3.2a as the owner in its Scope section.

**Repair.** In 0.1, cite MetaplecticAutomorphicForms §3.2a for the decomposition and the isometry group in characteristic `≠ 2`. Add one clause saying what 0.1 adds: characteristic two, and the isomorphism of group schemes. Then list §3.2a under "Consumed, not restated" and in the supplier contracts.

## R03 (P2) — The mass of a genus of Hermitian lattices and the unitary mass formula are also planned in AbelianSchemesAndArithmeticModuliPartII F5.7, so 5.5 and 6.2–6.3 have a second owner

**Why it matters.** Two roadmaps would each construct the unitary mass and prove its formula, with measures normalized differently: here by the Conventions of this README, there by the local factors of "LT (38)–(40)". Neither README cites the other.

**What I found.** AbelianSchemesAndArithmeticModuliPartII is pull request #1405, earlier in the merge order.
- Its F5.7 (README line 2785) is to be proved "with the unitary mass formula under specified measures including all ramified and dyadic local factors".
- Line 2787 asks to "Construct the unitary mass on the imported Hermitian lattice and adelic carriers".
- Its Scope (line 3168) says "F5.7 owns CM unitary mass".

Its setting is unimodular, positive-definite `O_K`-Hermitian lattices with `K` imaginary quadratic of class number one. That is a case of 5.5 and 6.2(a) here. Its Check "over ℤ[i], rank one … mass 1/4" is the value 6.2(a) gives: `2·(π/4)·π^{−1}·(1/2) = 1/4`, using `β_∞ = π` and `β_2(⟨1⟩) = 2` for `ℚ_2(i)`.

**Repair.** Settle one owner and record it in this README's Scope section. Since this roadmap states the general form, one option is for F5.7 to consume 5.5 and 6.2. This roadmap would then merge before that one and name F5.7 under Downstream consumers. If F5.7 keeps the construction instead, the Scope section here would cite it for that case and say in one clause how 5.5 and 6.2–6.3 differ (every CM extension and every lattice).

## R04 (P2) — The route of 2.1 asserts that `N(E^×) ∪ {0}` contains every `m·1`, which is false; it holds only under the hypothesis that the argument then refutes

**Why it matters.** As written, the sentence asserts that every positive integer is a norm. That contradicts the first Check of 2.1 itself.

**What I found.** The route (lines 546–548) says the set "is closed in `F`, stable under multiplication and contains `1`, hence every `m·1` with `m ∈ ℕ`". The closure-under-addition hypothesis appears only afterwards. For the inert `ℚ_3(i)/ℚ_3` of 2.1's Check, `3 = 3·1` has odd valuation and is not a norm.

**Repair.** Put the hypothesis first: "Suppose `N(E^×) ∪ {0}` were closed under addition. Being closed in `F`, multiplicative and containing `1`, it would contain every `m·1` and, by closedness, `−1`; it would then be a subfield, open because `N(E^×)` is open, hence equal to `F`, contradicting the index two."

## C01 — `levelAlgebraicModularForm_finrank` is cited as a declaration of DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5c, but no roadmap or library has that name

The name appears in 5.7(b) (line 1866) and in the supplier contract (line 3378), so a reader who searches for it finds nothing. §7.5c at the head of its pull request states the trace formula `dim S(J, M) = Σ_i |Γ_i|^{−1} Σ_{γ ∈ Γ_i} tr ρ_i(γ)` (its lines 163–170) without naming it. The roadmaps index and the pinned Tau Ceti have no such name either. Cite §7.5c by its statement and drop the name.

## C02 — A validation sentence in the description is out of date

The validation paragraph of the description (its line 24) says that every automatic check passes except the one that looks for changes outside the roadmap folder, which it says flags the three files of the family index. At this head every automatic check passes, including that one: the family index's files belong to this pull request, so no change outside its scope is reported. A reader of the description is told of a failure that is not there. "Validation at this head: every automatic check passes; …" would be accurate.

## Questions for the author

- Does this roadmap depend, directly or through its suppliers, on AbelianSchemesAndArithmeticModuliPartII? The merge-order block of the description lists that pull request before this one, but I found no supplier edge from this roadmap, OrbitMeasuresOnAdelicGroups or DiscreteSeriesCoefficientsAndAutomorphicMetrics to it. The answer decides which way R03 can be settled.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.2 reductive structure | n=0,1; E field vs F×F; 𝔽₄/𝔽₂ | n=1: SU trivial; n=0: det not onto; Gal acts by −1 (field), trivially (split); Tr(λh)=0 ⇒ h=0 | holds | none |
| 1.0 sesquilinearity conventions | h=x̄y, w=i·x̄y on ℂ | h(i,1)=−i, flip=i; Gram [i], transpose [i]=−σ([i]) ≠ [−i] | holds | none |
| 1.2 Witt decomposition | ⟨1,−1⟩; split ⟨1⟩; ℚ(i) | h(y+μx)=h(y,y)+μ+μ̄; (1,0) has h=0, Ex not free; −1∉N(ℚ₂(i)) since (−1,−1)₂=−1 | holds | none |
| 1.7 base change | ℚ(i)⊗ℚ₅, ⟨3⟩ | 5=(2+i)(2−i) splits; 3 inert, odd valuation ⇒ class nontrivial at 3, trivial at 5 | holds | none |
| 2.1 nonarchimedean classification | ℚ₃(i), ℚ₂(i) | −1 norm, 3 not; x²+y²≠3 in ℚ₂; route's "every m·1" fails at m=3 | statement holds; route sentence false | R04 |
| 3.4 coherent collections | ⟨1,1⟩/ℚ(i) | ε_∞=−1, ε₂=η₂(−1)=−1, product 1; V_∞→(1,1): product −1; V₂→H: ε₂=+1, product 1 | holds | none |
| 4.0b indices | A=O², B, C of the Check; d=1 | idx(A,B)=2, idx(B,C)=−2, idx(A,C)=1−1=0; sup over W attained at K(0,1): 2−1=1=length | holds | none |
| 4.9 gluing | inert q=2, split p=3, ℚ₃(√−3), ℚ₂(i) | #O: 3, 6, 18=\|U₂(𝔽₂)\|; (ℤ/9)^×=6; uū≡a²≢−1 mod 3; six units of O_E/𝔓²; ℚ₂(i) ⟨2⟩: 2 | holds | none |
| 5.1 genus and class set | n=1, ℚ(√−23), ℚ(√−15) | genus = ideals with 𝔞𝔞̄=O; Cl/⟨ambiguous⟩: 3/1=3, 2/2=1; volumes ℤ vs 2ℤ | holds | none |
| 6.1 local densities | ramified n=1; inert n=1; ℚ₃(√−3) 𝔓-plane | kernel 2q^N ⇒ 2; (q+1)q^{N−1}/q^N=1+1/q; brute force 1944 mod 3 ⇒ 24 ⇒ 8/27 | holds | none |
| 6.1a densities at good places | ℚ₃(√−3), ℚ₂(√−3), split q=3 | brute force 216, 108 mod 3 ⇒ 8/3, 4/3; 48, 1152 ⇒ 3, 9/2; 234/3⁵=1−3⁻³; λ: 1/2, q^{−n/2}, formula agree | holds | none |
| 6.3 closed mass formula | E=ℚ(√−3), O_E^n, n=1..8; ⟨1,2⟩ | 1/mass = 6, 72, 1296, 31104, 933120; n=6 13/235146240; n=8 41/48372940800; ⟨1,2⟩ 1/36, 1/72 | holds | none |
| 6.4 ratios of masses | ℚ(√−3), n=2..6; n=1 | computed ratios 1/12, 1/18, 1/24, 1/30, 13/252; displayed n=1 expression 1/12 vs true 1/6 | holds | none |
| 6.4a unimodular lattices meeting U | the four Checks | closed form 1/2 = 3·(1/6); 1/12 = 3·(1/36); ℚ(√5): both sides 3 log ε/√5 | holds | none |
| 7.1 Hermitian theta series | ℤ[i], k=1, z=i | covolume √det diag(2,2)=2; Jacobi t=2 gives θ_L(i)=θ_{L#}(i)/2 | holds | none |
| 3.1 Landherr, Hasse principle (Lean) | ℚ(√−3): ⟨1,1⟩ vs ⟨1,2⟩ | 2 is not a norm at 2 (inert) or at 3 ((2,−3)₃=−1); Lean has both place types and σ⊗1 | holds | none |
| 3.2 Landherr, existence (Lean) | ℚ(√−3), ⟨1,2⟩; complex and split places | non-norm at 2 and 3 only: count 2, even; at split/complex places every det is a norm | holds | none |
| 6.0b τ(U(V)) = 2 | ℚ(i) torus; cone at q=5, q=2 | (4/π)·π·2/4=2; 124·26=3224, 248 points, 49/625; 7/16 | holds | none |
| 6.5 Siegel's main theorem | O_E², T=1; N=⟨4⟩ | left 12, right (4π²/3)(27/4π²)(4/3)=12; r=84, r*=72; α₂*=9/8, α₂=21/16 | holds | none |
| 0.1 split clause | MetaplecticAutomorphicForms §3.2a | same A⊕A^∨, same pairing, isometry group GL(A) vs U(V)≅GL(V₁) | duplicate object | R02 |
| 5.5/6.2 vs F5.7 | ℤ[i], rank one | 6.2(a): 2·(π/4)·π⁻¹·(1/2)=1/4 = F5.7's Check value | second owner | R03 |
| 5.7(b) supplier name | DiscreteSeries §7.5c at its head | formula present (lines 163–170); name absent everywhere | name unresolved | C01 |
| 7.2 genus-average coefficients | O_E², T=0 at inert 2 | brute force 10, 88, 736 ⇒ 5/4, 11/8, 23/16, not constant | holds | none |

- Source locators checked against the text: 0. The README has 11 in-text attributions, 5 of them with a locator (4 inside the layers); none of the 15 sampled sections has one.
- Mathlib: 36 names checked with `#check` at the pin. All resolve; `DoubleCoset` is a namespace (`Mathlib/GroupTheory/DoubleCoset.lean:34`).
- Tau Ceti: the cited declarations were opened at the pin, for example `Overlattice/Graph.lean`, `Overlattice/Isotropic.lean`, `RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:476`, `Global/Approximation/Weak.lean:208`, `IntegralLattice/Genus.lean:77`, `IntegralLattice/Mass.lean:91` and `LocalDensity/Basic.lean:546`.
- Cross-roadmap citations: all resolve except one name (C01). Checked: about 60 section anchors and names in GeometryOfNumbersAndQuadraticArithmetic, AdelicAlgebraicGroups, OrbitMeasuresOnAdelicGroups, DiscreteSeriesCoefficientsAndAutomorphicMetrics, AutomorphicFormsOnReductiveGroups, FiniteGroupInvariants, ThetaSeries, AnalyticNumberTheoryPartI/II, GlobalQuadraticForms, ClassFieldTheory, GlobalNumberFields, QuadraticFormInvariants, ReductiveGroups(PartII), ClassicalGroups and IntegralLattices.
- Automatic checks: every check passed. Dependency check output: `depcheck: 170 roadmaps, 1987 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: two `sorry` warnings and nothing else. I compared `#check @name` for both declarations with README 3.1 and 3.2: no binder lost, same generality, file unchanged.
- Padding probe: `first | simp | rfl | infer_instance | aesop` leaves both theorems unsolved, so neither is padding.
- Computations, in plain Python: masses for ranks 1 to 8 and the ratios; brute-force counts for 6.1, 6.1a and 7.2.

Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, BesselPoincareSeriesAndGramBounds, IntegralLattices (main and open revision), GeometryOfNumbersAndQuadraticArithmetic, AdelicAlgebraicGroups, EndoscopicTransferAndUnitaryTraceComparisonPartII. Shared objects and owners:
- Hermitian carriers, integral Hermitian lattices and unramified densities: GeometryOfNumbersAndQuadraticArithmetic, cited.
- Tamagawa and orbit measures: AdelicAlgebraicGroups and OrbitMeasuresOnAdelicGroups, cited.
- Discriminant forms and gluing over ℤ: IntegralLattices and Tau Ceti, compared.
- `τ(U(V)) = 2`, Siegel's main theorem and theta series: owned here; the theta roadmaps consume them.
- Beyond the lists: split Hermitian spaces, owned by MetaplecticAutomorphicForms §3.2a (R02); the Hermitian mass, which AbelianSchemesAndArithmeticModuliPartII F5.7 also owns (R03).

Source independence: 0 passages compared, with 0 sources; no cited text was legally readable (GHY and Hashimoto–Koseki have no legal copy, Feit is paywalled). The largest share of locators is O'Meara, 3 of 11 in-text locators. Contents not compared, because the text was not read. The layer order is the one the *Needs:* lines force: 3.1 needs 2.1–2.3, Layer 4 needs 2.3, 5.1 needs 4.0 and 4.5, 6.2 needs 5.5, and 7.2 needs 6.5.

Research link: Layers 5–6 state the exact Hermitian mass formula (Shimura 1997; Gan–Hanke–Yu 2001), Weil's `τ(U(V)) = 2` (Weil 1965) and Siegel's main theorem for Hermitian forms (Braun 1941). The family's theta-lift roadmaps consume them. This rests on the README's References and Downstream consumers.

## Not verifiable

- None of the 15 sampled sections has a source locator to check. Their statements were checked by computation instead (table above).
- [GHY] Gan–Hanke–Yu, Duke Math. J. 107 (2001): the sources service found no legal copy (Project Euclid landing page, no PDF).
- [HashimotoKoseki] Tôhoku Math. J. 41 (1989): Project Euclid landing page, no PDF link.
- [Feit] J. Algebra 52 (1978): the DOI resolves only to a paywalled page.
- [Landherr], [Jacobowitz], [Shimura64], [Shimura97], [Scharlau], [Weil65], [Braun], [GanYu]: not fetched. There is no locator to check, and I stopped after three sources with no legal copy.
- The comparison of wording and of arrangement against the sources could not be done, because no source text was read.

## Source issues

- none

## For the human reviewers

- Not tested: no cited text could be read legally (GHY, Hashimoto–Koseki and Feit were tried). Wording and arrangement were not compared with any source, including O'Meara, which has the largest share of locators (3 of 11).
- Provenance: the description says the family follows a formal Lean proof announced on 2026-11-20. I could not compare `Suggested.lean` with it; whether its statements are adapted from that formalisation is for the humans to decide.
