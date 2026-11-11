# Review of CharacteristicClasses (pull request #1807 at 78bda3b)

**Verdict:** needs changes

## R01 (P3) — C7.6 cites a pinned diffeomorphism that K7.1 now restates on Mathlib's topology

**Location:** `README.md:273–275`: "the Riemann-sphere diffeomorphism `OnePoint.diffeomorphProjectivization` is Tau Ceti's, as K7.1 itself records." Also C7.6 at `:3303–3305` ("the inverse of the pinned diffeomorphism"), the Tau Ceti row of the supplier table, and the C7 dependencies at `:3355–3356`.

**Claim:** This round's ComplexKahlerGeometry change stops K7.1 citing the pinned map. The pinned map is stated on Tau Ceti's copy of the projectivization topology, and K7.1 restates it on Mathlib's. C7.6 composes it with K7.1's homeomorphism, which lands in Mathlib's topology, so the composite cannot be formed at the pins.

**Witness:** `ComplexKahlerGeometry/README.md:2779–2789`: "Tau Ceti proves the Riemann-sphere comparison on its own copy … restate this diffeomorphism on Mathlib's instance". With `import Mathlib`, `import TauCeti.Topology.Algebra.Projectivization` fails: "environment already contains 'Projectivization.instTopologicalSpace._aux_1'".

**Repair:**
- `:273–275`: replace the quoted clause with "and K7.1's restatement on Mathlib's topology of the Riemann-sphere diffeomorphism, which Tau Ceti states as `OnePoint.diffeomorphProjectivization` on its own copy of the projectivization topology."
- C7.6: replace "the inverse of the pinned diffeomorphism `OnePoint.diffeomorphProjectivization` from `OnePoint ℂ` to `Projectivization ℂ (Fin 2 → ℂ)`" with "the inverse of K7.1's diffeomorphism from `OnePoint ℂ` to `Projectivization ℂ (Fin 2 → ℂ)` on Mathlib's topology".
- Dependencies: replace "the pinned `OnePoint.diffeomorphProjectivization` and Serre-fibration membership theorem" with "K7.1's Riemann-sphere diffeomorphism on Mathlib's topology, the pinned Serre-fibration membership theorem".
- Supplier table:
  - Delete "and the diffeomorphism `OnePoint.diffeomorphProjectivization`" from the Tau Ceti row.
  - In the ComplexKahlerGeometry row, add "the Riemann-sphere diffeomorphism on Mathlib's topology (C7.6)" to K7.1's parenthesis.
- Description: drop "the Riemann-sphere diffeomorphism" from "It cites what Tau Ceti pins (…)" and add "C7.6 takes the Riemann-sphere diffeomorphism on Mathlib's topology from ComplexKahlerGeometry K7.1."

## Previous findings

- R01 — repaired: `:941–942`: "For compact Lie G take a finite faithful smooth unitary representation G⊂U(N) from LieGroups Layer 7 (finite faithful representations)." The C1 scope bullet, the left-to-others bullet, `:285`, the LieGroups and CompactGroups rows and `:1123` all follow it.
- R02 — repaired: C1.5 `:991–993` cites "(Hatcher, *Algebraic Topology*, Theorem 3.19, p. 220, … and §3.2, p. 222, for H*(RP∞;ℤ))". C4.2 `:2188–2192` cites Dupont Theorems 7.3 and 7.17 and Corollary 8.36(i). Both References entries are extended.
- R03 — repaired: `:1761–1764`: "for a locally trivial fibre bundle over an arbitrary base whose fibre cohomology over R is finitely generated and free in each degree, with homogeneous global classes, finitely many in each degree". The finite family is kept only for compact supports.
- R04 — repaired: `:1405–1406`: "a specified finite smooth triangulation h:|K|≃M from GeometricTopology §11.3 (the Cairns–Whitehead theorem)."
- R05 — repaired: the description now reads "or DGFloer Layer 1.2 (now Tau Ceti's Serre fibrations, AlgebraicTopology 4.10, 5.5); C1.3 takes faithful representations from LieGroups Layer 7."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C1.3 via LieGroups Layer 7 | U(1)⊂U(1), m=3; ℤ/2⊂U(1); SO(3)⊂U(3); (S¹)^ℕ | 2(3−1)=4≥d+1 gives d≤3, and CP∞→CP² is iso for d≤5; RP^(2m−1) is iso for d≤2m−1; SO(3) is faithful; (S¹)^ℕ has small subgroups, so no faithful representation | holds; LieGroups `:892–898` covers every compact Lie G, all components | none |
| C1.5 rings | CP∞ over ℤ; RP∞ over ℤ and 𝔽₂ | H⁴=ℤh²; H¹(RP∞;ℤ)=0, H²=ℤ/2⟨y⟩, 2y=0; a has no integral lift, so β(a)=y≠0; ρ(y)=a² | holds; `hatcher-at` lines 9541, 9630 | none |
| C2.3a with GT §11.3 | ∂Δ³≅S²; compact M | 4−6+4=2=χ(S²); a compact realization has finitely many simplices; the pinned smooth triangulation is a Cⁿ immersion on each closed simplex | holds | none |
| C3.1 over an arbitrary base | B×CP∞ with classes hʲ; F=∅; F=pt; S¹→S³→S²; RP∞ fibre over ℤ | Hⁿ(B×CP∞)=⊕_(2j≤n)Hⁿ⁻²ʲ(B), one class per even degree; 0=0; E≅B; with no class restricting to H¹(S¹), ranks would be 1,1,1,1 against the true 1,0,0,1; H²(RP∞;ℤ)=ℤ/2 is not free, so excluded | holds; Hatcher 4D.1 (line 18645) covers any base (line 18718) | none |
| C4.2 locators | O(−1) on CPⁿ; L and L⊕L; sign-flipped c′ | Dupont (7.6): c(H*)=1−h, matching c₁(O(−1))=−h. Dupont (7.18): p₁(L)=0 and p₁(L⊕L)=−y², real image 0. c′ᵢ=(−1)ⁱcᵢ gives 1+h, excluded by d) | holds; Cor. 8.36(i) gives uniqueness | none |
| C7.6 route | Hopf p over [1:0]; the import of the pinned map with Mathlib | fibre {(λ,0)}; the duplicate `Projectivization.instTopologicalSpace` refuses the import; K7.1's homeomorphism lands in Mathlib's instance | mathematics holds; the pinned map is unusable | R01 |

Rows for untouched statements stand as in the previous review, of 8cb420c. These are C1.2, C1.4, C2.0–C2.6, C5.5, C6.2, C6.3, C7.3a and the six `Suggested.lean` theorems. No target of the seeded sample lies in the changed passages.

- **Source locators: 6 checked against the text.**
  - `hatcher-at` lines 9541 (Theorem 3.19, p. 220), 9630 (p. 222) and 18645–18653 (Theorem 4D.1, p. 432).
  - `dupont-ccc` lines 3099–3119 (Theorem 7.3, pp. 99–100), 3243–3262 (Theorem 7.17, pp. 104–105) and 3994–3996 (Corollary 8.36(i), p. 130).
- **Pinned declarations opened:**
  - `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:365`; the file states "No assumption is made on the base");
  - `Projectivization.instTopologicalSpace` in Tau Ceti (`Topology/Algebra/Projectivization.lean:90`) and in Mathlib (`Topology/Algebra/Projectivization.lean:44`);
  - `OnePoint.diffeomorphProjectivization` (`Geometry/Manifold/Instances/OnePoint/Projectivization.lean:140`);
  - `TauCeti.IsSmoothTriangulation` (`Geometry/Manifold/SmoothTriangulation/Basic.lean:191`).
- **Cross-roadmap citations resolved:**
  - LieGroups Layer 7 (main, `:892`);
  - CompactGroups Layers 0–1 (main, `:205`, `:226`); Peter–Weyl is Layer 5 (`:318`) and is rightly dropped from the row;
  - GeometricTopology §11.3 (main, `:7887–7895`);
  - ComplexKahlerGeometry K7.1 (this head, `:256–260`, `:2779–2789`);
  - AlgebraicTopology 8.8 (this head, now through ClassifyingSpaces items 1.1–1.2), which agrees with C1.5a `:1031–1035` and with ClassifyingSpaces' new sentence about C1.5a.
  - The resolver lists nothing unresolved.
- **Gate.**
  - The worker's gate at 78bda3b passes, `build=0` included.
  - My rerun reports only `outside-folder=24`. Every hit is in the 12 sibling folders this pull request owns, and the diff outside the 13 folders is empty.
  - Dependency check: `depcheck: 206 roadmaps, 1920 edges, 0 problem(s)`.
- **Lean.** `Suggested.lean` is unchanged since 8cb420c. `lake env lean` gives six `declaration uses sorry` warnings (lines 161, 185, 201, 225, 257, 281) and nothing else. The signatures, the padding probe and the headline list stand as in the previous review.
- **Overlap check:**
  - Read: TopologicalKTheory, AlgebraicTopology and GeneralizedCohomology (open); AlgebraicTopology, TangentialBordism and TopologicalKTheory (main). The third list is empty.
  - Shared objects:
    - ordinary Leray–Hirsch is owned by C3.1; GeneralizedCohomology G4.1 owns the numerable generalized-theory form, and AlgebraicTopology 5.5 only assumes the hypothesis;
    - the finite faithful representation is owned by LieGroups Layer 7;
    - the Riemann-sphere diffeomorphism on Mathlib's topology is owned by ComplexKahlerGeometry K7.1 (R01).
  - #1808 and #1854 revise this folder after this pull request, as the merge-order block states.
- **Remarks on untouched wording; no change asked.**
  - The C3.1 dependency sentence (`:2160`) omits C1.5's line class and AlgebraicTopology's Künneth, both of which C3.1 uses.
  - `:1792` "because B is" presupposes a paracompact B.
  - PositiveScalarCurvature (main, `:201`) and CompactQuantumMetricSpaces (open) cite C1 item 3 for the faithful representation. That citation now resolves through C1.3 to LieGroups.

## Not verifiable

- Nothing in the changed passages: their six locators are in cached texts. The uncertified works of the previous review (Milnor–Stasheff, Milnor's *Topology from the Differentiable Viewpoint*, Bott–Tu, Milnor's *Construction of Universal Bundles, II*) stand as recorded there.

## Source issues

- none
