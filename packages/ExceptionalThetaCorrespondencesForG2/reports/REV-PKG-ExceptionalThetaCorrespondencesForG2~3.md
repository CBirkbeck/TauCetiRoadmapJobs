<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6399785394 -->
Review (codex) of 3f76749

Verdict: accepted
Conditional on the announced gaps: `quasisplit-whittaker`, `wavefront-all-residue`, `steinberg-unipotent`, `rank-one-plancherel`, `isotypic-parabolic`, `isotypic-compact`, `schwartz-ext`, `ramified-spin-factor`, `regular-real-unitarity`, `schematic-centralizers`, `bg-spin-integral`

1. **F01** (P3) Complete the global Albert construction's API and Checks

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:1565–1575, §10.1: “construct the Albert algebra J₃(O) and its Koecher–Tits adjoint group E(O)”.

   **Claim:** This is a construction target, including descent, embeddings and local comparisons. It must retain an explicit API and at least three discriminating Checks.

   **Witness:** Between the §10.1 heading at line 1563 and §10.2 at line 1577 there are zero API bullets and one Check. That Check compares ranks 3 and 7 only.

   **Exact repair:** Add an API stating transport under a specified k-octonion isomorphism, compatibility with scalar extension/localization, and the commuting Aut(O) and PGSp₆ embeddings with their split and definite comparisons. Retain the rank Check. Add these two independent Checks: (a) in a diagonal Albert frame, the cubic norm of (1,2,3) is 6, that of the unit is 1, and the dimension is 3+3·8=27; (b) at a split completion, the long-root element diag(2,1/2,1) fixes the diagonal scalar entries and sends an off-diagonal octonion u₁+v₁ to 2u₁+v₁/2, preserving its norm −1. The second Check excludes a trivial action on the octonion entries; the first distinguishes the Albert carrier from the 15-dimensional quaternionic Jordan carrier. State these on the imported algebra models, without re-planning their Jordan identities.

   **Repair tested:** 1·2·3=6, 1·1·1=1, 3+3·8=27≠15; the Zorn norms before and after are −1·1=−1 and −2·(1/2)=−1, while the two octonions differ. The existing rank values remain 3 and 7. This is a presentation/completeness defect, not a counterexample to the construction.

One P3 finding; no P1 or P2 findings. Acceptance is conditional on the eleven declared supplier contracts listed below. This is a review of the package README, Suggested.lean, metadata and source manifest; the package statements were not edited.

## Verified sound

### Previous findings and the changed passages

All three findings of the round-2 review are repaired. The repair report marks none of them not actionable, and no settled finding is re-raised.

| Previous finding | Repaired passage in the package | Independent verification | Status |
|---|---|---|---|
| F01, shifted δ formulas lacked supercuspidality | README:1353: “For τ unitary, selfdual and supercuspidal with ωτ=1, θH(δQ(τ))=δ₂(τ) and θH(δP(τ))=δ₁₃(τ).” | GS Theorem 15.3, p.53, GS line 2044. For St_GL₂, the shifted Q socle has two constituents, GS line 359; the new negative Check at README:1362 excludes it. The unshifted formula still admits unitary discrete-series data. | Repaired |
| F02, incompatible WD normalizations were identified | README:273: “Define the LP-normalized WD conversion from representatives φ:W_F×SL₂(C)→Ĝ(C) of complex parameters to pairs (r_LP,N)”. | At q=3, N=E₁₂, the original Fr action is N/3; the new action is 3N. LP geometric degree is −1 on this Fr and its law gives 3N. SR.5.2's raw law also gives 3N. Inertia and zero N remain unchanged. | Repaired |
| F03, abstract SO₃ did not determine the embedded subgroup | README:243: “On its standard three-dimensional module V fix a nondegenerate symmetric bilinear form b, and define the inclusion SO(V,b)→SL(V)→G₂ by determinant-one isometries followed by that fixed inclusion.”. | The specified long-root SL₃ inclusion gives seven-module restriction 1+3+3 and invariant dimension 1; principal Sym⁶ gives dimension 0 of invariants. The centralizer orders are respectively 6 and 1. GS §2.6, p.8, GS line 285, and §3.4, p.13, GS line 452. | Repaired |

The adversarial recheck includes the conventions, both parameter supplier contracts, §0.7's conversion API, §§0.6 and 0.8, Layer 0 Examples, §1.9's subregular labels, and the whole §8.4 table and its new Steinberg Check. Searches through the rest of the package found no surviving identity comparison of the two WD pairs, unspecified subregular SO₃, or shifted δ formula extended to all discrete-series GL₂ data. The parameter conversion changes the SL₂ twist, not the Weil homomorphism by elementwise inversion: the latter fails on nonabelian images.

### Coverage and principles

Read all 96 numbered targets, their API and Check blocks, all 96 `*Needs:*` lines, eleven layer Examples/Dependencies blocks, the conventions, supplier contracts and references. The round-2 table contains computed rows covering 60 distinct targets. It was used only for unchanged passages with numerical/structural values. The remaining 36 targets were reviewed in full: §§1.2–1.4, 1.6–1.7, 1.11–1.13; 3.1–3.2, 3.4–3.10; 4.2, 4.4, 4.6, 4.8–4.9; 5.4–5.5, 5.8; 6.3–6.6; 7.2–7.3, 7.5, 7.7; 8.1–8.2; 9.2. Repaired and sampled passages were recomputed even where the earlier table had values. A 96-target working ledger was retained; the table below presents the sampled targets, headlines, repair controls and the finding, within the comment-size limit. Finite probes test signs, scope and consistency; they do not replace the cited general theorems.

The local field hypotheses exclude q=1, equal-characteristic fields and characteristic-p coefficient fields; residue characteristics 2 and 3 remain included. Only §5.2's separately stated universal division nonvanishing has p≠3. The division correspondence and dichotomy themselves retain all residue characteristics. Nonzero orbit strata exclude zero where required; étale cubic algebras are not confused with cubic fields; nilpotent thickenings are retained in the represented group comparison. Positive exponent arguments do not extend to exponent zero. A zero kernel vector is not asserted to give global nonvanishing.

No route-specific replacement for the exceptional theory, algorithmic target, copied source passage, upward supplier, new version of an existing roadmap, or sorry'd data was found. The specific exceptional groups, rational forms, orbit models and theta comparisons have distinct ownership. Generic induction, oscillator, local-factor, real-unitary and automorphic analytic inputs are imported or declared gaps. Full G₂ LLC remains downstream; the restricted labels in §1.9 do not assume it. The package has the required heading/layer shape, exact needs, theorem locators and definition Checks apart from R01. Main ClassicalGroups and SpinRepresentations were read for the upstream shape. The metadata topic math.RT agrees with the scope.

### Seeded source sample

All fifteen sampled targets were checked against readable cached legal texts, including the theorem or section number, printed page, standing hypotheses and proof-level input where needed. The locators below identify the actual supporting passage, sometimes later than a broad line anchor in the README. No additional author-flagged unreadable claim was found beyond the three settled source statuses listed under Not verifiable.

| Sample | Source passage read | Scope and statement verified |
|---|---|---|
| §0.5 long-root SL₃ and unitary stabilizers | GS §2.5, p.8, GS line 274 through line 281 | Pointwise stabilizer of split quadratic algebra is SL₃; of a quadratic field, quasi-split SU₃; setwise stabilizers have the extra order-two action. Split octonions and characteristic zero retained. |
| §1.9 parameter labels | GS §3.4, pp.12–14, GS line 403 through line 503; especially line 452 | Noncuspidal assignments and the specified principal/subregular/cubic labels are distinguished from the conjectural full LLC discussion. The SO₃ embedding and central quotient conventions are now fixed. |
| §2.3 cubic triality and see-saw | GS §§4.3–4.4, p.16, GS line 560 through line 583 | Cubic étale twist, diagonal μ₂ kernel and exceptional pair. The source's warning about noninjective maps at line 570 is retained; rational points of a central quotient are not silently replaced by a quotient of rational points. |
| §3.7 PGSp₆–P₁ Jacquet filtration | GS §13.4 Case P₁ and Proposition 13.6, pp.44–45, GS line 1682 through line 1727 | Three pieces, top exponents 1/2 and 3/2, the middle determinant character and the two parabolic moduli. The Levi coordinate is its stated similitude coordinate. |
| §4.7 finite cubic period chain | GS Lemma 6.4, p.21, GS line 750 through line 766 | Tempered nongeneric hypotheses, finite endpoint and the duals on π and τ. The arrows are injections before equality of finite dimensions is deduced. |
| §4.8 preliminary nongeneric uniqueness | GS Propositions 6.6–6.7, p.22, GS line 786 through line 803 | This is the tempered nongeneric stage. Two distinct quotients give the contradictory doubled finite period; it is not used as general Howe duality before finiteness. |
| §5.1 division Howe duality | GS Proposition 7.1 and Theorem 7.2, p.23, GS line 829 through line 853 | Compact division partner, exceptional minimal module, finite-length/irreducibility/injectivity assertions and τ=1 entry. The universal nonvanishing claim has its separate §5.2 hypothesis. |
| §5.8 split-E₆ lift table | GS Theorem 8.2, pp.25–26, GS line 907 through line 936; Theorem 8.5, pp.27–29, GS line 1017 through line 1026 | Sign extensions, Steinberg signs, parameter containing 1, supercuspidal cases and nonzero/zero signs. The package's generic tempered assertion is not promoted to all nongeneric inputs. |
| §6.6 two E₇ Whittaker fibers | GS Proposition 11.1 and Corollary 11.2, p.34, GS line 1258 through line 1267; Proposition 11.5, p.37, GS line 1374; HKT Theorem A.7, p.26, HKT line 1096 | The two unipotent sides and their induced models are distinguished; generic π has a nonzero H lift and nongeneric π cannot pair with generic H. HKT's proof starts at line 1101 and computes the two successive coinvariants. |
| §7.6 one-dimensional generic period chain | GS Lemma 12.1, pp.38–39, GS line 1422 through line 1444 | Finite one-dimensional Whittaker endpoints, contragredients and enhanced period at s=−1/2; no inference of nonzero dimension from two zero endpoints. |
| §9.1 quaternion pointwise stabilizers | LL §10.1, p.27, LL line 1126; Lemma 10.4, p.28, LL line 1162 | Pointwise stabilizer is SL₁(D), including real SU₂; setwise stabilizer and Aut(D) are different groups. |
| §9.2 Siegel orbits and coefficients | LL §10.1, p.27, LL line 1129 through line 1142; GrS Chapter 5 §3 Lemma 3.4, pp.197–198, GrS line 5927 and line 6032 | Full-rank ternary characters, quaternion labels and compactly induced SL₁(D) coefficient model. The Levi orbit stabilizer Aut(D) is not substituted for the G₂ pointwise stabilizer. |
| §10.1 global Albert E₇ pair | LL §10.2, p.29, LL line 1198; HKT Appendix A.2, p.24, HKT line 993 through line 1010 | Albert realization and definite rank-three form; split rank seven is distinguished. The number-field descent/comparison is explicitly an owned target. R01 concerns the absent API and extra Checks. |
| §10.2 minimal residual representation | HS Theorem 6.4, p.198 and following, HS line 655 through line 675; local structure at HS line 345 and line 438; LL line 1198 | The rank-three, d=8 case satisfies the discriminant/dimension and real-form hypotheses. Positive poles are 1,5,9; the minimal and trivial parameters differ. Residual representations are generated by residues; the assertion is not a nonzero residue for every section. |
| §10.4 quaternion period implies global nonvanishing | GrS Chapter 5 §4 Proposition 4.5 and proof, p.200, GrS line 6324 through line 6351, with test-function argument at line 6379; LL Corollary 10.6 and proof, p.29, LL line 1201 | Totally real k, totally definite O and existence of a nonzero quaternion period. GrS supplies the rational case and unfolding; LL supports its number-field extension. Suitable kernel/test data are existential. |

### Computed adversarial evidence

In the following rows, a zero/nonzero or genericity indicator has values 0/1; lengths and dimensions are distinguished. Values compare both sides, the competing convention, or an excluded model. “Retain” means the package already states the needed restriction. Source-supported representation lengths are consistency tests against the tables, not assertions of a new computation algorithm.

| Target | Instances tried | Values computed on the sides/models | Result | Change |
|---|---|---|---|---|
| §0.1 | Identity, conjugation, dual numbers | 1↦1; conjugate(u₁u₂)=−v₃ versus conjugate(u₁)conjugate(u₂)=v₃; ε product coefficient v₃−v₃=0=D(v₃) | Consistent on these instances | Retain stated scope |
| §0.5 | Split quadratic algebra, quadratic field, diagonal SL₃ action | Pointwise dimensions 8,8; component quotient orders 2,2; u₁↦2u₁, v₁↦v₁/2 gives product factor 2/2=1 | Consistent on these instances | Retain stated scope |
| §0.6 | Specified SO₃, principal SO₃, degenerate form | 7=1+3+3 gives invariant dimension 1 versus Sym⁶ dimension 7 and invariants 0; centralizer orders 6 versus 1; b=0 would give dimension 8 instead of 3 | Consistent on these instances | Repair verified |
| §0.7 | q=2,3; N=E₁₂; inertia; N=0 | Arithmetic/conversion Fr factors 1/2 versus 2 and 1/3 versus 3; converted inverse-Fr 1/2,1/3; inertia 1; zero monodromy 0=0; S₃ inversion gives (23) versus (13) | Consistent on these instances | Repair verified |
| §0.8 | Principal SL₃, Spin₇; subregular G₂ | Raw centralizer orders 3,2,6; split quotient orders 1,1,6; subregular enhancement squares 1+4+1=6 | Consistent on these instances | Repair verified |
| §0.10 | s=(1,2,3), reflected s, (3,2,−1) | Reflection (6,−3,−2), square returns s; quadratic 50=50; source alternative 5≠195/4; chamber pairings 3,1,1 | Consistent on these instances | Retain stated scope |
| §1.5 | Q Steinberg and character at 1/2 | Socle lengths 2 and 1, total lengths both 3; incompatible with assigning one δQ to Steinberg | Consistent on these instances | Retain stated scope |
| §1.9 | Principal and specified subregular parameters | Centralizer orders 1,6; seven-module invariant dimensions 0,1; enhancement dimensions 1 versus 1,2,1 with squares summing 6 | Consistent on these instances | Repair verified |
| §2.3 | E=F³, cubic field, uniformizer square class | Triality twist trivial for F³; Res SL₂ dimension 9, PE× dimension 2, diagonal kernel order 2; v(ϖ)=1 odd versus v(a²)=2v(a) even | Consistent on these instances | Retain stated scope |
| §2.4 | Spherical minimal model and zero model | Hyperspecial fixed-space dimensions 1 versus 0; evaluation quotient nonzero versus zero; zero model excluded | Consistent on these instances | Retain stated scope |
| §2.5 | C₃ character χ of order 3 | Hom(χ,χ) dimension 1; Hom(χ,χ∨) dimension 0 because ζ≠ζ²; multiplicity module of π⊗τ is τ | Consistent on these instances | Retain stated scope |
| §3.4 | q=2, central z=ϖ in GL₂ | Sym³⊗det⁻¹ scalar z³z⁻²=z; two top twists 1/2 and 1/8; middle at (ϖ,1) gives √2 | Consistent on these instances | Retain stated scope |
| §3.5 | q=2, lower-Borel coordinates (ϖ,1),(1,ϖ) | Middle factors 1/√2 and 1/2; exchanged coordinates yield unequal values; scalar top factors 1/8,1/16 | Consistent on these instances | Retain stated scope |
| §3.6 | q=2, det=ϖ | Top extra factors 1 on E₆ and 1/2 on trivial term; three layers, ranks 0,1,2 | Consistent on these instances | Retain stated scope |
| §3.7 | q=2; Q₁(ϖ,I₂), Q₂(I₂,ϖ) | Similitudes 1 and ϖ; moduli 16 and 1/8; middle character √2 versus 1/√2 when switched; top at ν=ϖ gives 1/√2,1/(2√2) | Consistent on these instances | Retain stated scope |
| §3.8 | (α,β)=(2I,2⁻¹I); residue uniformizer test | Determinant product 4·1/4=1; four pieces versus three in P₁/P₃; GL₂ right multiplication moves a chosen compact-open coset indicator from 1 to 0 | Consistent on these instances | Retain stated scope |
| §3.11 | Steinberg pair and positive-exponent standard quotient | Tempered indicators (1,1) and (0,0); mixed (1,0),(0,1) violate the corresponding support implication | Consistent on these instances | Retain stated scope |
| §4.7 | Finite cubic multiplicity d=1 and dual character control | Endpoint dimensions 1,1 force intermediate 1; two quotients require 2>1; order-three dual mismatch gives Hom dimension 0 instead of 1 | Consistent on these instances | Retain stated scope |
| §4.8 | Two independent tempered nongeneric quotients | Selected coefficient d=1 forces 1≥1+1=2, contradiction; one quotient contributes exactly 1 | Consistent on these instances | Retain stated scope |
| §5.1 | τ=1 and nontrivial τ | ΘD(1)=πdeg[1], length 1 and generic dimension 0; nontrivial nonzero lift has two maximal Jacquet modules (0,0) | Consistent on these instances | Retain stated scope |
| §5.2 | p=2,3 and q=2,m=1 | gcd(3,2)=1, gcd(3,3)=3; torus multiplicity q^m=2; universal theorem admits first prime and excludes second | Consistent on these instances | Retain stated scope |
| §5.8 | St_PGL₃ plus/minus; selfdual parameter containing 1 | Outputs πgen[1],πsc[1], generic dimensions 1,0; contains-1 signs have nonzero indicators 1,0 | Consistent on these instances | Retain stated scope |
| §5.9 | St extensions and nonselfdual orbit | Two distinct St signs give two different length-one outputs; nonselfdual orbit of size 2 gives one induced H₃ irreducible; allowed zero lift length 0 | Consistent on these instances | Retain stated scope |
| §6.6 | Trivial and generic G₂ inputs | Trivial Whittaker coefficient 0; generic Whittaker dimension 1, so H big lift nonzero; nongeneric/generic pair Hom dimension 0 | Consistent on these instances | Retain stated scope |
| §6.7 | Simultaneous division/H lift with d=1 | Cubic exact sequence forces 1=1+1=2, impossible; allowed domain indicators sum 1 | Consistent on these instances | Retain stated scope |
| §7.1 | Heisenberg quotient and covered central element | U/Z(U) dimension 3, center 1; U/[U,U] dimension 2, abelian; tensor central signs −1·−1=1 | Consistent on these instances | Retain stated scope |
| §7.6 | Generic endpoints; two quotients | Endpoint dimensions 1,1 imply all intermediate dimensions 1; two independent Whittaker lines require 2; zero endpoints give no nonzero uniqueness information | Consistent on these instances | Retain stated scope |
| §7.8 | Nonzero and zero tempered small lifts | Cosocle lengths 1 and 0; multiplicities 1 and 0; finite length by itself would permit length 2 | Consistent on these instances | Retain stated scope |
| §8.1 | Positive Q/P inputs, exponent 1 and excluded 0 | Q⇒J₂ with (τ,τ), P⇒J₁₃ with (τ,1); positive indicators 1 and 0; each surviving cosocle length 1 | Consistent on these instances | Retain stated scope |
| §8.2 | Selfdual parameter containing 1 and selfdual GL₃ discrete series | Occurring E₆ sign count 1 versus 2; H Siegel lengths 1 versus 2; discrete-series hypothesis distinguishes the splitting rules | Consistent on these instances | Retain stated scope |
| §8.3 | Division branch, H₃ branch and H overlap | Division/H indicator sum 1; H₃-branch nonzero-lift triple (0,1,1) sums 2, consistent with three separate Howe theorems | Consistent on these instances | Retain stated scope |
| §8.4 | St_GL₂ versus selfdual determinant-trivial supercuspidal | Shifted Q socle lengths 2 versus 1; both have central character 1; repaired supercuspidality excludes first; St_G₂→St_H has DS indicators 1,1 | Consistent on these instances | Repair verified |
| §8.5 | πρ and inverse Fourier–Jacobi/classical lift | Recovered input count 1; two inequivalent ρ giving one π would give count 2 and violate imported injectivity; odd Weil contributes 0 admitted inputs | Consistent on these instances | Retain stated scope |
| §8.6 | σρ on split SO₃ and SO₅ | First occurrence 0 and nonzero; D₆ big lift length 1, generic dimension 0; proper Jacquet modules all 0 | Consistent on these instances | Retain stated scope |
| §8.7 | πρ versus supercuspidal outside listed images | πρ retains one D₆ top support; outside family maximal H Jacquet values (0,0,0); latter lift supercuspidal | Consistent on these instances | Retain stated scope |
| §8.8 | H₃ discrete-series branch | Nonzero indicators (H₃,H)=(1,1); discrete-output indicators (1,0); exactly one discrete branch | Consistent on these instances | Retain stated scope |
| §8.9 | q=2, sim=ϖ², det₅₆=ϖ⁵⁶; simple pole | Ambient twist 2⁻⁶=1/64, half-modulus 2⁻⁸=1/256; normalized exponent 3−4=−1; generic dimensions 0 versus 1; ord L=−1, ord γ=1 | Consistent on these instances | Retain stated scope |
| §9.1 | Split, division and real quaternion algebras | Pointwise groups SL₂,SL₁(D),SU₂ all dimension 3; setwise group dimension 6; parameter −1 acts 1 on D and −1 on D-perp | Consistent on these instances | Retain stated scope |
| §9.2 | Rank-0 and rank-3 ternary forms; real split/division Clifford forms | Ranks 0,3; over ℝ, <1,1,1> gives (−1,−1) division and <1,−1,−1> gives (1,1) split; stabilizer dimension 3 but SL₁ center order 2 versus Aut(D) center 1 | Consistent on these instances | Retain stated scope |
| §9.3 | Low Siegel ranks 0,1,2 against full 3 | All 0,1,2<3; odd-rank oscillator covered sign −1 fails ordinary Sp₆ sign +1; trivial rank-zero coefficient 1 does not decay | Consistent on these instances | Retain stated scope |
| §9.4 | Nonzero projective supercuspidal quotient | Splitting composition p∘i=id, with value v on nonzero v; zero map gives 0≠v | Consistent on these instances | Retain stated scope |
| §9.5 | Compact division stabilizer; split noncompact stabilizer | Normalized compact Haar volume 1 versus infinite total Haar volume; fixed-vector averaging v versus no global averaging; regular test integral vol(K)>0 | Consistent on these instances | Retain stated scope |
| §9.6 | SU₃ weight (3,2,0); seven-module | Interlacing (2,2) gives SU₂ weight 2−2=0; in 1+3+3∨ invariant dimension 1+1+1=3; trivial representation dimension 1 | Consistent on these instances | Retain stated scope |
| §10.1 | Split/definite forms; diagonal (1,2,3); local Zorn action | Ranks 7 and 3; dim J=3+3·8=27; cubic norm 1·2·3=6; g sends u₁+v₁ to 2u₁+v₁/2, norm −1=−1 | Construction consistent; API/Checks incomplete | R01 |
| §10.2 | r=3,d=8 and zero section | 1+j·8/2 gives 1,5,9; minimal parameter 5 versus trivial 9; zero-section residues 0 at all three | Consistent on these instances | Retain stated scope |
| §10.3 | Multiply either kernel/input by i; zero vector | Θ(if,φ)=iΘ, Θ(f,iφ)=−iΘ, Θ(0,φ)=Θ(f,0)=0 | Consistent on these instances | Retain stated scope |
| §10.4 | Nonzero period and local test factors normalized to 1 | Unfolded coefficient 1·1=1; zero period gives 0·1=0; existence of suitable data, not every vector | Consistent on these instances | Retain stated scope |
| §10.5 | Steinberg place or regular compact highest weight | Three maximal constant terms (0,0,0); zero highest weight pairings (0,0) fail regularity | Consistent on these instances | Retain stated scope |
| §10.6 | Unramified support and supercuspidal H component | Valuations constrained ≥0 and ≤0 give 0,0; normalized spherical factor 1; proper maximal Jacquet values (0,0,0) | Consistent on these instances | Retain stated scope |
| §10.7 | Zero highest weight and bound C | Harish–Chandra parameter ρ≠0 versus unshifted 0; C+1>C true, C>C false; no value for waived exceptional matching polynomial | Consistent on these instances | Retain stated scope |

The repaired WD adapter has further direct controls: at q=3 and h=diag(2,1/2), Ad(h)N=4N and the converted Frobenius gives 12N=3·4N. Transport of characteristic-zero coefficients fixes 1/3 and 3, whose difference is 8/3≠0, including when the auxiliary coefficient prime is 2; coefficient transport alone cannot repair the old normalization. At degree zero both twists are identity. The factors q, q¹ᐟ² and 2 used by these characteristic-zero constructions are nonzero. For the SO₃ definition, diag(−1,−1,1) preserves b=I₃ and has determinant 1, whereas diag(2,1/2,1) has determinant 1 but sends b to diag(4,1/4,1), so does not lie in that SO₃.

### Pinned library inspection and duplication by object

The pins read from lake-manifest.json are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are files and lines at those pins, not declarations remembered from another version. In this table, Mathlib paths are relative to the pinned Mathlib source root and TauCeti paths to the pinned Tau Ceti source root.

| Opened declaration and file | Actual content and boundary relevant to this package |
|---|---|
| `LinearEquiv`, Mathlib/Algebra/Module/Equiv/Defs.lean:49; `Submodule`, Mathlib/Algebra/Module/Submodule/Defs.lean:39 | Linear/additive equivalence and additive/scalar closure, respectively; neither imposes octonion multiplicativity or zero products. |
| `Submodule.map`, Mathlib/Algebra/Module/Submodule/Map.lean:52; `LinearMap.ker`, Mathlib/Algebra/Module/Submodule/Ker.lean:59; `Module.finrank`, Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | Native image/kernel and natural-number dimension. The finrank definition is Cardinal.toNat of rank and is not a finite-dimensionality hypothesis. |
| `Representation`, Mathlib/RepresentationTheory/Basic.lean:48; coinvariant relation and quotient, Mathlib/RepresentationTheory/Coinvariants.lean:53,57 | Algebraic monoid action and its quotient. No topology, admissibility or normalized Jacquet construction is included. |
| `TauCeti.Octonion`, TauCeti/Algebra/Octonion/Basic.lean:123; multiplication at :263–269; conjugation at :334; trace :345; norm :375; identities :410,416; imaginary :589; dimension :619 | Split Zorn algebra over commutative rings; trace kernel and dimension under strong rank. Conjugation reverses multiplication: top e₁·top e₂=bottom e₃. This does not represent the algebraic automorphism group. |
| `finrank_derivationLieAlgebra`, TauCeti/Algebra/Octonion/Derivation.lean:995; `isIrreducible_imaginaryLieSubmodule`, Fundamental.lean:317; `g₂ToDerivationLieAlgebra`, Serre.lean:267 | Lie dimension 14, imaginary Lie irreducibility with 2≠0, and a Lie homomorphism. Characteristic 2 puts the scalar unit in the trace kernel, an invariant line, so the hypothesis cannot disappear. No group-level comparison is supplied. |
| `SpinPolarizationData`, TauCeti/RepresentationTheory/Spin/Polarization/Basic.lean:82; `spinAction`, CliffordAction.lean:230; `spinRep`, TauCeti/RepresentationTheory/Spin/Representation.lean:56 | Algebraic exterior-algebra action for a supplied polarization over a commutative ring. It does not require algebraic closure; dim Λ(F³)=8 and the central scalar −1 acts by −1. |
| `AlbertAlgebra`, TauCeti/Algebra/AlbertAlgebra/Basic.lean:104; dimension :213; product :229 | Native split carrier of dimension 27 and symmetrized product with 2 invertible. Eᵢ∘Eᵢ=Eᵢ, Eᵢ∘Eⱼ=0 for i≠j. Rational-form descent and identified exceptional groups are not supplied by this carrier. |
| `E7Minuscule.groupScheme`, TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188; `E6Minuscule.groupScheme`, E6/Minuscule/GroupScheme.lean:109; `D4Tripled.groupScheme`, D4/Tripled/GroupScheme.lean:119 | Integral matrix-group closures in GL₅₆, GL₂₇ and GL₂₄. The package correctly does not treat their definitions as already proved reductive/adjoint/minimal-module identifications. |
| `D4Tripled.trialityAutomorphism`, TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142; `E6DoubledMinuscule.graphAutomorphism`, E6/DoubledMinuscule/GraphAutomorphism.lean:468; `G2ShortRoot.serreRepresentation`, G2/ShortRoot/Basic.lean:173 | Automorphisms of the specified matrix carriers and a seven-weight Lie action. These are not the normalized involution on an exceptional smooth minimal representation. |
| `IsSmoothDiscrete`, `SmoothDiscreteTopRep`, TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272,618 | Discrete topology and open point stabilizers; the category is a full subcategory of TopRep. The trivial action on ⊕ₙℂ satisfies these laws but has infinite-dimensional compact-open invariants. Thus admissibility is genuinely additional. |

Object searches in the pins included Weil/Weil–Deligne parameters, normalized Jacquet modules, minimal representations, exceptional theta, octonion automorphisms and Harish–Chandra modules. Existing algebraic Lie central-character material was not mistaken for exceptional real Harish–Chandra modules. No pinned carrier removed a missing headline obstruction. Native octonion, Albert, polarized spin and smooth-discrete objects are consumed rather than redeclared; Suggested.lean has no declaration name that can collide with another roadmap.

The board package index was read before the ownership search. The roadmap service's current main/open-head index was searched by object with `roadmaps grep`, and relevant suppliers were read with `roadmaps show`; `roadmaps list` and `roadmaps resolve` were also run. Searches covered the main roadmaps, supplied open-head collection, board packages and their design folders, including octonion/Albert constructions, triality, minimal modules, oscillator restrictions, Shalika periods, WD conventions, relative quaternion models, generic uniqueness, Schwartz Ext, isotypic induction and spin factors. Narrowed searches were rerun without truncation. The available index covered 363 open heads, dated 2026-10-25T15:10:46Z; no unspecified pull requests were independently discovered. The local content checkout and service main snapshot were treated as separate readable copies, and existing roadmap revisions were not substituted for their main versions.

LieHighestWeight owns generic algebra identities and compact forms; SpinRepresentations owns algebraic spin/triality; ReductiveGroups owns general represented-group machinery; SmoothRepresentations and MetaplecticAutomorphicForms own their general local categories and oscillator theory. This package owns their exceptional comparison and rational descent, not a second copy of those constructions. The downstream LocalLanglandsCorrespondenceForG2 design consumes the theta results; it is not their supplier. The broad Koecher search also found unrelated Koecher-principle targets, which are not the Koecher–Tits construction. No ownership transfer or change to merge order is required.

### Current supplier resolution and order

Every cross-roadmap citation family was resolved against main or the supplied open head again this round. The service reported no missing citations or backticked names. Its warning about discovering Lake packages on its own host was not used as evidence about these pins; the declarations above were opened directly. Locations below refer to the cited roadmap README; a path beginning RepresentationTheory is under TauCetiRoadmap/RepresentationTheory.

| Supplier and current location opened | Consumed contract and convention check |
|---|---|
| ReductiveGroups, main, Layer 3 at README:234, Layer 3A.1 at :264, Layer 9 at :1092 | Closed subgroup schemes, action stabilizers, components/quotients and pinned Chevalley groups. The centralizer extension is explicitly a gap. A μ₂ quotient has Lie dimension 0 for its kernel but rational square-class obstruction of order at least 2 in the uniformizer example. |
| ReductiveGroupsPartII, open head, RG2.5.1–RG2.5.2 at :6724,6931 | Dual root data/groups, Levi inclusions and L-groups. No exceptional rational-form comparison is presumed supplied. |
| RepresentationTheory/LieHighestWeight, main, Layer 8 at :1197 and positive octonion/compact Albert sublane at :1287 onward | Split Lie models, Jordan identities and compact real forms with complexifications. Number-field descent and exceptional group embeddings remain here. |
| RepresentationTheory/SpinRepresentations, main, Layers 4 and 8 at :665,969; ClassicalGroups, main, Layer 6 at :310 | Complex spin/half-spin/triality and integral-weight GLₙ branching. Interlacing (3,2,0) with (2,2) gives SU₂ weight 0. Local algebraic spin uses the native polarized module instead. |
| RepresentationTheory/LieGroups, main, Layers 2 and 7 at :275,407; CompactGroups, main, Layers 3–5 at :271,295,318 | Closed real subgroup and complexification theory; matrix coefficients, Schur orthogonality and Peter–Weyl. Compact real SU₂ permits averaging of volume 1; a noncompact split group does not. |
| ClassFieldTheory, main, Layer 9 at :1505; LanglandsParameterStacks, open head, LP0.4, LP0.5, LP1.11–LP1.12 at :169,182,367,388 | Weil carrier, arithmetic/geometric degree and the coefficient-stack WD convention. Arithmetic degree 1 becomes geometric degree −1; LP's law gives qN, agreeing with r_LP, not r. |
| SmoothRepresentationsOfLocalGroups, open head, SR.0.2, SR.0.4; SR.2.1–SR.2.3; SR.2a.1; SR.3.1–SR.3.4; SR.5.1–SR.5.2 | Smooth/admissible categories, induction, Jacquet, adjunctions, Bernstein, tempered support, Langlands and twisted coinvariants. Concrete checks include :1833,1962,2122,2955,2487,2603,2768,2850,3609,4355. The regular-isotypic target at :2916 gives left/right action χ(a)/χ(b). Raw WD at :4355 uses the opposite scaling, handled by the new adapter. The GL₂ Whittaker assertion at :2187 does not supply general quasi-split uniqueness. |
| SmoothRepresentationsOfLocalGroupsPartII, packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md, SRU.0–SRU.4 | Commuting-action extensions, unitary topology/isolation, local character/tempered theory, Steinberg extensions; seven additional contracts below. Its existence was checked in the board index/design, not inferred from the service's published-roadmap view. |
| MetaplecticAutomorphicForms, open head, §§0.15–0.17, 1.1, 2.4a–2.7, 3.4–3.8, 3.34, 3.37–3.40 | Schrödinger/Weil models, theta and the specifically consumed low-rank extensions. At :1056–1100, even/odd constituents, GL₂–GSO₄, restricted Mp₂×G₂ injectivity, orthogonal n=5,6 and division ternary lifts are present. Tensor central factors multiply to 1; the adjoint theta convention retains the contragredient. |
| EndoscopicTransferAndUnitaryTraceComparison, open head, §§4.7a, 10.30–10.31 at :1772,4068,4084 | Essentially square-integrable JL, classical GL parameters and inner forms. The real compact branching argument does not use this p-adic generic restriction theory. |
| ModularityAndLanglandsExtensions, open head, §3.5 at :1944 | GSp₄ Plancherel comparison, including nongeneric data in its stated scope. The common divisor determines reducibility for the nongeneric Saito–Kurokawa input. |
| AutomorphicLFunctionsAndLocalFactors, open head, normalized-rs-period at :2300 and AL.4 at :2758 | Adjacent-rank generic period and unramified factors with specified Frobenius/normalization. Ramified exceptional spin theory is not claimed here. |
| AutomorphicLFunctionsAndLocalFactorsPartII, packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/README.md, D.6 at :1157 | The two exceptional spin extensions below are declared gaps beyond this supplier's existing local-factor contracts. |
| AutomorphicFormsOnReductiveGroups, open head, §§2.1–2.7, 3.1–3.5, 4.1–4.2, 5.4; ALS.F.6 contract at :67 | Real/adelic modules, cusp forms, rapid decay and measures. The regular-real-unitarity extension is declared separately. The theta integral is linear in its kernel and conjugate-linear in its cusp input. |
| AutomorphicSpectralTheory, open head, §§1.1–1.2, 2.4–2.6 at :1600,1638,1649, and 4.4 at :2363 | Induced families, meromorphic Eisenstein continuation, residues and square-integrability criteria. Exceptional pole positions and minimal identifications are constructed here. |

The supplied order check was run with this README, its roadmap name, ORDER.txt and `--movable`. It exited 0 with this complete output:

    depcheck: 52 roadmaps, 594 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The 96 internal Needs lists were also read: layer-level summaries do not conceal a later exceptional result used to prove itself. Preliminary uniqueness, finiteness and general Howe duality remain distinct stages.

### Declared gaps

All eleven slugs occur both in design/plan.json's top-level gaps and in the package's Exact supplier contracts, with matching needs and named suppliers. No supplier is none. The requests are precise mathematical interfaces, with the relevant characteristic-zero, irreducibility, admissibility, finite-dimensionality, coefficient and normalization conditions. Connected consequences of one interface, such as a factor's functional equation and its normalized spherical value, are not unrelated bundled requests. Object searches and the current contracts above found no existing full-strength owner result duplicating a request.

| Slug | Supplier and minimal missing extension |
|---|---|
| quasisplit-whittaker | SmoothRepresentationsOfLocalGroupsPartII SRU.3: quasi-split multiplicity one for every Whittaker datum, beyond the base GL₂ assertion. |
| wavefront-all-residue | Same supplier SRU.3: maximal rational-orbit generalized Whittaker dimension equals normalized character coefficient, including residue 2. |
| steinberg-unipotent | Same supplier SRU.4: regular-module restriction to U and the consequent nonzero twisted quotients for closed subgroups. The base Steinberg definition does not give this restriction. |
| rank-one-plancherel | Same supplier SRU.3: nonzero-real-exponent reducibility criterion with fixed meromorphic scalar. |
| isotypic-parabolic | Same supplier SRU.0: normalized induction commutes with the specified maximal admissible isotypic quotient. |
| isotypic-compact | Same supplier SRU.0: corresponding compact-induction interface with Ext¹(τ,τ)=0, including the indicated PGL₂ instance. The regular representation theorem alone does not assert it. |
| schwartz-ext | Same supplier SRU.2: smooth/Schwartz Ext¹ comparison and discrete-series projectivity in the Schwartz category for compact center. Generic Plancherel/Schwartz spaces do not imply this. |
| ramified-spin-factor | AutomorphicLFunctionsAndLocalFactorsPartII D.6: exceptional F₄ Shahidi spin factor and supercuspidal pole/reducibility comparison in the explicit unnormalized convention. |
| bg-spin-integral | Same supplier D.6: normalized Bump–Ginzburg–Vo integral and meromorphic functional equation, including divisors with multiplicities and nonzero test sections. |
| regular-real-unitarity | AutomorphicFormsOnReductiveGroups §§2.4, 5.4: a group/system-dependent uniform bound for the two split real groups, not a bound chosen for each module. |
| schematic-centralizers | ReductiveGroups Layer 3 and Layer 3A.1: represented centralizer with its test-algebra and scalar-extension laws. General action stabilizers are already supplied and are not requested again. |

These are contracts, not unowned prerequisites. The all-residue wavefront statement remains conditional on its supplier even though Var's source status is settled uncertified. None was treated as proved by a citation alone.

### Headline acceptance test and Lean

The README's headline families and their disposition in Suggested.lean are:

| README headline | Suggested.lean docstring and missing carrier |
|---|---|
| §0.1 represented octonion automorphisms and Chevalley comparison | Lines 9–10: represented group and identified group-level comparison. A Lie map is insufficient. |
| §2.4 minimal representations and §§3.4–3.8 five Jacquet filtrations | Lines 11–19: identified exceptional forms, minimal modules, admissibility and normalized Jacquet/induction structures. Native matrix closures do not supply them. |
| §3.11 tempered preservation; §5.1 division Howe; §5.2 universal division nonvanishing; §5.9 split-E₆ Howe; §6.7 dichotomy; §7.8 tempered E₇ Howe; §8.3 general Howe | Lines 20–23: actual exceptional theta modules and their local categories. The p≠3 qualification for universal nonvanishing is retained. |
| §§5.8, 8.1–8.2, 8.4–8.7 explicit lift tables and §8.8 discrete-series trichotomy | Lines 20–23: same local modules, induction and discrete-series/tempered structures. |
| §8.9 spin-pole/Shalika/theta equivalence | Lines 18–19 and 24–25: identified E₈/F₄ pair/minimal module and ramified Shahidi spin factor. |
| §§9.3–9.6 quaternion quotient/embedding, relative Steinberg summand and compact-real periods | Lines 26–28: actual octonion group actions, smooth/unitary relative models. |
| §§10.2–10.6 minimal residue, global period nonvanishing and both strands of cuspidality | Lines 29–32: exceptional adelic kernel, Eisenstein and residual-representation carriers. |
| §10.7 real infinitesimal-character matching | Lines 33–34: exceptional real Harish–Chandra modules and central-character comparison. |

No listed headline can be stated at the pins by adding only a few simple definitions on the native carriers inspected above. Encoding the missing constructions as free predicates or arbitrary representations would be a stand-in. The short file is therefore appropriate: one import Mathlib, one module docstring, the specified namespace, and zero declarations. There is no sorry'd data, no set_option, no padding theorem, no missing declaration claimed by a backticked owned name, and no collision with a supplier's fully qualified name.

The prescribed `lake env lean` elaboration of packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean from the content checkout exited 0 with empty stdout/stderr: no warnings, including no sorry warnings because there are no declarations. No TauCeti import needed a build. Mechanical declaration enumeration gives zero `#check @name` targets and zero sorried theorems for the one-tactic probe; neither test was replaced by an invented placeholder. There are no implicit binders that could have been lost. The docstring's missing-carrier claims were checked at the pins as above.

## Not verifiable

- GS05 is settled waived. Its minimal-representation locators are retained, but the original text was not independently read in this round. It was not requested again.
- HPS is settled waived. In particular, the exact exceptional real infinitesimal-character matching underlying §10.7 cannot be certified from that original text here. The λ+ρ convention and the stated supplier boundary were checked; the inaccessible polynomial comparison was not invented.
- Var is settled uncertified. The residual-characteristic-2 theorem cannot be checked from the original text here; the all-residue statement is the explicit wavefront-all-residue supplier contract, not an inference from an inaccessible passage.

All fifteen seeded targets had readable supporting texts. Some cached HS/GrS formula fonts are damaged, but the theorem hypotheses, pole list, orbit/stabilizer and period passages used above were readable; no claim is made to have reconstructed every damaged display. No new source was needed, no source-manifest entry was changed, and no missing-text request was opened. Ownership against the supplied indexed open heads was checked; no claim is made about unindexed work.

## Source issues

- **Error** in GS at §2.1, p.6, GS line 227: the source says every norm-nonzero octonion generates the separable quadratic algebra of its characteristic polynomial; it should require nonscalarity and nonzero discriminant for that conclusion; affects a stated result.
- **Misprint** in GS at §2.6, p.8, GS line 288: the source says the second commuting SL₂ factor has label r; it should have short-root label s; affects nothing.
- **Misprint** in GS at Proposition 3.1(i), p.9, GS line 303: the source says the trivial-central-character reducibility exponent is only positive one-half; it should include both signs, exchanged by contragredience; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), p.9, GS line 332: the source says the character quotients have Q-exponent one-half and uses Steinberg inducing data in the cubic character case; it should use Q-exponent one and character inducing data; affects a stated result.
- **Misprint** in GS at Proposition 3.2(iii), p.11, GS line 376: the source says the quadratic-character quotient has Q-exponent one-half; it should have exponent one, as the short-root Weyl calculation requires; affects a stated result.
- **Misprint** in GS at §3.4(4), p.14, GS line 495: the source says the centralizer of the long-root SL₂ is long-root; it should say short-root, consistent with its subscript; affects nothing.
- **Misprint** in GS at Theorem 7.2, p.23, GS line 844: the source says the third assertion has label ii; it should have label iii, as its proof subsequently uses; affects nothing.
- **Error** in GS at §8.1, p.24, GS line 888: the source says its listed principal-series quotients exhaust nongeneric selfdual PGL₃ representations; it should also include the trivial representation, separately used in Theorem 8.2(ii); affects nothing.
- **Gap** in GS at the proof of Proposition 8.4, p.27: the source says generic GL₂ quotients of the GL₃ restriction are available without supplying the restriction argument; it should supply the adjacent-rank generic restriction input, available in Pra Theorem 3; affects the proof.
- **Error** in GS at §9, p.30, GS line 1127: the source says the displayed quadratic expression is invariant and its hyperplane list is complete; it should use Σsᵢ²+(Σsᵢ)² and include the hyperplanes sᵢ+Σsⱼ=0; affects nothing.
- **Misprint** in GS at §§10.1–10.2, pp.31–32, GS line 1174 and line 1201: the source says the parameterized inductions have ambient group G₂; it should say PGSp₆, as the parabolics and unparameterized definitions do; affects nothing.
- **Misprint** in GS at §11.2, p.34, GS line 1272: the source says the oscillator center comes from U/[U,U]; it should use the one-dimensional center of U/Z(U), the three-dimensional Heisenberg quotient; affects nothing.
- **Misprint** in GS at the proof of Lemma 11.3, p.36, GS line 1335: the source says V′ uses Uβ and the Heisenberg quotient has numerator V; it should use U−β and numerator V′, consistent with the root exchange; affects the proof.
- **Misprint** in GS at Proposition 13.7's explanatory note, p.47, GS line 1785: the source says the two displayed factors belong to M₃; it should say M₂; affects nothing.
- **Misprint** in GS at the proof of Lemma 13.8, p.47, GS line 1818: the source says the lower Borel in filtration piece three is in the first GL₂ and takes its Jacquet module; it should use the second factor, as Proposition 13.7 specifies, with consistently reordered tensor factors; affects the proof.
- **Misprint** in GS at the proof of Lemma 13.8, p.48, GS line 1848: the source says the quotient tensor factor is J_P(τ₁); it should be J_P(τ₂), the quotient defined and used immediately afterward; affects the proof.
- **Misprint** in GS at §15.1, p.52, GS line 2016: the source says Theorem 15.1(v) supplies irreducibility and temperedness; it should cite parts ii and iv; affects nothing.
- **Misprint** in GS at §15.1, p.54, GS line 2071: the source says the theta lift indexed by ρ uses JL(τ); it should use JL(ρ); affects nothing.
- **Gap** in LL at the proof of Lemma 10.1, p.27, LL line 1137: the source says absence of full-rank Siegel coefficients forces rank exactly two; it should handle every rank below three, including zero and the metaplectic parity restriction; affects the proof.
- **Misprint** in Sav at the proof of Corollary 5.2, p.399, Sav line 266: the source says both the Steinberg and trivial Levi descriptions use the U₁ quotient; it should use U₂ and its Levi for the second description; affects the proof.

These are source defects, not additional package findings: the package already distinguishes or corrects their mathematical content. For the norm-nonzero example, x=1+u₁ has norm 1, trace 2 and (x−1)²=0 with x−1≠0; F[x] is a dual-number algebra. For the source quadratic form, (1,2,3) and its reflected (6,−3,−2) give 5 and 195/4, whereas the package's form gives 50 and 50.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3f7674945bc61448525795bd925676cadcb30dab", "job": "REV-PKG-ExceptionalThetaCorrespondencesForG2~3", "model": "gpt-6-astra", "worker": "chris-31"} -->
