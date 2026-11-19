# Review of ComplexKahlerGeometry (pull request #2536 at 4a51aa5)

**Verdict:** accepted

**Summary.** Accepted: a full pass over every layer found no false statement, no missing hypothesis and no supplier defect, and the folder is unchanged since the previous review. Every Check and worked value I recomputed agrees with its section, the 27 Lean statements match the README at the stated generality, and the sampled Demailly and Ballmann locators support what they are cited for. There is one small correction, carried over because the head has not moved: 2.5 does not name the pinned Tau Ceti Čech results that its own route uses or generalises. Two licence questions about sources are left to the humans.

## C01 — Section 2.5 names Tau Ceti's Čech refinement maps and cover colimit, but not the pinned Čech results its route uses or generalises

An implementer of 2.5 who reads only its consume sentence (lines 508–515) and the Tau Ceti entry (lines 3569–3578) would rebuild three things the same pin already has. At the Tau Ceti pin:

- `TauCeti/Topology/Sheaves/Leray.lean` line 293, `TauCeti.Topology.homologyCechComplexIsoH`, is Leray's theorem for a finite family (`[Finite ι]`) whose nonempty finite intersections have no higher cohomology. 2.5's "Čech comparison for acyclic covers" (line 505) is the same statement for arbitrary covers, and the two covers this roadmap actually applies it to (K7's punctured-plane cover and 7.9's cover of `ℂ²∖{0}`) are finite.
- `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech/LongExactSequence.lean` line 79, `TauCeti.CategoryTheory.cechCohomologyδ`, with its exactness theorems, is the long exact sequence of the cover colimit that the induction of Demailly IV (5.19)–(5.21) runs on; `Cech/ModuleCat.lean` line 43 gives the vanishing of the colimit once every class dies on a finer family.
- `TauCeti/Topology/Sheaves/Cech/LocallyZero.lean` line 70, `TauCeti.Topology.exists_cechComplexMap_f_eq_zero_of_locally_eq_zero`, is the refinement-kills-cochains lemma on compact normal spaces; 2.5's "paracompact shrinking" is its locally finite generalisation.

Nothing is stated twice and every statement of 2.5 stays true. The smallest repair adds these names to the consume sentence and the Tau Ceti entry, with one clause saying that 2.5's Leray and shrinking statements extend the pinned finite-cover and compact-normal cases.

## Previous findings

The previous review read this same head and raised no finding.

- C01 (2.5 does not name the pinned Čech long exact sequence, finite-cover Leray theorem and compact-normal shrinking lemma) — not repaired: the folder has not changed. The consume sentence still reads "Consume Tau Ceti's refinement maps of Čech complexes and their independence up to cochain homotopy … and its Čech cohomology over a system of covers" and names nothing else. Carried as C01 above.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 complex orientation, holomorphy criterion | `z↦2z`, `z↦z̄`, `|z|²` | real det 4 and −1; `φ_z̄=z` vanishes only at 0; `ℓ(i)=−i≠i·ℓ(1)` | sound | none |
| 1.2 joint implicit map (pin `Analysis/Complex/ImplicitFunction.lean` 57) | `G=v²−z` at (1,1), (0,0) | `∂_vG=2`; `F=√(z+w)`, `G(z,F)=w`; at 0 derivative 0 | sound | none |
| 1.3 Nijenhuis type identity | `X,Y` of type (0,1) | `N(X,Y)=−4[X,Y]^(1,0)`; mixed `N(X^(1,0),Y^(0,1))=0` | sound | none |
| 1.4 `newlander_nirenberg` | n=0; E odd-dimensional | n=0: point target, constant map; odd dim: no J, vacuous | sound | none |
| 2.2 annulus Check | `f=1/z`, K={2≤\|z\|≤3} | `∮=2πi`, length 4π, sup≥1/2; collar sup 2/3 gives ε≥3/4 | sound | none |
| 2.3 `exists_mixed_parameter_dbar_solution` | Q=`ℂ²∖{0}` (not Stein); `f=q̄` | `∂̄_z` onto on `C^∞(Ω;𝒪(Q))`, Fréchet-valued; `∂̄_qT(χq̄)=T(χ)≠0` | sound | none |
| 2.4 `dolbeault_grothendieck_polydisc`, Dolbeault defs | r≤0; n=0; `dz̄/z̄` on ℂ× | empty space, all 0; point `H^(0,0)=ℂ`; `dz̄/z̄=∂̄log\|z\|²`, period −2πi | sound | none |
| 2.5 Dolbeault theorem, Čech/derived | pins Leray 293, LES 79; SBC B6.1 | Leray pinned for finite ι only; soft acyclicity at B6.1 on main | C01 | C01 |
| 3.2 Weierstrass statements | d=0; n=0; `w²−z`, `w³` | d=0: u=f; n=0: `f=w^d g`; `w³=w(w²−z)+zw` | sound | none |
| 3.4 `isRegularLocalRing_holomorphicStalk` | dim E=0; binder check | stalk ℂ, dim 0; `[FiniteDimensional ℂ E]` present in elaborated type | sound | none |
| 3.4 `ruckert_nullstellensatz`, coherence | k=0 | zero set everything, g=0 near x, m=1 with empty sum | sound | none |
| 3.5 `riemann_extension`, `hartogs_extension_across_point` | k=0; n=1 `1/z`; disconnected U | k=0 forces U empty; `1/z` unbounded; g≡0 on a component excluded by empty interior | sound | none |
| 4.2 Chern connection | `h=e^(−\|z\|²)`; `e′=e·e^z` | `A=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz` | sound | none |
| 4.5 exponential sequences, `F_M` | point; ℝP²; gauge of `O(1)` | segment all 0; Bockstein injective as `H¹(ℝP²;ℤ)=0`; `Θ(O(1))=−2πiω_FS` | sound | none |
| 5.7 `hodge_theorem_deRham` | S¹; index m≠dim; M=∅ | `d*(f dθ)=−f′`; `OrientationLift.card_eq` forces m=dim; ∅ gives 0 | sound | none |
| 5.7 realification adapter | `a_±=Q±i⟨,⟩` | `Re((1∓i)a_±(u,u))=Q+‖u‖²≥(c/λ)‖u‖²_H¹` using λ≥1, Q≥0 | sound | none |
| 5.8 componentwise transport | `S¹⊔S¹`, ranks (1,2), (0,1) | kernel 1+2=3, `n²` multiplicity 6; rank 0 gives empty basis; δ in `H^s` iff s<−1/2 | sound | none |
| 5.10 `finrank_dolbeaultCohomology_serre` | Hopf surface; ℂP¹; M disconnected | `h^(0,1)=h^(2,1)=1`, `h^(1,0)=h^(1,2)=0`; componentwise sum | sound | none |
| 6.1 normal coordinates, Kähler identities | ℂP¹ scaled chart; `diag(1+z₂+z̄₂,1)`; ℂ | `H=(1+π\|u\|²)^(−2)`, `1−H≤2π\|u\|²`; `dω(0)≠0`; `[Λ,d]=−(d^c)*` from the two identities | sound | none |
| 6.1 Nakano bound | trivial line, `e^(−\|z\|²)` | `iΘ=2ω`, `[iΘ,Λ](dx∧dy)=2dx∧dy`, k·a=2 | sound | none |
| 6.3 `IsKahler` (pin `TwoForm.lean` 231) | form 0 on Hopf; taming non-invariant κ | `Compatible` includes `Tames`, so 0 excluded; `κ(∂y₁,∂y₂)=0≠1` | sound | none |
| 6.3 `del_delBar_lemma`, Hodge–Riemann sign | elliptic curve; (1,0), (0,1), primitive (1,1) | Kähler form not exact; `i∫α∧ᾱ=2∫\|f\|²`; `−∫α∧ᾱ>0` | sound | none |
| 6.3 `hard_lefschetz`, `even_finrank_…` | ℂP²; S²×S²; annulus; Kodaira–Thurston | `[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`; b₁=1 with boundary; b₁=3 with N≠0 | sound | none |
| 7.1 model comparison | (3,4), 2i(3,4); (1,i) | both give chart value 4/3; value i, conjugate map gives −i | sound | none |
| 7.2 Fubini–Study matrix | `w=(1,i)/√2` in ℂP² | r=2, `h(e₁,e₂)=i/(8π)`; coefficient order matches `ω=(i/2)Σh(∂_k,∂_j)dz^j∧dz̄^k` | sound | none |
| 7.3 projective statements | n=0; n=1 with p=q=2; S²∨S⁴ | `u=0`, `u⁰=1` generates; `h^(2,2)(ℂP¹)=0`; `u²=0` on the wedge | sound | none |
| 7.5 rational quartic | n=1, n=2 | image `{b₂=0}` of dim 4 in 5; pair sums of {0,1,3,4} fill 0..8; kernel `x₀x₃−x₁x₂` | sound | none |
| 7.6 `…complexTorus` | n=0, 1, 2; L=ℤ⊂ℂ | 1; `C(1,2)=0`; b₂=1+4+1=6; non-full lattice gives non-compact ℂ× | sound | none |
| 7.7 genus dictionary, symplectic basis | two elliptic curves; `[[0,2],[−2,0]]` | 2=2 and 4=2·2; det 4 has no standard basis; UCT gives H₁ free | sound | none |
| 7.8 flat lines | `ρ=exp(aλ)`; `u=−2Gφ` | `Re a=u`, `Re(aτ)=v`, formula returns a; `iF_(h′)=φω−Δ_dGφ·ω=0` | sound | none |
| 7.9 Hopf diamond | weights of `z↦2z` | functions `2^d`, coinvariants ℂ; Laurent `2^(−m−n)`; Ω¹ `2^(d+1)`, `2^(1−m−n)`; b=(1,1,0,1,1) | sound | none |
| 8.1 Frölicher sequence and inequality | Iwasawa; point; curve; reindexing | 3+2=5>4; `E_r=E_∞` for r≥max(p,n−p)+1; native (3,−2)→(5,−3) from pin's `s=−q−1`, `t=p+2q+1` | sound | none |
| Suggested.lean, all 27 theorems | one-tactic probe | `rfl`, `infer_instance`, `simp` close none; 27 `sorry` remain | no padding | none |

- Source locators checked against the text: 66 in `demailly-agbook` (I (3.28)–(3.29); II (2.1)–(2.4), (2.7), (2.10), (3.19), (4.2), (4.19), (4.22), (4.24), (4.26), (4.29), (4.31), (6.1); IV (4.11)–(4.12), (4.15), (5.17), (5.21), (6.13)–(6.15), (10.8), (11.3)–(11.6), (16.8); V (6.6)–(6.7), (8.1)–(8.2), (9.2), (9.5), (11.1), (11.7), (12.1), (12.4), (15.10); VI (3.16)–(3.17), (4.5), (6.4)–(6.6), (6.8), (6.15), (7.2)–(7.3), (8.5)–(8.6), (8.8), (8.12), (8.17), (9.1), (10.1)–(10.2), (11.1)–(11.3), (11.7); VII (1.1)–(1.3)) and 1 in `ballmann-kahler` (Theorem 4.17, printed pp. 47–48, lines 1990–1998). All agree in number and page, and each one cited for a result states that result with the hypotheses the README gives.
- Library declarations opened at the pins: 58 by name, among them `TwoForm.lean` 231 (`Compatible`), `Orientation/Lift.lean` 52–57 (`card_eq`), `Riemannian/Codifferential.lean` 88, `Filtered/FirstPage.lean` 14–26 and 89, `Analysis/Complex/ImplicitFunction.lean` 57, `Sheaves/Leray.lean` 293, `Cech/LongExactSequence.lean` 79, `Cech/LocallyZero.lean` 70, `LinearPMap/Resolvent/Compact.lean` 68, Mathlib `Topology/Homotopy/Lifting.lean` 489, `Topology/Bases.lean` 1137, `Analysis/LocallyConvex/Montel.lean` 104. Both libraries declare `Projectivization.instTopologicalSpace` (Mathlib line 44, Tau Ceti line 90), as 7.1 says.
- Cross-roadmap citations resolved on main: GlobalHolomorphicFunctions 2.5, 7.1, 7.2 (lines 1444, 2270, 2404); SmoothBundlesConnections B6.1 (lines 1719–1732); PDE §1.3 and §1.7; AlgebraicTopology 4.6, 5.0, 6.5 and finite CW type; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1; LieGroupoidsPoisson §G1.3; StableReduction Layer 4; RealAnalyticGeometry R1, R3.2, R5; ComplexManifolds Milestones 2, 4, 7; the four completed suppliers.
- Dependency check: `depcheck: 200 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier named under Exact supplier contracts is on main.
- Elaboration: `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else. Elaborated types compared with the README for all 36 declarations: the four that keep fewer section binders are the definitions `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap`, which need none of them; every theorem carries its compactness, Hausdorff, finite-dimension and boundaryless hypotheses.
- Automatic checks: all passed on this head. Changes outside the folder: none.
- The pull request's text agrees with the head: one file changed, no heading or Lean declaration added or removed, and the suppliers it names (SmoothBundlesConnections B6.1, the Tau Ceti Čech declarations) are the ones the README now cites.

Overlap check: read TopologicalSheafCohomology, SmoothBundlesConnections, ComplexComparisonPartII and CalibratedGeometry on main, and TeichmullerGeometry at its open head; SchrodingerOperatorsAndSpectralTypes, RelativisticQuantumFieldTheory and HeegaardFloer do not name an object of this roadmap beyond the Newlander–Nirenberg theorem, which HeegaardFloer leaves to K1. Soft-sheaf acyclicity: owner SmoothBundlesConnections B6.1. Čech refinement maps and cover colimit: owner Tau Ceti at the pin. Paracompact Čech/derived comparison, Dolbeault resolution, `Pic_hol` and the exponential segment, Kähler metrics: owner this roadmap, cited as such by the others. Nothing has two owners.

Source independence: 12 passages compared with 2 sources (`demailly-agbook` at I (3.28), II (4.2), IV (5.17)–(5.21), IV (6.13)–(6.15), IV (11.3)–(11.5), V (12.1)–(12.4), VI (7.2)–(7.3), VI (8.5)–(8.6), VI (10.1)–(10.2), VI (11.1)–(11.3), VII (1.2); `ballmann-kahler` Theorem 4.17), none shared beyond formulas and theorem names; largest share `demailly-agbook`, 43 of 58 locators; contents compared with `demailly-agbook`: independent. Layer 2 draws on Chapters I and IV, Layers 5 and 6 split Chapter VI, Layers 1, 7 and 8 match no chapter, and the order germs, bundles, Hodge theory is forced by the Needs lines of 4.1 (on 3.1), 5.9 (on Layer 4) and 6.3 (on 5.10).

Research link: Layer 8's Iwasawa-manifold computation and nilmanifold comparisons are the starting point of Angella (2012) on the cohomologies of the Iwasawa manifold and its small deformations; 7.8's unitary-character lines are the elliptic input of Berwick-Evans and Tripathy (2021). This rests on the README's References.

## Not verifiable

- `webster-nn` (1.4), `koszul-malgrange` (4.2), `griffiths-harris` (3.4), `hormander-alpdo1` (5.2), `raghunathan-discrete-subgroups` and `nomizu-nilmanifolds` (8.2–8.3), `wells-dacm` (References): recorded as uncertified, cited by locator only; the texts were not read.
- The cached texts outside the sample (`angella-iwasawa`, `sakane-parallelisable`, `rainer-advanced-complex-analysis`, `hormann-steinbauer-distributions`, `knutson-borel-weil`, `berwick-evans-tripathy`, `lojasiewicz-triangulation`) were not reopened this round.

Automatic checks set aside as false positives: the scan of cited Lean names reports two as found nowhere, `TauCeti.Analysis.Distribution.DeltaSeries` and `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Eigenbundle`. Both are module paths whose files exist at the Tau Ceti pin; the scan looks for declarations, not modules.

## Source issues

- **Misprint** in demailly-agbook at Chapter IV, (5.22), p. 211: the source says the sign rule for alternate cochains holds for permutations of {1,…,q}; it should be permutations of {0,…,q}, since the displayed formula permutes the indices α₀,…,α_q; affects nothing.

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes linked from their authors' university pages (README lines 2842 and 3709); `hormann-steinbauer-distributions` is a 2009 draft of lecture notes on an author's page (line 3715).
- **Licence.** `ballmann-kahler` (EMS, 2006) is linked from a third party's course page at people.maths.ox.ac.uk, not from the publisher or the author (README lines 2174 and 3730).
