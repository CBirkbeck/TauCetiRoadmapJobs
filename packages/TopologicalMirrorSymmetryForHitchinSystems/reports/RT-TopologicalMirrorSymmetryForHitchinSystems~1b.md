<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1562#issuecomment-6416325228 -->
Red team round 1 pass b (claude) of 0a0dea3

Verdict: needs changes

1. **F01** (P2) Even-degree hypothesis narrows the headline theorems below the source

   **Location.** `README.md` line 19 (Conventions): "For the main comparison D⊗ω⁻¹ has strictly positive even degree or is trivial"; line 839 (§4.1): "Dω⁻¹ of positive even degree or trivial"; line 967 (§5.1): "Dω⁻¹ have strictly positive even degree or be trivial". Inherited by §§5.3–5.6 ("the main finite-field setting", "finite-field setting of the main theorem").

   **Claim.** The parity of deg D is not a hypothesis of the mirror-symmetry theorem nor of the GL degree comparison; it is needed only by the SL degree comparison §4.2 (and the SL half of §4.3), where the degree-zero line N = M⁻¹Qⁿ needs n | deg M = −n(n−1)deg D/2, i.e. (n−1)·deg D even. The README's own route for §5.1 (§§3.9, 4.7, 2.7/2.8, 0.7) never consumes §4.2, and §4.1's route (Lang on the Jacobian torsor, Bézout on an n-torsion class) does not use parity either. Imposing it narrows §5.1 and §4.1 below what the source proves (brief: "never narrow a statement below what the sources support").

   **Witness.** GWZ20 Theorem 7.21 (arXiv 1707.06417v3 lines 2671–2674) and Theorem 7.15 (lines 2500–2503) assume only "D⊗(Ω¹_X)⁻¹ of strictly positive degree or equal to O_X"; parity enters only in the proof of Theorem 7.16 (lines 2584–2590, choice of Q with n·deg Q = deg M), exactly where the README's own Check at line 864 ("At n=2 and deg D=1, deg M=−1 is not divisible by 2") places it. Instance in scope after the repair: elliptic X, D of degree 1, n=2, d=1: dim M_SL=(n²−1)deg D=3, spectral genus n(n−1)deg D/2+n(g−1)+1=2, Prym dimension 1, base H⁰(D²) of dimension 2, total 3: consistent, nothing in Layers 2–5 breaks.

   **Repair.** Line 19: "For the main comparison D⊗ω⁻¹ has strictly positive degree or is trivial; the SL degree-independence targets §§4.2–4.3 additionally require deg D even (for odd n this is automatic)." Line 839: delete "even". Line 967: delete "even". Line 854 keeps "positive even degree or trivial" and line 870 (§4.3) states the parity for the SL statement only. §3.9, line 792: replace "prove emptiness for both D=ω and deg D=0" by "prove emptiness for every D of degree ≤ 0 (D = O(−2), O(−1), O)"; the displayed block argument already covers it, since each component B→(E/B)⊗D lies in H⁰(O(a_j+deg D−a₁)) with a_j<a₁ and deg D≤0. Tested on the new instance ℙ¹, n=2, d=1, D=O(−1): E=O(1)⊕O, Hom(O(1),O(1)⊗D)=Hom(O(1),O⊗D)=0, so O(1) is θ-invariant of slope 1>1/2; both moduli empty, both invariants 0=0. Lines 1085 ("For genus zero with D=ω or deg D=0") and the §§4.1–4.3, 5.1, 5.3, 5.6 phrases "D=ω or deg D=0" change to "deg D ≤ 0" accordingly.

2. **F02** (P2) Br(O_F)=0 is cited from a supplier section that does not state it

   **Location.** `README.md` line 135: "Consume Layer 5 for the normalized local invariant Br(F)→ℚ/ℤ, Kummer cup-product evaluation and Br(O_F)=0 for a complete discrete valuation ring with finite residue field"; line 426 (§1.4 Check), lines 929–931 (§4.6 route: "Evaluation of its gerbe gives a class in Br(O_F)=0"), line 935 (§4.6 Check), and the `*Needs:*` lines of §§1.4, 2.4, 4.2, 4.6, 5.5 ("TauCetiRoadmap.ClassFieldTheory Layer 5").

   **Claim.** ClassFieldTheory Layer 5 does not state the vanishing of the Brauer group of the ring of integers. The statement is owned by SchemeAndStackFoundations §2.22.

   **Witness.** ClassFieldTheory on main, Layer 5 (lines 920–1219): the Brauer carrier is `Br F = H²(G_F,(Fˢ)ˣ)` with the invariant, Kummer cup pairing, `localSymbol` and Tate duality; no sentence mentions Br of O_F, a henselian ring or the ring of integers (searched for "Br(O", "Br(𝒪", "ring of integers", "henselian"). SchemeAndStackFoundations §2.22 on main (heading line 4428; lines 4491–4494) proves `brauer_henselian_local`: for a henselian local ring R with residue field k, Br(R)→Br(k) is an isomorphism, and records that Br(k)=0 for finite k is in Tau Ceti.

   **Repair.** Line 135: "...Kummer cup-product evaluation; Br(O_F)=0 for a complete discrete valuation ring with finite residue field is SchemeAndStackFoundations §2.22, `brauer_henselian_local`, with Br(k)=0 for the finite residue field." Add "TauCetiRoadmap.SchemeAndStackFoundations §2.22" to the `*Needs:*` lines of §4.6 and §1.4 (the two that use the vanishing), and leave the ClassFieldTheory citation for the invariant. Tested on the instance used in §4.6: O_F complete, hence henselian, k_F finite: Br(O_F) ≅ Br(k_F) = 0, so a constant class evaluated at an integral point is 0 and f_α ≡ 1 on that fibre.

3. **F03** (P3) The accepting review's four notes are still open at this head

   **Location and witness** (all `README.md` at `0a0dea3`): line 87 "§§A¹.3, A¹.5" (the supplier prints `### A1.3 Invariant differentials`, `### A1.5 The theorem of the cube and multiplication pullbacks`; the string "A¹" occurs nowhere in it); lines 417 and 421 use "Br(X)_K" undefined (GWZ20 defines it, arXiv v3 line 1925, as the classes of Br(X) that die over K^sep); line 203 "corrected χ-counts" with no corrected variant defined; lines 841 and 858 assert what the uncertified source prints; line 578 "the imported Lemma 6.7" names a source lemma as supplier; line 563 does not parse ("after its prime-to-characteristic equal-characteristic extension the equal-characteristic local-duality supplier contract").

   **Repair.** As the review stated: "A1.3, A1.5"; define "Br(X)_K := ker(Br(X)→Br(X_{K^s}))" at line 417; delete "corrected" at 203; line 841 "The torsor-class argument uses gcd(d,n)=gcd(e,n)=1; coprimality of e with d is not used."; line 858 "The sign of M in N and in the torsor power is the one fixed by §3.10."; line 578 "the D7.6 gerbe-evaluation square, extended to equal characteristic by the local-duality contract"; line 563 "after its extension to equal characteristic, prime to the residue characteristic, through the equal-characteristic local-duality supplier contract". (The claims at 841 and 858 are in fact true of the arXiv text, see Source issues, but the README cannot cite a text it records as uncertified.)

4. **F04** (P3) A pinned declaration's hypothesis is misdescribed

   **Location.** `README.md` line 49: "Use `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` ... over a finite commutative group and a characteristic-zero domain containing enough roots of unity."

   **Claim.** The pinned statement has no characteristic-zero hypothesis.

   **Witness.** `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean` at the pin, lines 133, 143–145 and 182: `[Finite G] [CommGroup G] [CommRing M] [IsDomain M] [HasEnoughRootsOfUnity M (Monoid.exponent G)]`; conclusion `∑ χ : G →* Mˣ, (χ σ)⁻¹ * χ g = if g = σ then Nat.card G else 0`.

   **Repair.** Line 49: "over a finite commutative group G and a domain M with enough roots of unity of order the exponent of G (`HasEnoughRootsOfUnity M (Monoid.exponent G)`); the sum of χ(σ)⁻¹χ(g) over all characters is |G| at g=σ and 0 otherwise." Tested: for G=C₃ and M=ℚ̄ℓ the instance holds and gives the §5.6 normalisation (1+1+1)/3=1, (1+ζ+ζ²)/3=0.

No pass-a report exists on the pull request: the comments on it are the three package reviews, two fix notices and the accepting review of `0a0dea3`; the package's `reports/` folder has no `RT-…~1a.md`. Pass-a findings therefore cannot be confirmed or denied here. The four P3 notes of the accepting review of `0a0dea3` are still present at this head and are recorded under R03.

Checkout: the board checkout is at `0a0dea3` (the pull request's current head). Files read in full: `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md` (1096 lines, 44 numbered subsections), `Suggested.lean` (54 lines, no declarations), `metadata.toml`, `sources.toml`, `design/plan.json` (`gaps`), the three earlier reports and the accepting review.

## Verified sound

**Scope and policy.** `git diff --stat origin/main...HEAD` touches only the package folder (README, Suggested.lean, design/plan.json gaps, metadata.toml, sources.toml, reports). No `lemma`, no pull-request numbers, no process words, no `set_option`, no `#eval`/`#print`; every one of the 44 subsections has a locator and a `*Needs:*` line; a script over all 44 `*Needs:*` lines found no forward or self reference (0 bad of 44).

**Dependency check**, exact output:

```text
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is line 314 of 315 in `merge-order/ORDER.txt`; every cited supplier in the order precedes it (SchemeAndStackFoundations 2, EtaleCohomologyFoundations 18, ReductiveGroupsPartII 23, AlgebraicModuliForArithmeticGeometry 35, AbelianSchemesAndArithmeticModuli 46, ArithmeticGaloisRepresentations 47, ArithmeticGaloisDuality 48, DeligneWeightsAndPurity 91, EtaleDualityAndPerverseSheaves 117, LogicAndDefinabilityInNumberTheory 153, EndoscopicTransferAndUnitaryTraceComparison 161, CohomologyComparisons 204, CountingBundlesAndHallAlgebrasOfCurves 273); ClassFieldTheory, JacobianChallenge, AlgebraicVectorBundles are on main and HodgeStructures is completed.

**Suppliers resolved at their current heads** (95 section citations, 20 roadmaps). Open heads through the roadmap service: EndoscopicTransferAndUnitaryTraceComparison 3.6/3.7/3.8/3.10/3.12/3.13/3.14/3.16 at reader lines 1237/1271/1290/1344/1417/1444/1461/1522 (3.6 is over k=𝔽_q, as line 631 says; 3.16 is the anisotropic finite-field count, as the contract says); AlgebraicModuliForArithmeticGeometry 1.3, 2.1, 2.2, 4.1, 4.2, 4.3, 4.5, 4.9, 4.20, 5.1, 7.3, 7.6.1, 8.2, 9.4, 9.5, 9.7 (lines 579–10203) with `quotientGerbeTransgression` at 2343 and `quotientInertiaComponents` at 2359 (finite constant group, conjugacy-class decomposition, as §0.6 uses); AbelianSchemesAndArithmeticModuli A1.3, A1.5, A2.2 (dual abelian scheme and Poincaré bundle), A2.3 (Mumford map), A3.2–A3.7 (A3.5 dual isogeny with Cartier-dual kernel and the e_n pairing, A3.7 polarized Weil pairing); ArithmeticGaloisDuality D7.6 with the two named paragraphs at 5968 ("finite extension of ℚ_ℓ") and 6018 ("nonarchimedean local field of characteristic zero", index formula |B(F)/φA(F)|=|ker φ(F)| for a self-dual isogeny of degree prime to the residue characteristic); CohomologyComparisons 2.15 (proper smooth X/C, twist −b, ℙ¹ check); DeligneWeightsAndPurity 7.8, 7.12, 7.15; EtaleDualityAndPerverseSheaves 3.7, 6.3, 6.4; ArithmeticGaloisRepresentations 1.7, 1.8, 5.1, 5.2, 5.3; ReductiveGroupsPartII RG2.3.7 "Lang's theorem and lifting". Board package LogicAndDefinabilityInNumberTheory (#164, head 972ee8e, read through the contents API): 2.5 Jacobian change of variables (446), 2.7 gauge measures (488), 2.8 null loci (514), 2.9 Weil volume (526), 2.11 dual abelian isogeny volume invariance (570: any nonarchimedean local field, degree prime to p, so equal characteristic is included as §2.5 here says), 2.12 Fubini (580), Layer 3 (600). Sibling CountingBundlesAndHallAlgebrasOfCurves at its open head: 7.1 (1102, canonical Higgs stability), 7.3 (1141, g≥1 canonical coarse moduli, proper Hitchin map), 9.1 (1260, ℓ-adic purity of H_c of the canonical coprime GL space, g≥1); its line 1562 names this roadmap as a consumer. On main: SchemeAndStackFoundations 0.6, 1.15, 1.16, 1.20–1.23, 2.11, 2.15 (Hochschild–Serre), 2.22, 3.4–3.7, 4.6; EtaleCohomologyFoundations F.2.1, F.2.4–F.2.7 (F.2.5 states "no finiteness assertion built into its definition", as line 109 says), F.4.2–F.4.6, F.5–F.7; JacobianChallenge Layers A–E (111, 135, 143, 218, 332); AlgebraicVectorBundles L0B (228), L0C (254); ClassFieldTheory Layers 5, 6, 7 (920, 1220, 1312); Completed/HodgeStructures Core definitions (104), L2 (326), L3 (378), Relation to sibling roadmaps (423), effective weight one (223). The citation-resolver lead (LogicAndDefinabilityInNumberTheory §2.11) is a board package outside the resolver's index, not drift.

**Pinned declarations** (local package checkouts at the manifest pins, Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`): `sum_hom_units_eq_zero` `Mathlib/RingTheory/IntegralDomain.lean:186`; `Matrix.trace` `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; `AddMonoidAlgebra` `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`; `TauCeti.Hodge.MixedHodgeStructure` `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` (rational increasing exhaustive weight filtration, decreasing bounded Hodge filtration, pure graded pieces, on base-change models, as line 43 says); `TauCeti.Hodge.tate_hodgeNumber` `…/Tate/Basic.lean:160` (nonzero only at p=−m); `InvertibleSheaf` `…/LineBundle/Basic.lean:112`; `LineBundleClass` `…/LineBundle/Class.lean:50` and `LineBundleClass.inv_mk` at line 104; `AbelianVariety` `…/AbelianVariety/Basic.lean:95` (proper geometrically integral group object over a field); `rigidifiedPicardFunctor` `…/PicardFunctor/Rigidified.lean:66`; `rigidifiedPicardPoint` `…/PicardFunctor/Point.lean:40`; `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite` `…/CharacterOrthogonality.lean:182` (R04). No file in the pinned Tau Ceti mentions Higgs, Hitchin, Prym, stringy invariants, gerbes, lisse sheaves, the étale fundamental group or compact-support étale cohomology; `Suggested.lean` therefore correctly states nothing, names all 30 headline theorems with the missing carrier, has the required docstring form, namespace, single `import Mathlib`, no `set_option`, no `sorry`'d data. The `#check @name` step has no declarations to run on; nothing changed. No padding, no stand-in.

**Declared gaps** (13, slugs identical in `plan.json` and the README contracts, each with a named supplier and section that exists). Minimality rechecked at the heads: AlgebraicModuli has no Hartogs statement (grep: 0) and neither it nor AbelianSchemes has Picτ (0); EtaleDuality 3.7/6.3–6.4 mention no stack (0); HodgeStructures has no compact-support realization (0); CountingBundles 9.1 has no fixed-determinant or sector statement (0); D7.6 is characteristic zero; Logic has no equivariant scissor ring (its 15 "equivariant" hits are Néron/isogeny sentences). Each `needs` is one interface with hypotheses; none has supplier `none`.

**Ownership.** Service grep over main and the 367 indexed open heads for Hausel–Thaddeus, stringy E, topological mirror, abstract Hitchin, principal splitting, splitting torsor, SL/PGL/fixed-determinant Higgs: 17 hits, all unrelated uses of "splitting torsor" (ArithmeticGaloisDuality R02.1.4, BunGAndNewtonStrata, HilbertModularVarieties, ColemanPowerSeries, AdmissiblePairs, AdicEtaleGeometry, PadicMeasuresIwasawaAlgebras). No competing owner. Ownership against the sibling checkouts named in the brief was taken from the service index and the board-packages index; CountingBundlesAndHallAlgebrasOfCurves was read from its checkout.

**Sources.** HT03 (arXiv v1 cache): Proposition 3.2 at line 385 on numbered page 10 (page markers 367/404), Proposition 3.6 at line 498 on page 13 (487), §6 from line 647 on page 17, with Theorem 6.2's purity argument (compact rational homology manifold family) and Theorem 6.4's twisted-sector version, which support the purity use in §§4.3, 5.2. ITO04 (v3 cache): Lemma 4.3 line 524 page 12, Proposition 5.1 line 555 page 13, Definition 5.2 line 573, Definition 5.3 line 611 page 14, §5.3 line 624, Example 5.5 line 666 page 15: all as cited. BITTNER04 (v1 cache): Lemma 7.1 line 812 page 18, the representation-quotient ideal at 805, equivariant SNC completion at 830–835 and the equivariant factorization theorem at 839: all as cited. GWZ20: the operator's sources cache holds the legal arXiv text 1707.06417v3 (fetched for ArithmeticGaloisDuality D7.6, which cites it with author pages); it was read for §§2.1, 2.4, 2.5, 6 and 7. Its item numbering agrees with the README's published locators throughout §§2 and 7 (Definitions 2.4, 2.13, 2.14, 2.16, Theorems 2.15, 2.18, 2.19, Lemma 2.17; Definition 7.1 … Lemma 7.25, all 30 items located) and is shifted by one in §§5–6 (arXiv Corollary 5.28, Definition 6.14, Lemma 6.15, Theorem 6.16 correspond to the README's 5.29, Remark 6.14, Lemma 6.16, Theorem 6.17, consistent with one inserted item in print). The statements compared agree with the README except where the README deliberately corrects the source (Source issues below): weighted χ-counts, inverse-M norm target, M^{1−e} power label, N=M⁻¹Qⁿ, degrees 0/1 of the deformation complex, μ_n rigidification, the weak μr-neutrality condition replaced by the sufficient Brauer condition, and the virtual rather than actual fibre comparison.

**Computed adversarial pass** (values on both sides; every construction and theorem was instantiated; the rows below are the ones that discriminate).

| Statement | Instance | Computed | Result |
|---|---|---|---|
| §0.1 stack trace with 1/Aut | BC₂ over 𝔽₃, χ trivial / sign | 1/2+1/2=1 / 1/2−1/2=0; H⁰(pt)^χ gives 1 / 0 | agrees; source Def 2.14(b) omits the weight |
| §0.1 sign action on A¹/𝔽₃ | trivial χ | objects: x=0 (mass 1/2), {1,2} (1), twisted torsor x³=−x: x=0 (1/2), {±i} (1): 3; trace on H_c²=ℚℓ(−1): q=3 | agrees |
| §0.1 Künneth for abelian G | V⊗W, χ-part | ⊕_ψ V^ψ⊗W^{χψ⁻¹}; sign⊗sign has sign multiplicity 0 | agrees |
| §0.2 root systems | q=4, r=2 | exp((log 4+2πi)/2)=−2; s₁=4; s₆²=s₃ | agrees |
| §0.4 all ℓ-power roots | image 1+ℓ^kℤℓ, ℚℓ-valued | exp(ℓ^{k−m}u) leaves ℤℓ for m≥k; ℚ̄ℓ-valued compatible roots exist (inverse limit of nonempty finite sets of x∈1+𝔪 with x^{ℓ^m}=exp(ℓ^k)) | agrees; source Lemma 2.17 proof has the gap |
| §0.6 stringy BG | BC₂ split; BS₃ | sectors 2, each mass Σ_{[g]}1/|C(g)|=1: 2; S₃: 3 classes, 3 | agrees |
| §0.6/§0.7 [A¹/C₂] | 𝔽₃ | identity sector 3, σ-sector [pt/C₂] mass 1, age 1/2: 3+√3; E: xy+(xy)^{1/2} | agrees (Examples line 320) |
| §0.7 inverse sector | r=3 | traces ζ and ζ⁻¹ differ | agrees |
| §1.1 orders (e², e, e) | k=𝔽₅, e=2 | H⁰(k,H²(C₂,μ₂))=2, H¹(k,Hom(C₂,μ₂))=2, H²(k,μ₂)=0: 4; Pic/2=2; H²(Gₘ)[2]=H¹(k,μ₂)=2 | agrees |
| §1.1 e∤q−1 | 𝔽₅, e=3 | Frobenius x↦x⁵=x⁻¹ on μ₃: invariants 0, coinvariants 0: (1,1,1) | agrees |
| §1.1 local field | ℚ₅, e=2 | 2·4·2=16; Pic/2=2; 16/2=8 | agrees |
| §1.1 over ℂ | e=2 | (2,2,1) | agrees |
| §1.2 rigidified splitting sheaf | 0→f_*Gₘ/r→R¹f_*μr→Pic[r]→0, f_*Gₘ=Gₘ | Gₘ/r trivial étale-locally: R¹f_*μr≅Pic(U/V)[r] | agrees |
| §1.3 neutral gerbe on E | r | Split_μr=E[r], contracted with Pic⁰=E∨: E∨ | agrees |
| §2.2 self-duality square | types | ψ∘φ∨ and φ∘ψ∨ both P₂∨→P₂ | agrees (source Def 6.9(b)) |
| §2.3 orientation | a=xy on Gₘ² | (y dx+x dy)∧(−dx/x)=dx∧dy | agrees |
| §2.3 densities | ℚ₃, 𝔽₃((t)) | vol(πO)=1/3; |π²|^{1/2}=1/3 | agrees |
| §2.5 index formula | self-dual φ, p∤deg | |H¹(F,K)|=|K(F)||K^D(F)|=|K(F)|²; H¹(F,A)[φ] dual to coker φ(F): |coker|=|ker| | agrees (also Logic §2.11 route) |
| §2.6 one empty fibre | t₁≠0 | phase ξ·exp(2πi⟨·,t₁⟩) nontrivial by nondegeneracy; integral 0 | agrees |
| §3.1 stabilizers | rank 2, fixed det | λ²=1: μ₂ not Gₘ | agrees; source Remark 7.2 says Gₘ |
| §3.2 dimension | general D / D=ω | χ(End₀⊗D)−χ(End₀)=(n²−1)deg D; D=ω: 2(n²−1)(g−1) | agrees |
| §3.3 Γ nonsplit | y²=x³+x+3/𝔽₁₇ | cubic values at x=0..16: 3,5,13,16,3,14,4,13,13,10,10,2,9,3,7,10,1 (no root); disc ≡9≠0; μ₁₆⊂𝔽₁₇ | agrees |
| §3.6 norm target | π_*O_Y=⊕D^{−j}, det E=Nm(B)·M | Nm(B)=L·M⁻¹; n=2: LD | agrees; source Lemma 7.8(a) writes LM |
| §3.7 Prym connected | deg D>0 | π*N≅O ⇒ N↪D^{−j}, only j=0: π* injective, ker Nm connected | agrees |
| §3.8 kernel of λ|P_SL | P_SL⊥=π*J_X | P_SL∩π*J_X=π*J_X[n]: self-dual with kernel Γ | agrees |
| §3.9 genus 1, D=O | n=2,d=1 | stable ⇒ θ=0, E stable with det L unique: M_SL=pt, M_PGL=BΓ, Prym dim g_Y−g=0, base dim 1 | agrees; source Prop 7.11 fails here |
| §3.9 genus 0 | D=O, n=2, d=1 | E=O(a)⊕O(1−a), a≥1, lower entry in H⁰(O(1−2a))=0: empty | agrees |
| §3.10 powers | e=0,1,2; n=2 | P^M, P^L, P^{L²D} | agrees |
| §4.2 N | n=2,g=2,D=ω | deg M=−2, deg Q=−1, N=ωQ² of degree 0; L^eM^{1−e}Q^{n(e−1)}=L^eN^{e−1} | agrees |
| §4.2 parity | n=2, deg D=1 | deg M=−1 not divisible by 2 | agrees; source Thm 7.16 lacks the hypothesis (R01, Source issues) |
| §4.3 Hodge from E | mixed sector | needs degree purity; alternating sum loses it | agrees |
| §5.1 roots | n=2,g=2, 𝔽_{3⁸} | 3⁸−1=6560=32·205, μ₃₂ present, p=3>2 | agrees |
| §5.2 ages | symplectic Γ-action | eigenvalues pair ζ^b,ζ^{n−b}; −1-eigenspace symplectic hence even: age=codim/2∈ℤ | agrees |
| §5.4 traces vs actions | I₂, J₂ | J₂^m rows (1,m),(0,1): trace 2, fixed space dim 1 vs 2 | agrees |
| §5.5/§5.6 Fourier | C₃ | (1/3)Σ_ν ζ^{νγ}ζ^{−νδ}=δ_{γδ}; projector |G|⁻¹Σχ(g)⁻¹g gives Tr(Fr∘proj_χ)=|Γ|⁻¹Σ_νχ(ν)Tr(ν⁻¹Fr) | agrees (source (31)) |
| Layer 3 example | n=2,g=2,D=ω | g_Y=4·1+1=5, Prym 3, base 3g−3=3, total 6=(n²−1)(2g−2); Γ order 16, root order 32 | agrees |

Counts: 0 Lean declarations (file read in full); 44 targets read (14 constructions with 6, 6, 7, 6, 11, 6, 5, 5, 6, 10, 5, 7, 5, 5 Checks, 30 theorems); 10 locators verified against the three cached open texts and 45 GWZ20 items located and compared in the cached arXiv text; about 115 Checks and worked-example values recomputed (every Check that states a number or an instance); 95 cross-roadmap section citations resolved in 20 roadmaps; 12 pinned declarations opened.

## Not verifiable

- GWZ20 published pagination and the published item numbers in §§5–6 (the README's "Corollary 5.29", "Remark 6.14", "Lemma 6.16", "Theorem 6.17"): the manifest records the published text as uncertified; the cached arXiv v3 was used for the mathematics only. The arXiv copy is a legal open-repository version that the Sources rules would record on the same key as an `arxiv` locator with a `version_note`; whether to reopen the settled `uncertified` status is a human decision, not a repair instruction.
- The sign in §5.5, T_γ(ν)=(ν,γ)⁻¹T_γ(0) with ν=δ(L L_ν⁻¹): the README's conventions (ν⁻¹Fr, conjugate f_α in §2.4, χ_γ(ν)=(ν,γ)) are mutually consistent and reproduce the Fourier identity of §5.6, but the source's own §7.5 is inconsistent about the direction of ν (Source issues), so the sign cannot be certified from a text; it is visible only for n>2 and is pinned by the README's C₃ Checks.
- The geometric theorems themselves (properness, the codimension-two certificate of §3.9 in the regular range, sector purity, the §5.4 actual isomorphism, the arithmetic descent of the Hausel–Thaddeus gerbes for general D) are targets; this pass checked statements, hypotheses, conventions and controls, not proofs.
- Ownership against the sibling checkouts other than CountingBundlesAndHallAlgebrasOfCurves was checked through the service index of open heads, not by reading each checkout.

## Source issues

- **Misprint** in GWZ20 at Definition 2.14(b), arXiv 1707.06417v3 line 604–608 (published p.523): the source says the χ-twisted count is the sum of Tr(Fr_x,(L_χ)_x) over the isomorphism classes of [X/G](𝔽q); it should divide each term by |Aut(x)| as in Definitions 2.3 and 2.13 (BC₂ gives 1, not 2); affects a stated result.
- **Gap** in GWZ20 at Lemma 2.17 proof, arXiv v3 lines 671–681 (published pp.525–526): the source says exp((1/r)log ρ) defines an r-th root of the Tate twist for every r≥1 with one open subgroup U; it should restrict to r prime to ℓ or enlarge coefficients to ℚ̄ℓ, since (1/r)log ρ leaves the domain of exp when ℓ divides r; affects the proof.
- **Gap** in GWZ20 at §6.3, arXiv v3 lines 2069–2071 (published p.570): the source says a global translation-invariant trivialising section of Ω^top_{P₂/A} exists because P₂ is an A-group scheme; it should shrink A (the zero-section determinant line need not be trivial); affects the proof.
- **Misprint** in GWZ20 at Definition 7.1(a), arXiv v3 line 2236 (published p.575): the source says E is a vector bundle on S; it should say on X; affects nothing.
- **Misprint** in GWZ20 at Remark 7.2, arXiv v3 line 2253 (published p.576): the source says the moduli space is the rigidification with respect to Gₘ; it should say μ_n, the scalar automorphisms of a stable Higgs bundle with a fixed determinant isomorphism, as §7.4 uses; affects nothing.
- **Misprint** in GWZ20 at Lemma 7.3 proof, arXiv v3 lines 2266–2268 (published p.576): the source says the deformation complex sits in degrees −1 and 0 while reading automorphisms, tangents and obstructions from H⁰, H¹, H²; it should say degrees 0 and 1; affects nothing.
- **Error** in GWZ20 at Lemma 7.8(a) and the proof of Lemma 7.13, arXiv v3 lines 2346–2347 and 2479 (published pp.579, 582): the source says the Hitchin fibre is Nm⁻¹(L⊗det π_*O_Y); the norm formula in the same proof gives Nm⁻¹(L⊗det(π_*O_Y)⁻¹), and Lemma 7.13(a),(b) are stated for that corrected convention; affects a stated result.
- **Error** in GWZ20 at Theorem 7.16 proof, arXiv v3 lines 2584–2591 (published pp.584–585): the source says deg M=(−deg D)n(n−1), hence divisible by n, and writes (P^L)^e≃P^{L^eM^{e−1}}, N=MQ^{−n}; it should say deg M=−n(n−1)deg D/2, divisible by n only when (n−1)deg D is even, and M^{1−e}, N=M⁻¹Qⁿ; affects a stated result (Theorem 7.16 and the SL part of Corollary 7.17 need deg D even for even n).
- **Gap** in GWZ20 at Propositions 7.11–7.12 and Theorem 7.21, arXiv v3 lines 2463–2472 and 2671–2678 (published pp.582, 588): the source says a dense torsor locus with codimension-two complement exists for every genus; for g=1, D=O only θ=0 is stable, the Prym has dimension 0 and the base dimension 1, so no such locus exists, and for g=0 with deg D≤0 the moduli are empty; it should treat these cases separately; affects the proof.
- **Gap** in GWZ20 at Theorem 7.23 proof, arXiv v3 lines 2701–2709 (published p.589): the source says purity of the direct-image complexes reduces an isomorphism of fibre representations to equal point counts; purity of the complex gives only weights ≤ i on H^i of a singular fibre and no Frobenius semisimplicity, so equal traces give equal virtual semisimplified classes; affects the proof.
- **Error** in GWZ20 at §7.5, arXiv v3 lines 2739–2742, 2769–2773 and 2814–2815 (published pp.590–593): the source says the twist label is δ(L L₂⁻¹) when defining M^{[ν]}, δ(L₁L₂⁻¹) in (32), and "M^{L₂} is the twist of M^{L₁} by ν" in deriving (35), while Lemma 7.7 twists by δ(L₂L₁⁻¹); it should fix one direction of ν throughout (the sign is invisible for n=2); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0a0dea3", "job": "RT-TopologicalMirrorSymmetryForHitchinSystems~1b", "pass": "b", "worker": "fable-rt231"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0a0dea3", "job": "RT-TopologicalMirrorSymmetryForHitchinSystems~1b", "model": "fable", "worker": "fable-rt231"} -->
