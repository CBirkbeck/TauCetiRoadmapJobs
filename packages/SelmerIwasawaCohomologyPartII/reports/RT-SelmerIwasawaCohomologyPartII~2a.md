<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6324868195 -->
Red team round 2 pass a (codex) of 120054d

Verdict: needs_changes

1. **F01** (P2) The second datum imports the wrong §4.1

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:777: “Include the §4.1 moduli data”; its Needs at :787 cites “Layer 4 §4.1”.

   **Claim:** The second datum includes this roadmap’s diagonal datum, while allowing nonsplit even spaces and special maximal levels at a nonempty raising set outside Σ⁺min.

   **Witness:** README:536 requires hyperspecial levels and self-dual lattices outside Σ⁺min. At an inert raising place the nonsplit even unitary group has no hyperspecial level. ltxzz line 6244 instead references the source’s §4.1.

   **Exact repair text:** “Include the auxiliary CM-moduli data of ltxzz §4.1. Construct the native finite addition-of-line map as in this roadmap’s §4.1, with the exceptional set enlarged to Σ⁺min∪Σ⁺lr,II: self-dual lattices and hyperspecial levels are required only outside that union.” In §4.1, parameterize the construction and its naturality API by an arbitrary finite exceptional set, and explicitly specialize to Σ⁺min for the rank-one endpoint. Cite that generalized construction in §6.1. Add the Check: “For Σ⁺lr,II={v}, with v inert and the even space nonsplit, the second datum permits its special maximal level at v; it must not require a hyperspecial level there.” Source domain: ltxzz lines 6198–6230.

2. **F02** (P3) The ramified coefficient Check uses a false tensor identification

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:330: “take T=ℤℓ … T_O≃O”.

   **Claim:** For O=ℤℓ[π]/(π²−ℓ), the convention T_O=O⊗_ℤT makes O⊗_ℤℤℓ canonically O.

   **Witness:** Rationalization gives E⊗_ℚℚℓ→E. For transcendental a∈ℤℓ, 1⊗a−a⊗1 is nonzero and maps to zero; a ℚ-derivation with da≠0 detects it. Thus multiplication is not an isomorphism.

   **Exact repair text:** “Level ramified quadratic: take T=ℤ, O=ℤℓ[π]/(π²−ℓ), M=O and m=1. The raw contraction is (ℓ), giving O/(π²) with nonzero π-action; T_O=O⊗_ℤℤ≃O has kernel (π), giving O/(π).” Keep the existing general coefficient convention. This changes only the witness, not the repaired theorem.

3. **F03** (P2) L5-1 omits the supplier’s prime-field linearity condition

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:279: “HomΓF(End(R̄),R̄)=0”; :853 invokes the restriction criterion of EulerSystemsAndKolyvaginSystems §1.6.

   **Claim:** The unspecified Hom vanishing on kλ-coefficient modules supplies the restriction-injectivity premise. The usual kλ-linear interpretation is insufficient when kλ≠𝔽ℓ.

   **Witness:** TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:876 requires Hom_𝔽ℓ[ΓF](End_kλ(R̄),R̄)=0, equivalently vanishing for every Frobenius twist of the adjoint. Over k=𝔽₄₉, C₄₈-weights 7,6 have adjoint weights 0,1,−1: k-linear Hom vanishes, but x↦x⁷ maps weight 1 to 7.

   **Exact repair text:** “In the second branch of L5-1, with k=kλ, require Hom_𝔽ℓ[ΓF](End_k(R̄),R̄)=0, equivalently Hom_k[ΓF](End_k(R̄)^(σ),R̄)=0 for every σ∈Gal(k/𝔽ℓ), together with the displayed k-dimension bound and semisimplicity. Use the corrected restriction criterion of EulerSystemsAndKolyvaginSystems §1.6.” Propagate this precise condition through §§7.2 and 7.4; the family argument must verify every twist. Add the C₄₈/𝔽₄₉ control above, explicitly as a coefficient-linearity test rather than an automorphic datum. The printed proof at ltxzz lines 702–707 identifies scalar restriction followed by extension with identical adjoint copies; its summands are Frobenius twists. Do not copy that identification.

4. **F04** (P3) The new coboundary example tests no roadmap definition

   **Location:** packages/SelmerIwasawaCohomologyPartII/Suggested.lean:74: “example : (-1 : ℤˣ) • (1 : ℤ) - 1 = -2”. README:53 calls this the coboundary-sign test.

   **Claim:** This proved example tests the roadmap's coboundary convention.

   **Witness:** The type mentions neither `specialInertPlace`, `definiteDiagonalPeriod` nor `TauCeti.ContCohomology.d0`. It remains true if the actual coboundary convention changes sign. The pinned `d0_apply` is at TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:185.

   **Exact repair text:** Delete this standalone example. Add `import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` after `import Mathlib`, and add the following conjunct to one of the two existing `definiteDiagonalPeriod` examples, with a proved calculation using `d0_apply`:

   ```lean
   definiteDiagonalPeriod
     (fun s : Bool => if s then (-1 : ℤˣ) else 1)
     (fun _ : Bool => PUnit.unit)
     (fun q : ℤˣ × PUnit => TauCeti.ContCohomology.d0 ℤˣ ℤ 1 q.1) = -2
   ```

   Replace README:53 with: “cochain_sign: the two-point definite period of the actual coboundary d0(1) for the sign action of ℤˣ on ℤ is 0+(−2)=−2; the proved period example invokes d0_apply.” This tests the kept period definition and the actual convention while retaining at most two examples per kept definition.

5. **F05** (P3) The very-special predicate has no discriminating reflexive-closure Check

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:254: “also requiring v to split completely in F⁺rflx”; Checks at :271–275.

   **Claim:** The Checks exercise both special and very special inertness.

   **Witness:** Replacing very-special inertness by special inertness passes all five Checks. For F=ℚ(√(−3+√2)), F⁺rflx=ℚ(√2,√7); the prime (17,√2−6) is special inert but does not split in F⁺rflx.

   **Exact repair text:** Add these two named boundary targets and Checks after the existing Gaussian positive control, with the locator “ltxzz-published Definitions 3.3.2–3.3.4, lines 1542–1556; explicit quartic specialization”:

   “`verySpecial_quartic_separation`: Let F=ℚ(α), α²=−3+√2, with F⁺=ℚ(√2). Its two distinct CM reflex fields are ℚ(√(−6+2√7)) and ℚ(√(−6−2√7)); their intersection is ℚ(√7), so F⁺rflx=ℚ(√2,√7). The place v=(17,√2−6) has norm 17 and is special inert: 3 is a nonsquare modulo 17, and 17 does not divide the discriminant of X⁴+6X²+7, namely 2¹⁰·7. It is not very special, since 7 is a nonsquare modulo 17. This rejects the incorrect definition verySpecial=special.”

   “`verySpecial_quartic_positive`: For the same field, v=(103,√2−38) is very special: −3+38=35 is a nonsquare modulo 103, while 7=25² modulo 103; 103 is unramified. This tests a positive case with nontrivial F⁺rflx/F⁺, rather than making that extension trivial.”

   Keep these as README targets until the supplied reflexive-closure carrier exists. Together with the Gaussian control they test the additional defining condition without forcing a Lean stand-in.

## Verification of round-one findings

Each row quotes the current repaired passage. The two reviews’ IDs are distinguished by their pass. No prior finding was marked “not actionable in this package”.

| Earlier finding | Status | Repaired passage and verification witness |
| --- | --- | --- |
| r1a F01; r1b F03 | Repaired | README:122,587: “AG2.1b (Weight separation into the middle degree) and its archimedean multiplicity subsection”. The supplier at c4cc6a16ac58 has these at TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1159,1169. The ST/END restriction and separate gap remain. |
| r1a F02 | Repaired | README:29: “assume μ(K) is a unit before writing e_K=μ(K)⁻¹1_K”; :54 supplies C₂/𝔽₂. Source-subgroup rescaling is explicit. Zero volume is never inverted. |
| r1a F03 | Repaired | README:646: “give … the transpose action (t·f)(x)=f(tx)”; :647 names firstDatum_testModule_adjoint and transports the character by the inverse-coset involution. At :670 the cyclic example has pairing 2 and Pᵗf=4f, so the incorrect descent is excluded. |
| r1a F04 | Repaired | README:160: “The basic square of Proposition 4.5.5 is Cartesian for even n only”; :799 uses the all-parity product square. The same parity clauses occur in the plan gap; :805 tests n=3. Source witnesses: ltxzz lines 2286–2297,2552–2563. |
| r1a F05 | Repaired | README:23: “Σ⁺bad … every place of F⁺ above a rational prime ramified in F”. Both representation supports are included, and :55 tests ℚ(i) at 2. Source witnesses: ltxzz lines 434,1038–1039,1112–1119. |
| r1a F06 | Repaired | README:792: “The derivatives at 3 and 1 are respectively 11 and 13; the tensor root 3 is simple with derivative 4.” Direct multiplication in 𝔽₁₉ verifies all three values; P₀(−1)=0. No global datum existence is claimed. |
| r1a F07 | Repaired | README:455–471 names localizedBoundaryComparison, localizedIntertwiner, localizedIntegralConcentration, oddTate_surjective, oddE2_concentration and oddFrobenius_comparison, each with its own Needs. At :467: “no A6.1.4, A6.1.6 or H(N) is assumed”; :471 includes them. Source: ltxzz lines 5204–5208,5221–5258,5280–5313. |
| r1a F08 | Repaired; new Check error S02 | README:31: “Define n_(Π,m)^Σ=ker(T_O^Σ→A_m)”; :512 specializes through “T_O/nΠ≃A_m”. These kernels impose πᵐ even for ramified coefficients. The convention propagates to the first/second laws, annihilators and period witness; the Check’s unrelated tensor identification is S02. |
| r1b F01 | Repaired | README:192,477,490,500,510,640 now use “ℓ≥2(N+1)” or “ℓ≥2(n₀+1)”. Published locators are given; the genuinely strict L1 bound remains ℓ>4n. |
| r1b F02 | Repaired at the five reported sites; new S01 | README:312,335,355,640,686 now prefix the source section references with “ltxzz”. The same unresolved source/internal-section collision remains at :777 and changes the level domain; see S01. |
| r1b F04 | Partly repaired | README:46 imports the supplier’s reflect tests. Suggested.lean:74 instead proves only “(-1 : ℤˣ) • (1 : ℤ) - 1 = -2”; it does not invoke d0. Its failure to test the actual construction is S04. |
| r1b F05 | Repaired statically | Suggested.lean:153–155: “change (∑ _ : Bool, (1 : ZMod 2)) = 0”, followed by Fintype.sum_bool and decide. This leaves a closed decidable equality in ZMod 2. Elaboration is not rerun in this read-only pass. |
| r1b F06 | Repaired | README:975–982 contains only the mathematical bibliography and version/locator distinctions. The source-manifest/process paragraph is absent. |
| r1b F07 | Repaired | README:240: “New obligation after §4.1: hermitian local-global classification”. The plan uses the same gap and new-obligation locator; the README no longer claims the theorem is already in §4.1. |
| r1b F08 | Repaired as a carrier/signature issue | Suggested.lean:25–29 defines specialInertPlace with a real body; README:256 explicitly states its general number-field domain and CM specialization. The four named Gaussian/square-norm targets occur in both files. IsUnramifiedIn quantifies over every upper prime; the signature contains all field/algebra instances. The two proved examples check the norm-two and nonprime-extension rejection clauses; the positive Gaussian instance remains an admitted named target. |

## Verified sound

The complete 982-line README and 157-line Suggested.lean were read. The audit covers **17 Lean declarations** (2 definitions, 10 theorem targets, 5 proved examples), **70 bold README targets** (21 supplier contracts and 49 native API targets), all **40 numbered subsections**, and **98 Check bullets**. The Check count includes numerical calculations, counterexample tests and geometric domain checks against the cited models; it is not a count of executed Lean tests. Findings S01–S05 qualify the corresponding rows below.

The statement inventory and boundary tests follow. “No change” means no further defect found in that statement, conditional on its declared suppliers; it does not certify that the supplier obligations are implemented.

### Bold README target inventory

Each line refers to packages/SelmerIwasawaCohomologyPartII/README.md. Results are conditional on the declared supplier contracts.

| Line | Target | Instances, result and change |
| --- | --- | --- |
| 96 | Adic arithmetic Hochschild–Serre edge identification. | Single geometric row 2n−1 versus ℙ¹; edge only on the stated row/concentration domain; declared adic gap. |
| 116 | All-place purity and finite regulator theorem. | Ramified coefficient field; w above ℓ; weight −1; rational and torsion integral regulator conclusions are separate; declared gap. |
| 124 | Exact cohomological multiplicity H(N). | N=2,3 and N=4 over ℚ; only the first two discharge H(N); conjugate representation retained; declared gap. |
| 128 | Rational cuspidal concentration on the native diagonal product. | F⁺=ℚ and reducible residual system; rational cuspidal concentration does not borrow integral irreducible-boundary comparison; declared gap. |
| 136 | Transfer dimension comparison in even rank. | Small residue characteristic; non-small transferable level; existing S_FL restriction remains distinct from declared extension gap. |
| 140 | Local unitary constituents and cohomological decomposition. | Primitive finite-field link versus local tower; no identification of these different cohomology objects; declared gap. |
| 156 | Native unitary Shimura schemes and integral models. | Nonproper model; other place over detecting rational prime; smoothness alone is insufficient; full specialization comparison declared. |
| 160 | Special homomorphism under basic uniformizations. | n=2 versus n=3; basic Cartesian square even only, ground square odd only, product square both; repaired parity contract. |
| 168 | Integral filtered nearby complex and stratum spectral sequence. | Two and three branches; ℓ=p excluded; nonproper punctured affine line; columns/nearby abutment and integral operator have explicit domain. |
| 172 | Integral nearby cycles, weight sequence and monodromy. | Relative dimension 2r−1 versus odd-rank relative dimension 2r; parity vanishings required; no cohomological weight-monodromy equality. |
| 176 | Singular cohomology and the potential boundary cokernel. | Unipotent Frobenius; actual kernels/cokernels; support comparison required; declared potential-boundary gap. |
| 184 | Chow cycles and the arithmetic étale regulator. | Zero cycle and proper trace of a double cover; coefficients and support domain explicit; integral regulator is a declared extension. |
| 192 | Rigid R=T, complete intersections and Hecke freeness. | Zero localized module; odd rank with raising set; cyclotomic irreducibility in higher rank; stated exclusions retained. |
| 196 | Eventual rigidity in the two specified families. | Arbitrary relevant pair and F⁺=ℚ excluded from family theorem; separate eventual rigidity gap. |
| 202 | Congruence image lifting for polarized tensors. | m=1,2 and ℓ-part of a lift; prime-to-ℓ powering/compatible cyclotomic image required; declared gap. |
| 206 | Independent elliptic images and Steinberg tensor criterion. | CM elliptic curve, isogenous pair, arbitrary relevant pair; outside the two specified family domains; S03 must propagate to all twists. |
| 216 | Finite Hecke-support contraction at chosen Frobenius. | Ramified Oλ and finite exclusions; coefficient-algebra kernels retained; bare Chebotarev does not prove the quotient comparison. |
| 222 | Boundary localization at irreducible residual systems. | Reducible residual system and nonproper boundary; irreducibility essential; declared gap. |
| 228 | Hermitian Frobenius incidence varieties and their cohomology. | Degenerate hermitian forms and N=2,3; Appendix A domain retained; new supplier obligation. |
| 234 | Hilbert modular level raising comparison. | Odd g=1,3; even g excluded; LIInd and dimension hypotheses retained; declared gap. |
| 242 | Global hermitian spaces with prescribed invariants. | Incompatible local Hasse invariants; existence is conditional on the product relation; new obligation after §4.1. |
| 260 | Very special inert is special. | Gaussian 3; implication true by conjunction; very-special Checks need S05. |
| 261 | Very special inert of reflexive. | Fᵣflx=F versus quartic CM example; equality only under displayed hypothesis; S05. |
| 262 | Special inert residue. | Norm 3 gives upper residue cardinality 9; norm p² excluded; CM quadratic domain is essential and explicit. |
| 263 | Special inert transport. | Identity and conjugate field isomorphism; ideal norms, global ramification and CM structure transported. |
| 283 | Admissible iff clauses. | ℓ=2,3; ξ=±1; zero/scalar image; explicit clauses reject them; specify Hom linearity (S03). |
| 284 | Admissible change basis. | Conjugate bases and homothetic lattices; image spectra and Hom conditions preserved; S03 changes only the coefficient condition. |
| 285 | Admissible polarized tensor. | n=2,3; r₀+r₁=n; tensor polarizations give dual twist 1. |
| 286 | Admissible not small prime. | n=2 and ℓ≤8; L1 excludes every such prime; ranks 0,1 outside standing domain. |
| 316 | Level datum ext. | Identity/equal data and proof irrelevance; no equality claimed for differing carrier fields. |
| 317 | Level datum reduce. | a=1,m and ramified π; n_a=n_m+λᵃ; right exact quotient reduction preserves P6. |
| 318 | Level datum ideal maps. | Zero module, unit ideal and ramified coefficients; quotient/annihilator/localization distinguished; new witness defect S02. |
| 319 | Level datum change level. | Identity cover and λ-divisible cover degree; P6 is separately required at the new level. |
| 339 | Basic correspondence representable. | N=2 and empty indexing scheme; finite étale source and isogeny retained; no invented nonempty source. |
| 340 | Basic correspondence base change. | Residue extension and identity level map; geometric fibre dimension and normal bundle commute with base change. |
| 341 | Basic correspondence uniformize. | Definite pair and Hecke maps; actual native uniformization datum required. |
| 359 | Semistable strata local equation. | xy=p, p inverted; two reduced special branches and smooth generic fibre. |
| 360 | Semistable strata base change. | Identity and étale level changes; universal isogenies and actual strata transported. |
| 361 | Semistable strata generic fiber. | Nonproper model; ordinary/compact comparison supplied separately; no false general nearby/generic equality. |
| 395 | Weight complex incidence matrix. | N=2 special matrix, N=3 odd matrix, N=4 even matrix; p=3 gives entries −16 and 4. |
| 396 | Weight complex singular sequence. | Frobenius 4 on ℤ₃ and p²−1 nonunit; unit exclusion and invariants/coinvariants distinction retained. |
| 397 | Weight complex functorial. | Odd boundary vector (p+1,−1,0); matrix followed by (0,T•°,(p+1)²) gives zero; N=2 uses even formula. |
| 423 | Product resolution ext. | Exceptional geometric point has zero image ideal; uniqueness only for effective-Cartier inverse-image centre. |
| 424 | Product resolution cycle. | Identity off centre; graph generic fibre dense; proper birational pushforward has multiplicity one. |
| 425 | Product resolution coefficient. | Reduction modulo π and compatible étale levels; additive projective/blowup splittings retain coefficients. |
| 426 | Product resolution components. | Centre component has empty ordinary strict transform; closure of complement of Z yields nonempty blowup component. |
| 427 | Product resolution exceptional products. | Quartic C at p=3; η² contribution −bη; section self-intersection −16; disjoint section product zero. |
| 540 | Diagonal datum ext. | Identity isometry; transported levels identify finite map without degree scaling. |
| 541 | Diagonal datum refine. | Refine source alone by degree 2; square commutes but is not Cartesian; additional Cartesian premise retained. |
| 542 | Diagonal datum product. | n=2 gives dimensions 1,2,3 and graph codimension 2. |
| 561 | Diagonal graph cycle support. | Graph of identity and zero cycle after linear extension; support is actual closed graph. |
| 562 | Diagonal graph cycle pushforward. | Degree 1,2 and disconnected degree variation; pushforward counts source degree componentwise. |
| 563 | Diagonal graph cycle class. | Point graph and zero cycle; Gysin unit has positive class and trace 1. |
| 581 | Projected aj add. | Zero cycle and Δ−Δ; regulator additive and Eλ-linear. |
| 582 | Projected aj edge. | ℙ¹ point class; no false edge identification without concentration. |
| 583 | Projected aj reduce. | Ramified Oλ reduction and integral torsion; only stated concentration/freeness domain permits congruence edge. |
| 644 | First datum to level datum. | Even and odd rank extraction; PI4–PI6 provide corresponding P4–P6; tensor PI7 remains separate. |
| 645 | First datum ext. | Identity and conjugate isometries; preserve chosen CM data and characters. |
| 646 | First datum test module. | Three-cycle over 𝔽₇; same-action annihilator fails with pairing 2; transpose dual correctly descends. |
| 647 | First datum adjoint comparison. | Inverse cyclic permutation gives transpose; transported character uses involution; repaired adjoint comparison. |
| 648 | First datum reduce. | m→1 and zero quotient; Nakayama for finite modules preserves nonzero support and quotient comparison. |
| 725 | Cycle boundary presentation. | Two-term π² differential and unipotent Frobenius; actual kernel/image/cokernel and quotient factorization retained. |
| 726 | Cycle boundary compare cycle. | Zero cycle and connecting class; cycle-class comparison conditional on full support/concentration hypotheses. |
| 727 | Cycle boundary naturality. | Identity level and coefficient reduction; no assertion that tensoring kernels is left exact. |
| 781 | Second datum ext. | Nonempty raising set with nonsplit even local space; internal §4.1 import needs S01. |
| 782 | Second datum graph function. | Two source points over one pair give multiplicity 2; legitimate finite-period specialization; S01 for data domain. |
| 783 | Second datum reduce. | m=0 excluded, m→1 permitted; simple polynomial conditions preserved; S01 for data domain. |
| 878 | One place annihilator. | One detector, other places over same rational prime, w above ℓ; all-place nonsingularity inputs explicitly retained; S03 upstream. |
| 879 | Two place annihilator. | Triangular D, primitive t=(−1,π), positive loss c; first local value zero and second exponent k−c; total loss 2c; S01/S03 upstream. |
| 880 | Rigidity from level-raising specialness. | N=2 simple pair over 𝔽₁₁ versus N=4 repeated pair over 𝔽₁₉; only simple pair satisfies new rigidity condition. |

### Suggested.lean declaration and context inventory

All line numbers in this table refer to packages/SelmerIwasawaCohomologyPartII/Suggested.lean. There are no section `variable` or `include` blocks: every instance needed by these signatures occurs explicitly in its declaration. Universe names are u,v,w,z,t. The declared namespace is TauCetiRoadmap.SelmerIwasawaCohomologyPartII. The only import is Mathlib.

| Declaration; line; layer | Variable and instance context | Instances tried | Result; change |
| --- | --- | --- | --- |
| specialInertPlace; 25; 1 | K:Type u, F:Type v; Field/NumberField for each; Algebra K F; v:Ideal (𝓞 K) | Zero/unit ideal; norm 2; norm p²; split extension; identity field extension | Real conjunction with global unramifiedness; zero/unit ideals rejected. General number-field domain explicitly documented; CM conclusions separately specialized. No change. |
| specialInertPlace_Qi_three; 33; 1 | Closed ℚ, CyclotomicField 4 ℚ, ideal (3) | X²+1 over 𝔽₃ has no root; discriminant −4 | Special inert and upper norm 9; true target. |
| specialInertPlace_Qi_five; 40; 1 | Same closed fields, ideal (5) | X²+1 has roots ±2 modulo 5 | Extended ideal not prime; true target. |
| specialInertPlace_Qi_two; 45; 1 | Same closed fields, ideal (2) | Norm 2 and ramification | Both exclusions valid; true target. |
| specialInertPlace_not_square_norm; 51; 1 | Explicit K,F field/number-field/algebra instances; v; p:ℕ; hp:p.Prime; hv:absNorm v=p² | p=2,3; hypothetical p=0,1 | Squares 4,9 nonprime; hp excludes 0,1. True target. |
| Norm-two example; 58; 1 | Same explicit K,F instances; v; hv:absNorm v=2 | Any norm-two ideal, including an otherwise unramified inert one | Correct rejection by oddness conjunct; static proof checked. |
| Nonprime-extension example; 65; 1 | Same explicit K,F instances; v; hv:¬(Ideal.map algebraMap v).IsPrime | Split ideal versus prime extension | Correct rejection; static proof checked. |
| Sign-formula example; 74; 1 | Closed ℤˣ action on ℤ | Nonidentity unit acting on 1 | Arithmetic equality true; construction test defective (S04). |
| definiteDiagonalPeriod; 81; 5 | S:Type u, Fintype S; X:Type v, Y:Type w; R:Type z, AddCommMonoid R; a,b,f | Empty S; two coincident points; zero monoid; infinite X,Y | Values 0,2,0; no codomain finiteness required. Real finite sum, not a geometric replacement. |
| definiteDiagonalPeriod_add; 86; 5 | Same context; f,g:X×Y→R | Empty source; torsion monoid | Finite-sum distributivity; true with no cancellation assumption. |
| definiteDiagonalPeriod_smul; 94; 5 | S finite; X,Y arbitrary; R:Semiring; c:R; a,b,f | Zero semiring; noncommutative matrix semiring | Left distributivity suffices; no commutativity/nonzero hypothesis needed. |
| definiteDiagonalPeriod_map; 101; 5 | S finite; X,Y arbitrary; R:Type z,T:Type t additive commutative monoids; h:R→+T | Zero homomorphism; ℤ→ZMod 2 | Finite sums commute with additive maps; coefficient reduction correct. |
| definiteDiagonalPeriod_reindex; 108; 5 | S:Type u and S':Type t both Fintype; e:S'≃S; X,Y arbitrary; R additive commutative monoid | Empty equivalence; Bool swap; repeated image point | Bijection counts source multiplicities once; true. |
| definiteDiagonalPeriod_fiber; 117; 5 | S,X,Y all Fintype, at u,v,w; R:Type z additive commutative monoid; a,b,f | Empty fibre; two points over one pair; ZMod 2 | Nat.card finite subtype gives weights 0,2; no injectivity or characteristic-zero assumption. |
| definiteDiagonalPeriod_exists_ne_zero; 126; 5 | Same context as definition; h:period≠0 | Empty S; all values zero; signed two-point cancellation | Forward implication true; converse not asserted. |
| Integer period example; 135; 5 | Closed PUnit, Bool, Fin 0 with ℤ coefficients | Singleton, coincident pair, empty source | 1,2,0; all conjuncts test the kept period definition. |
| Cancellation/torsion example; 146; 5 | Closed Bool, PUnit; ℤ and ZMod 2 | Values −1,+1; two coincident unit values modulo 2 | 0,0; revised final `decide` goal is closed. No elaboration rerun. |

The ten admitted statements contain no admitted data, hidden hypotheses or conclusion-as-hypothesis. Every named Lean declaration occurs in the README. No additional native geometric headline is easy to state at these pins: the required unitary model, nearby-cycle, arithmetic-regulator and Selmer carriers are supplier targets. No forced geometric headline was found. The period API specializes existing finite-sum facts to the kept functional; it does not redevelop finite summation.

### Adversarial mathematics pass on the remaining prose

This table covers all 40 numbered subsections, including the non-bold targets and construction conventions. The bold-target and Lean tables supply the finer API-level tests.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficients and Hecke conventions, README:21–42 | Ramified π²=ℓ; C₂ counting measure over 𝔽₂; empty finite source; unit ideal | λ-powers required; zero volume not invertible; source-volume normalization stated | S02 concerns only the new tensor Check |
| Frobenius, twists, hγ and coboundary, :25–27 | n=2; inert p=3; γ=(I,−1)c; sign action | Tensor rank 6, twist 2, weight −1; scalars 9 and 1/9; hγ=−I; d0 value −2 | S04 for actual Lean convention test |
| Polynomial/Hecke conventions, :46–48,65 | Reciprocal degrees 1,2; r=1,q=3,a=3 or 2 | Reflect signs −,+; I°=16; (q+1)R°−I°=0; T°=9/2,I°=105/2 | No change |
| Torus invariants, :40,52 | Free C₂ orbit, coefficients 𝔽₂; nonfree component action | Orbit trace 1 versus total trace 0; freeness explicitly required; exactness through torsor descent | No change |
| §1.5 special/very special predicates | Gaussian 2,3,5; residue degree 2; quartic CM field at 17 and 103 | Special predicate matches ideals; very-special clause needs a separate discriminating test | S05 |
| §1.6 admissibility | ℓ=2,3; ξ=±1; scalar identity; k=𝔽₄₉ | Small/excluded witnesses rejected; k-linear adjoint exclusion is weaker than prime-field exclusion | S03 |
| §2.1 datum and quotients | m=0,1,2; empty/infinite exceptional set; ramified Oλ | m≥1 and finite sets retained; reduction correct; bare/extended tensor distinction in Check fails | S02 |
| §2.2 basic isogeny correspondence | N=2,3; empty source; residue extension | Fibre dimensions 0,1 and codimension 1; supplied admissible forms include even-rank degeneracy | No change |
| §2.3 incidence strata | xy=p; invert p; N=3,p=3 quartic | Two reduced branches; smooth generic fibre; normals have degrees 16 and −16 | No change |
| §2.4 cohomology and excess bundle | Minimal relative position; ℓ divides p+1; empty strata | p+1 points and ℙ⁰; restriction isomorphism requires degree a unit | No change |
| §2.5 complex, filtration and matrices | N=2,3,4; node restriction on basis; Frobenius 4 on ℤ₃; punctured affine line | Even zero-link convention; signs ±1; invariants 0 versus coinvariants 𝔽₃; nearby and generic abutments differ | No change |
| §2.6 product resolution | xy=uv=p; empty centre; exceptional point; quartic normal bundle | Three branches per chart; five E₁ columns; Cartier condition only sufficient; nontrivial ℙ¹-bundle and Chern signs correct | No change |
| §3.1 localizedBoundaryComparison | Nonproper versus proper; reducible residual representation | Boundary comparison only on residual absolutely irreducible domain | No change |
| §3.1 localizedIntertwiner | Bad Satake pair before localization; P5 after localization | Localized unit composite and invariant-rank comparison both retained | No change |
| §3.1 localizedIntegralConcentration | Residual off-middle vanishing; adjacent-degree torsion | Derived reduction/Nakayama removes integral torsion; geometric finite-type/perfect domain supplied | No change |
| §3.2 oddTate_surjective | N=3 without H(N), A6.1.4 or A6.1.6 | Surjectivity retains the weaker source domain | No change |
| §3.2 oddE2_concentration | N=3 with A6.1.4 only | Link parity and concentration kill other E₂ positions | No change |
| §3.2 oddFrobenius_comparison | Nonsemisimple 1-eigenvalue; absent H(N) | Coinvariant comparison additionally needs irreducibility/multiplicity and weak semisimplicity | No change |
| §3.3 even integral freeness | N=2; zero localized support; exceptional transfer level | Nonzero support and rigid R=T retained; transfer beyond S_FL domain declared | No change |
| §3.4 ground eigenvalues | Distinguished pair p,p⁻¹; p²=1 modulo λ | Values 1,p² removed only under stated simple-pair and unit conditions | No change |
| §3.5 even singular comparison | F−1 nonunit; ramified Oλ | Inertia quotient and singular group identified only after the specified Frobenius exclusions; coefficient kernel imposes λᵐ | No change |
| §3.6 Galois realization | Multiplicities 1,2; lattice homothety | Isomorphism exists; no canonical coordinate claimed; specialization through A_m | No change |
| §3.7 odd level change | Empty, singleton and two-place P; missing intertwining genericity | Identity for empty P; localized intertwiners compose; no unrestricted-level comparison | No change |
| §4.1 diagonal datum | n=2; incompatible levels; source-only refinement | Dimensions 1,2,3; inclusion needed; square need not be Cartesian | Generalize exceptional set for S01 |
| §4.2 graph cycle | Zero cycle; identity graph; double cover; varying degrees | Values 0, positive unit class, 2Δ and componentwise source degrees | No change |
| §4.3 projected AJ | n=2; ℙ¹ point; nonproper reducible residual system | H¹ of degree 3/twist 2; general point has no such edge identification; rational/integral hypotheses separated | No change |
| §4.4 purity and finite membership | Weight −1; ℓ ramified in F; good/nonproper reduction | L1/L2 and full regulator comparison retained; purity includes dual-invariant vanishing | No change |
| §4.5 multiplicities and conjugation | Reducible Galois factor; nonzero tuple with two coordinates | H(N) antecedent needed; some coordinate nonzero without a canonical choice | No change |
| §4.6 regulator naturality | Identity, double cover, source-only refinement, coefficient extension | Trace counts source degree; pullback retains all graph-preimage components | No change |
| §5.1 first datum and dual test module | Repeated tensor root over 𝔽₁₁; cyclic action over 𝔽₇; zero support | PI7 independent of factor conditions; transpose action repairs descent; zero quotient rejected | No change |
| §5.1 finite period | Singleton, empty, coincident pair, signed cancellation, characteristic 2 | Values 1,0,2,0,0; all six API statements valid | No change apart from S04 test integration |
| §5.2 first geometric law | n=2,3; both correspondence legs | Parity-specific ground/link diagrams and multiplicities retained | No change |
| §5.3 product cohomology targets | Degrees 1+2; c≥3 empty stratum; only A7.2.3 or only A7.1.1 | Middle degree 3; empty groups zero; weaker targets keep independent domains | No change |
| §5.4 potential and boundary maps | π² two-term differential; unipotent Frobenius over 𝔽₃; zero cycle; class on one component | Cokernel exponent 1; invariants→coinvariants zero; four J domains are Q°• or Q•• as stated | No change |
| §5.5 first explicit law | p=3; singleton graph; transpose eigenfunction | Scalar 4φ₀(I°)φ₁(T°); evaluation descends after adjoint comparison | No change |
| §5.6 first exponents | Zero class; unit versus nonunit factors | Unit factors preserve exponent; necessary unit hypotheses present | No change |
| §6.1 second datum | Nonempty nonsplit raising set; F₁₉ polynomial; double source fibre; m=0 | Level mismatch; polynomial derivatives 11,13,4 and P₀(−1)=0; multiplicity 2 | S01 |
| §6.2 second geometric law | n=3 | Product square uses Lemma 4.5.2, not the even-only basic square | No change |
| §6.3 odd special-fibre coinvariants | N=3; omit concentration or H(N) | Additional source hypotheses retained | No change |
| §6.4 exponent bound | O/π²→O/π; zero class | Exponent can strictly decrease 2→1; only inequality asserted | No change |
| §7.1 polarized image lifting | m=1,2; ξ²=1; pro-ℓ part | Prime-to-ℓ lift and free simple eigenspaces required; excluded ξ not admitted | No change |
| §7.2 detection | c=0,c≥k; zero realised span; triangular D; primitive v | Basis only at zero loss; t=(−1,π) kills first evaluation; span premise remains uniform | S03 for restriction input |
| §7.3 annihilators and rigidity | Two detectors; w above ℓ; other w above p₁; simple/double Satake pair | Crystalline conditions required on both arguments; two-place loss 2c; double pair fails rigidity enlargement | S01/S03 propagate through inputs |
| §7.4 eventual admissibility | F⁺=ℚ; CM/isogenous elliptic pair; arbitrary relevant pair | Excluded cases not claimed; two families keep their distinct inputs | S03 requires all coefficient twists |
| §8.1 rank zero | Rank-one saturated lattice; finite positive loss c; vanishing period | Contradiction only with nonzero period and m exceeding fixed losses; no c=0 inference | S03 propagates |
| §8.2 rank one | Nonzero multiplicity coordinate; rank-two lattice; primitive pair not a basis | Lower bound by coordinate; upper bound uses primitive kernel and total 2c loss | S01/S03 propagate |
| §8.3 removal of H(N) | n=2 over ℚ; n≥3 over ℚ; non-ℚ totally real base | H(2),H(3) discharged; higher ℚ case keeps H(N); eventual admissibility does not remove uniform span | No additional change |
| §8.4 ranks (2,3) | ℓ≤8; deleting L6 or L7 | Small ℓ rejected and all seven clauses retained | No additional change |
| §8.5 Hilbert precursor | g=1,3; even g; wrong Satake congruence | Degree/twist correct on odd domain; LIInd and residual dimension retained | No change |

Zero rings and equal-characteristic coefficient fields are permitted only in the light finite-sum identities or the explicitly stated finite-coefficient geometric domain. Oλ and Eλ elsewhere are the integers and field of a finite extension of ℚℓ. Rank zero, rank one, inseparable number-field extensions and nonfinite exceptional sets are outside the corresponding arithmetic hypotheses; none was silently admitted. Empty finite sources, empty raising sets and empty strata are included where stated.

### Sources, supplier citations and ownership

**Locators verified: 174 distinct source-line anchors across all six cited works.** The anchors below count a repeated locator once; nearby lines and displayed ranges were read to check the hypotheses and formulas. The source definitions, geometric comparison domains and normalization equations support the targets subject to the findings above. The coefficient-restriction error at ltxzz lines 702–707 is addressed by S03. The repaired product uses the actual normal bundles, rather than inheriting the source's unqualified product-bundle description.

| Source | Anchor count | Verified line anchors |
| --- | ---: | --- |
| ltxzz-published | 7 | 1533, 1542, 1549, 6408, 6746, 7345, 7359 |
| ltxzz-deformation | 3 | 1444, 1761, 1880 |
| ltxzz | 153 | 124, 136, 191, 196, 200, 434, 591, 600, 620, 648, 745, 781, 846, 870, 883, 914, 918, 942, 1038, 1044, 1112, 1149, 1204, 1222, 1259, 1273, 1637, 1737, 1744, 1788, 1871, 2286, 2297, 2488, 2509, 2517, 2552, 2653, 2744, 2754, 2823, 2901, 2985, 3349, 3368, 3518, 3722, 3766, 3785, 4023, 4055, 4081, 4110, 4122, 4151, 4213, 4214, 4219, 4223, 4432, 4461, 4710, 4725, 4755, 4762, 4777, 4793, 4899, 5076, 5080, 5093, 5121, 5136, 5139, 5164, 5173, 5195, 5204, 5221, 5230, 5247, 5255, 5280, 5304, 5307, 5314, 5623, 5634, 5647, 5650, 5655, 5660, 5662, 5741, 5822, 5835, 5839, 5875, 5880, 5899, 5931, 5940, 5948, 5950, 5952, 5953, 6011, 6024, 6030, 6037, 6044, 6152, 6158, 6192, 6195, 6231, 6250, 6257, 6303, 6312, 6368, 6400, 6410, 6418, 6429, 6459, 6484, 6489, 6548, 6568, 6571, 6613, 6617, 6633, 6681, 6700, 6743, 6748, 6755, 6764, 6767, 6773, 6793, 6796, 6805, 6828, 6848, 6856, 6879, 6887, 6901, 6937, 9631 |
| liu-tian | 4 | 1384, 1407, 1477, 1496 |
| stacks-blowup | 4 | 3632, 3750, 3906, 3918 |
| stacks-projective | 3 | 3361, 3391, 3479 |

The manifest has entries for all six works, with legal open-repository or institutional copies. No additional work needed fetching, and no missing reference request is required. The published reflexive closure and coefficient-prime bounds were checked separately from the preprint; the published H(N) and L1–L7 locators are not silently assigned preprint numbering.

**Sibling citations checked: 24 named supplier-contract subsections.** Existing section/name claims and declared extensions were distinguished. The local supplier revisions used for verification are recorded below; paths are TauCetiRoadmap/<name>/README.md. Main-branch suppliers were read on main even when another branch exists. The six supplied open sibling checkouts were also searched by object: K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. No overlapping special-inert, native unitary level-raising, Hecke-dual or finite-period target was found there.

| Supplier | Local revision | Sections/names checked; scope result |
| --- | --- | --- |
| EtaleCohomologyFoundations | 26fc4a3e2e63 | F.0.3, F.2.1–F.2.3, F.2.6–F.2.7, F.3a, F.4.0–F.4.6, 0.9–0.11, F.6–F.7; finite/adic, ordinary/compact and Galois-action domains agree. |
| StableReduction | 26fc4a3e2e63 | Layer 4: relative-Proj blowup, universal property, strict transform and charts. |
| ProfiniteCohomology | 26fc4a3e2e63 | Layers 1–3, 5–8, 10: finite discrete comparisons, exactness, restriction and cups; no adic claim inferred. |
| Chebotarev | 26fc4a3e2e63 | Layers 1–2 and 10: arithmetic Frobenius classes and finite exclusions. |
| SchemeAndStackFoundations | 26fc4a3e2e63 | 0.3, 2.15 hochschildSerre_galois_covering, 5.4 projectiveBundle, 5.5 normal/Gysin conventions; separate adic gap. |
| SelmerIwasawaCohomology | 17f60560d7f6 | 0.12–0.13, 2.6–2.7, 4.8–4.11, 4.24–4.25; weak semisimplicity, crystallineNonsingular_map, reduction and uniform annihilation. |
| EulerSystemsAndKolyvaginSystems | 4fb7ae990e3d | 1.2–1.3, 1.6, 1.11, 1.15, 4.4; expAt, ordAt, reducibilityDepth, θ_S, realised span and scaled_inverse. Prime-field restriction mismatch is S03. |
| SmoothRepresentationsOfLocalGroups | 28803294a655 | SR.1.1–SR.1.2 and SR.4.1, SR.4.4; permutation/convolution domains, adjoint involution, paired parameters, all three genericity predicates and even/odd formulas. |
| ArithmeticGaloisDuality | 5b7027c11722 | R02.4.2–R02.4.3, D7.4, D7.7; defined pairings, reciprocity, coefficient and local-condition compatibilities. |
| AutomorphicGaloisRepresentationsPartII | c4cc6a16ac58 | AG2.1b, AG2.2, AG2.5–AG2.7 and named subsection titles; compact ST/END concentration and full native extension distinguished. |
| EndoscopicTransferAndUnitaryTraceComparison | f8f8c2b09070 | 9.1, 11.2–11.4, 12.12–12.15, 13.1, 13.5–13.9; packets, towers, definite functions, TransferableLevel and S_FL restrictions. |
| IgusaVarietiesAndTorsionConcentration | 55adf550b90c | IG.7.2; every finite enlargement quantified, F⁺≠ℚ retained for of_decomposedGeneric. |
| PELModuli | 2d82d078308c | M0.25–M0.26, M2.8, M2.12–M2.14, M4.3, M4.5–M4.9; reflexive closure, unitary deformation, kernel ranks, CM torsor and orbit trace. |
| ShimuraVarieties | ce108212b4c3 | 5.1 CM types/reflex fields and 6.7 abelian-type canonical models; native special models and diagrams separately declared. |
| LefschetzPencilsAndVanishingCycles | 1b8f741b9269 | 7a.7–7a.9; finite/adic stalks versus rational filtered sequence; integral complex, two-component quotient and boundary remain declared extensions. |
| MotivesAndAlgebraicCycles | c3dad319dd28 | 7.16–7.18; homologically trivial cycle/rank domain; integral arithmetic regulator separately declared. |
| GlobalGaloisDeformations | 29e415cbfb93 | 3.3–3.8 and 5.2; deformation infrastructure and rank-two cyclotomic predicate, not a higher-rank dihedral equivalence. |
| ArithmeticGaloisRepresentations | 81f6496983d9 | Image lifting and eventual-image claims explicitly new obligations; no nonexistent section cited as an existing theorem. |
| LocalGaloisDeformationRings | e18984688bc7 | 1.6, 2.3, 2.12, 2.20; FLDeformation.coefficientRealization, minimal_baseChange, fixed-multiplier LevelRaising predicates, IsRigidFor projections and mono. |
| IntegralHeckeAndGaloisDeterminants | 3eb09ab770f3 | PI6/PI8/PII8 coefficient-kernel comparison explicitly a new obligation. |
| ShimuraCompactifications | b5675ac208c9 | Native residual boundary vanishing explicitly a new obligation. |
| ReductiveGroupsPartII | 0d37c3f452ad | Appendix A incidence/cohomology explicitly a new obligation. |
| HilbertModularVarietiesAndShimuraCurves | 5db7b73b4057 | Liu–Tian §4.1/Theorem 4.7 explicitly a new obligation, not attributed to an existing section. |
| AdelicAlgebraicGroups | 7b84aae1803e | 4.1 is Weak approximation and torsors; hermitian Hasse classification explicitly new after it. |

All **21 gaps** have matching slugs and named suppliers in packages/SelmerIwasawaCohomologyPartII/design/plan.json and the README's exact supplier-contract paragraphs. Their explanatory contracts state the consumed hypotheses and residual extensions; none has supplier `none`. They are accepted as declared contracts, not defects merely because their implementations are absent. The committed plan changes are confined to `gaps`.

Object searches also covered the active and completed main roadmaps and both pinned libraries. Existing finite summation, ideal norms, unramifiedness, polynomial reflection, explicit cohomology and blowup charts remain upstream. No ownership move is required by the findings.

The pinned names and their actual contexts were checked in the cited files: NumberField and inst_ringOfIntegersAlgebra; Ideal.absNorm and Ideal.map; Algebra.IsUnramifiedIn; CyclotomicField; Polynomial.eval/eval_X, derivative/derivative_X, reflect/coeff_reflect; Module.torsion_by_prime_power_decomposition and free_iff_isTorsionFree; TopRep.homogeneousCochains and continuousCohomology; ContinuousCohomology.cochainsMap, map, map_id and map_comp; reesAlgebra/mem_reesAlgebra_iff; TauCeti.ContCohomology.d0, H1, H1pi, both subsingleton_H1 instances and nsmul_H1_eq_zero; and the four named affineBlowupι chart declarations. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

### Dependency and policy checks

The required dependency gate exited 0 with exactly:

```text
depcheck: 7 roadmaps, 63 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Because that gate reports a seven-roadmap scan, a separate direct order check covered all 24 named supplier contracts: 21 appear before SelmerIwasawaCohomologyPartII at merge-order/ORDER.txt:141, and StableReduction, ProfiniteCohomology and Chebotarev are already on main. The latest listed supplier is IgusaVarietiesAndTorsionConcentration at :140. The internal numbered Needs edges have no forward-reference cycle; S01 is a wrong-domain import, not a merge-order cycle. No supplier was moved.

The committed diff from origin/main changes nine files, all under packages/SelmerIwasawaCohomologyPartII, with 1735 insertions and 11 deletions. README and Suggested.lean have no process narrative, pull-request numbers, `lemma` declarations, `set_option`, computational algorithms, `True` placeholders, admitted data or admitted examples. sources.toml and metadata.toml parse. Suggested.lean remains below 5000 lines and has declaration docstrings and the prescribed module/namespace form. S04 records the one example-policy defect.

## Not verifiable

- Lean elaboration and elaborated `#check @name` output were not rerun: this review is read-only and authorizes no Lean command. Types and proofs were checked statically. The previous repair report records a successful elaboration, but that is not independent execution evidence from this pass.
- Implementation of the 21 declared supplier gaps is outside this package. The review accepts those precise contracts conditionally and does not certify their completion.
- Existing supplier branch contents were checked at the local revisions listed above. Whether an unprovided remote revision has changed since those snapshots was not verified; the six explicitly supplied sibling heads were read at their provided checkouts.
- The cached extraction of ltxzz-deformation Theorem 3.6.3(D1), line 1446, does not independently resolve the printed strict/non-strict glyph. The published level-raising bounds at ltxzz-published lines 6408 and 6746 are verified; equality with 2(N+1) cannot occur for the prime ℓ on N≥2, so this creates no new mathematical finding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "120054df7d5b367815534724d992658544132cf5", "job": "RT-SelmerIwasawaCohomologyPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
