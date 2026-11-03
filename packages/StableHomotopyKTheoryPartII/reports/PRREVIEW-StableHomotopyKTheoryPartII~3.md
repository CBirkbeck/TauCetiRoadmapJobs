# Review of StableHomotopyKTheoryPartII (pull request #1733 at 75fb67a)

**Verdict:** needs changes

## R01 (P2) — Narrow the Witt gap in the intake record

**Location:** `packages/StableHomotopyKTheoryPartII/design/plan.json:2934`, “free of rank d over Z_p”, versus `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:111` and `:121`.

**Claim:** The plan still requests the ordinary Witt rank theorem from RefinedTraceMethods, although the README imports it from PadicHodgeRegulators. The declared gap is therefore not minimal and assigns an existing result to a second supplier. This is the outstanding finding from the previous review.

**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:346` supplies W(k) as the integers of the unramified degree-d extension, free of rank d. The plan at line 2934 requests that same rank from RefinedTraceMethods.

**Exact repair:** Replace this gap's `needs` with the narrowed contract already at README line 111: for every prime p and finite field k/𝔽_p of degree d≥1, W(k) is finite étale over ℤ_p, and reduction bijects its ℤ_p-algebra endomorphisms with the 𝔽_p-algebra endomorphisms of k, carrying Witt Frobenius to pth power. Retain the slug, supplier and section. Continue importing ordinary rank and identification from PadicHodgeRegulators and W(𝔽_p)≃ℤ_p from Mathlib. In particular, do not identify W(k) itself with W(𝔽_p) when d>1.

**Repair test:** For k=𝔽₂,𝔽₃ the imported rank is 1 and both endomorphism sets have one element. For k=𝔽₄ the imported rank is 2 and both endomorphism sets have two elements, reducing to a↦a and a↦a+1. Removing the repeated rank obligation loses no input to §4.8.

## R02 (P3) — Remove obsolete descriptions of the sphere supplier

**Location:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:107`, “that §2.3 records beside the fixpoint lemma” and “that §§2.3 and 2.6 record”.

**Claim:** These clauses describe sphere consequences as present in RefinedTraceMethods. They are absent from those sections at the supplied open head. The sentence correctly makes them local outputs, so this is stale citation wording, not an unowned prerequisite or a cycle.

**Witness:** `TauCetiRoadmap/RefinedTraceMethods/README.md:7` assigns sphere Segal to StableHomotopyKTheoryPartII §2.7. Its §2.3 at line 557 and §2.6 at line 646 do not state the two cited sphere consequences.

**Exact repair:** Delete the assertions that RefinedTraceMethods records these consequences. Say directly that sphere Segal is proved in §2.7 here and the residual sphere counterexample is derived in the Layer 7 Examples. Keep the imported boundedness, fixpoint and p-completion statements.

**Repair test:** The local §2.7 gives π₀S^(tC_p)=ℤ_p. Applying the local Layer 7 norm argument gives the residual sphere Tate value ℤ_p again. Neither computation needs a sphere equivalence imported from RefinedTraceMethods; its boundedness inputs retain their existing locations.

## Previous findings

The previous review had one finding, R01. **Not repaired since that review.** It requested synchronization of the plan with the narrowed README. The plan still contains “free of rank d over Z_p”; the README already says “Use the ordinary Witt/unramified identification and rank from PadicHodgeRegulators” (line 111). The two reviews have the same head, and the supplied change record contains no intervening changes. The earlier mathematical allocation was repaired; the remaining intake-record defect was not. No applicable repair report marks this remaining finding not actionable in this package.

## Verified sound

This is a fresh full review of both target files, rather than an incremental endorsement of the previous report. I read all 38 numbered targets, their APIs, Checks, proof routes and Needs lines; the supplier contracts and examples; and the entire declaration-free Lean file. The record below includes 15 freshly resolved seeded source targets, 14 headline groups, 11 named roadmap suppliers, 19 pinned declarations, and 46 adversarial rows. The mathematical conclusions are conditional on the two announced supplier contracts, not on those contracts already being implemented.

**Gate, dependency direction and elaboration.** The worker's gate at the specified head passed, including the targeted module build:

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independently run prescribed dependency check returned:

```text
depcheck: 204 roadmaps, 1644 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. I also read the individual Needs lines rather than treating this graph result as a mathematical ownership check. In particular, the Segal proof uses the independent spectral Tate diagonal and boundedness machinery, not the sphere Segal consequence. The sphere fixpoint counterexample is used only downstream. The internal route runs through finite-type Adams/Singer, uniform finite towers, arbitrary-dimensional Eilenberg–MacLane spectra and bounded-below dévissage before the power comparisons. The free-loop application uses its growing-connectivity theorem before commuting Tate with the limit.

Direct `lake env lean` elaboration of `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` exited 0 with no diagnostics. The worker separately reports the successful targeted `lake build TauCetiRoadmap.StableHomotopyKTheoryPartII.Suggested`. No additional Tau Ceti object file is required. The worktree was clean and the diff outside the assigned folder was empty. No PR file was edited.

**Seeded source checks.** All 15 requested targets were reread against the legal cached texts, including hypotheses and the actual proof where the roadmap extends an intermediate step. The README marks no additional locator unverified. The page conventions below distinguish printed pages from the explicitly cited BMMS scan and versioned preprint pages.

| Target | Source locator actually read | Verification and boundary |
|---|---|---|
| 1.1 Cyclic Tate coefficients and Weyl weights | ns18 line 5098, line 5111 and line 5120; discussion before IV.1.15, printed p.332 | The Laurent/exterior calculation and Weyl invariants support the statement with the factor-2 degree correction. β(bu⁻¹)=1 fixes the odd generator; normalizer pullback gives inverse weight on b. |
| 2.1 Continuous cohomology of a spectrum tower | lnr12 line 400, Definition 2.3, printed p.870; line 1269, Definition 4.7, pp.887–888 | Continuous cohomology is the colimit of stage cohomology. The comparison to cohomology of the limit is not generally an isomorphism. The Tate specialization retains individual boundedness and finite type. |
| 2.4 Singer Tor-equivalence | agm85 line 90, Theorem 1.1, p.436; line 236 and line 285, Lemmas 2.1–2.2, pp.439–441; lnr12 line 722, Proposition 3.3 and Theorem 3.4, pp.876–877 | Arbitrary graded M is allowed. The finite-sub-Hopf approximation and left/right freeness are real proof inputs. The stronger Ext formulations retain their boundedness/finite-type conditions on the second module. |
| 3.3 Arbitrary-dimensional HF_p case | ns18 line 3316 and line 3338, proof of III.1.7 following III.1.8, pp.289–290 | The same finite tower supplies indices uniform over all basis vectors. This proves arbitrary direct sums using pro-constancy, not an unrestricted sum/limit interchange. |
| 4.2 Underlying-space factorization | ns18 line 4920, Corollary IV.1.7, p.327 | It applies to every spectrum. Ω∞, the space diagonal, multiplication-free tensor comparison and restriction/can have the indicated directions. No bounded-below assumption is introduced here. |
| 4.3 Positive-degree norm splitting | ns18 line 4929, Corollary IV.1.8 and proof, p.327 | X must be bounded below and p-complete. The space section gives group homomorphisms on π_i for i≥1; its π₀ section is only a set section. The proof gives the asserted boundary. |
| 4.4 Degree-zero power | ns18 line 4955 and line 4961, IV.1.9–IV.1.10, p.328; bmms86 line 4322 and line 4365, VIII.1, scan pp.130–132 | General E∞ R and arbitrary space X are allowed. Multiplicativity, naturality and the mixed-summand transfer formula are compatible; additivity before the quotient is not claimed. |
| 4.6 Degree-zero Frobenius comparison | ns18 line 4966, IV.1.10, p.328 | Postcomposition is power followed by normalizer restriction and can, with Weyl fixed points retained. The Young-transfer correction in §4.5 makes the quotient formulation valid. |
| 4.7 Ordinary and finite p-complete examples | ns18 line 4843 and line 4852, IV.1.2(i)–(ii), pp.324–325 | Ordinary π₀ is reduction then pth power. The source's compactness wording is replaced by the finite/dualizable p-complete class; exactness, the sphere comparison and finite cofibers/retracts prove that version. |
| 5.1 Representation spheres and twisted cohomology | ns18 line 5251 and line 5256, discussion/proof of IV.1.19, pp.336–338 | Parametrized invertible spheres and the negative Thom object give all virtual ranks. Tensor inversion, not a global complementary bundle, supplies negative twists over arbitrary spaces. |
| 5.3 Rezk power operations in every degree | ns18 line 5189 and line 5194, equation (12), pp.333–334; line 5256, IV.1.19, pp.336–338 | The integer grading and actual permutation sphere are retained. These are operations on sets of classes, not additive maps with an untwisted target. |
| 5.5 Extended-power and Thom descriptions | ns18 line 5324, line 5338 and line 5370, IV.1.20 and its footnote, pp.338–339 | Iterated parametrized colimits give D_p(X^(−V))=(D_pX)^(−D_pV); pullback along the Borel diagonal gives the nρ twist, including inverse twists. |
| 6.2 Steenrod components | bmms86 line 4414, line 4481 and line 4501, VIII.2, Proposition 2.4(vi), scan pp.133–135; ns18 line 5155, IV.1.16, p.333 | The Euler expansion with χ=m!u^m and ω=m!bu^(m−1) gives the roadmap's signs after division by its leading coefficient. The unsigned NS expression fails the explicit odd-product and p=3 Euler tests below. |
| 7.3 KU Frobenius and stable Adams | ns18 line 4990, line 5002 and line 5040, equation (11), IV.1.12–IV.1.14, pp.329–331 | The target is KU_p^∧[1/p], Bott maps to pβ, and compact spaces mean finite-CW retracts. Localization is necessary for the inverse Bott class. |
| 7.4 Unbounded orbit counterexample | ns18 line 648, I.2.3(iii), pp.219–220; line 2214, II.4.1 and proof, pp.260–261 | The two cyclotomic coefficient factors for C_(p²) differ from the residual-fixed C_p term. The norm-square implication is used contrapositively; its bounded-below conclusion is not applied to KU. |

For the remaining headline routes I also read lnr12 line 265 (inverse-limit Adams proof), line 1468 (continuous Tate comparison/convergence), line 1935 (Singer approximation) and line 2040 (Singer comparison and finite-type Segal); ns18 line 3283 (unbounded obstruction), line 5397 (all-degree Frobenius), and line 5915 through line 6025 (free-loop application); kuhn04 line 596 through line 682 (§6, preprint pp.15–16); and malkiewich17 line 609 through line 676 (Proposition 2.22, preprint pp.14–15). Kuhn's finite input is not silently enlarged: the normalized-fiber connectivity argument supplies the generality used in §8.1. The cached 2019 NS correction was also read; it concerns the genuine-equivariant foundations and does not supply corrections for the normalization errors recorded below.

**Adversarial mathematics.** Each numbered target has its own row. Multiple values in a row test its definition, API, relevant boundary and plausible wrong model together. These computations were repeated in this review. “None” in the change column means no repair to the target is indicated by these tests, not that examples prove the theorem. Source/proof and ownership checks above and below supply the other evidence.

| Statement | Instances tried | Values computed on each side / excluded model | Result | Change |
|---|---|---|---|---|
| 1.1 Coefficients and weights | p=2,3,5; integral/mod-p; generator rescaling | At 2, HZ Tate has (π₀,π₁)=(𝔽₂,0), HF₂ has (𝔽₂,𝔽₂). At 3, deg(t²)=−4 and βe=1; replacing e by −e gives −1. At 5, a=2 gives weights t:2 and b:3. At 3, b′=2b gives t′²=t² and e′=e. | Pass | None |
| 1.2 Continuous homological Tate SS, duality and products | S,C₂,p=2; G=1 and C₃,p=2; a=2,p=5 | Sphere E² is 𝔽₂ on t=0 for every s, hence continuous H_n=𝔽₂ for all n; ordinary H_n(S₂^∧) is 0 for n≠0. Prime-to-p Tate gives 0 versus group H₀=𝔽₂. Weight 2 dualizes to 3; t·t⁻¹=1 and e²=0. | Pass | None |
| 2.1 Continuous cohomology | Constant tower; zero transitions; Singer sphere tower | Constant maps give H_c^*=H^* and identity comparison. Zero transitions give colimit 0, not a sum of stage groups. At p=2 the Singer tower has negative-degree classes while H^*(S₂^∧) has none there. | Pass | None |
| 2.2 Inverse-limit Adams | 0; constant HF_p; Singer sphere tower | Zero gives 0 pages/abutment. For HF_p, Ext_A(A,𝔽_p) is 𝔽_p at (0,0), 0 elsewhere, matching π_*HF_p. Sphere stage bottom degrees at 2 are 1,0,−1, so no common lower bound is available or required. | Pass | None |
| 2.3 Singer module/action/augmentation | M=0,𝔽₂,𝔽₃; exponent −1 | M=0 gives 0. ε(Σx⁻¹)=1 at 2; ε(Σxy⁻¹)=1 at odd p, both suspended degree 0. Sq¹x⁻¹=binom(−1,1)=1 mod 2; β(xy⁻¹)=1. The coefficientwise trivial action gives 0 and fails. | Pass | None |
| 2.4 Singer Tor-equivalence | M=0; unit coefficient module; shifts of a bounded test module | Zero gives Tor=0 on both sides. The degree-zero augmentation comparison sends 1 to 1 and identifies one-dimensional Hom into 𝔽_p; the zero augmentation gives 0. Shifting the test module down one shifts both graded comparison groups by −1, without changing the map. | Pass | None |
| 2.5 Singer approximation | B=S, n=0,1,2; p=2,3; suspension | Bottom degree 1−(p−1)n is (1,0,−1) at 2 and (1,−1,−3) at 3. U₀(ΣS) has bottom p+1, whereas ΣU₀(S) has bottom 2: suspension compatibility requires the stated cofinal reindexing, not equality at stage zero. | Pass | None |
| 2.6 Singer realization and unit | B=0,S; p=2,3 | Zero gives 0 on both sides. The continuous degree-zero generator maps to 1 through ε and the unit-normalized diagonal; negating that map gives 2 at p=3. Omitting the Singer suspension puts its unit generator in degree −1 instead of 0. | Pass | None |
| 2.7 Finite-type Segal | S,HF_p,Hℚ; p=2,3 | Sphere source completion and tensor-Tate target have π₀=ℤ_p. HF_p has a single 𝔽_p in degree 0 on both sides. Hℚ has p-completion 0 and Tate target 0. | Pass | None |
| 3.1 Finite towers/pro-isomorphism | Empty; two-point constant; {a,b}←{a}; binary-prefix tower; constant S₃ | Limit/stable image cardinalities are 0/0, 2/2 and 1/1. Binary-prefix limit has size 2^ℵ₀; evaluation at n identifies 0^∞ and 0ⁿ10^∞, so injectivity fails without finite limit. Constant S₃ has six elements and identity group maps, requiring no commutativity. | Pass | None |
| 3.2 Truncated tensor Tate | X=0,HF_p,HF_p⊕HF_p; n<0 | Zero stages are 0. For n<0, the connective tensor truncates to 0. For two summands the 2^p tensor words leave exactly 2 diagonal contributions; the 2^p−2 mixed words lie in free orbits and have Tate value 0. | Pass | None |
| 3.3 Arbitrary-dimensional HF_p | V=0,𝔽_p,𝔽_p²,⊕_κ𝔽_p with κ uncountable | Source and limit π₀ are respectively 0,𝔽_p,𝔽_p²,⊕_κ𝔽_p; all other groups vanish. The all-ones vector in ∏_κ𝔽_p is not in the last direct sum. The same base-tower index is used for every copy. | Pass | None |
| 3.4 Bounded-below Segal | Σ⁻¹HF_p; Hℚ; excluded KU at 2 | Both sides for Σ⁻¹HF_p have π₋₁=𝔽_p and other groups 0. Rational completion/target are 0. KU₂^∧/2 instead has 𝔽₂ in each even degree, whereas T₂(KU)/2=0; unbounded generalization fails. | Pass | None |
| 4.1 Weyl refinement | p=2,3; S and S[ℕ] | Weyl orders are 1 and 2, prime to p. Sphere unit maps to 1. On the monoid generator z both refined and underlying Frobenius give z^p; the unit-valued map gives 1 and fails. Forgetting W retains this same class. | Pass | None |
| 4.2 Underlying-space diagonal | X=HZ at 2; 0 | The pre-Tate lift of 2 is 2·unit+Nm(1): restriction gives 2+2=4, while can gives 2 in π₀T₂(HZ)=ℤ₂. The putative additive lift 2·unit restricts to 2; the scalar lift 4·unit has Tate value 4. Zero input gives the unique pointed map. | Pass | None |
| 4.3 Norm splitting | 0; HF₂,p=2, degree 0 | Zero gives 0=0⊕0. The HF₂ degree-zero extension has kernel and quotient 𝔽₂ but middle ℤ/4; twice a section of 1 is nonzero transfer. An additive split would give exponent-2 group 𝔽₂², contradicting this value. Positive-degree space-induced maps are group homomorphisms. | Pass | None |
| 4.4 Degree-zero power | KU,HZ,HF₄; p=2 | P₂(2) in KU is 3·1+sign: rank 4, transposition trace 2. Pullback of 4 has trace 4. In HZ, P₂(2)=4≠2=P₂(1)+P₂(1). In 𝔽₄, a²=a+1≠a. | Pass | None |
| 4.5 Young-transfer ideal | HZ,p=5; HF_p; zero ring | Young indices (5,10,10,5) generate (5); 2⁵−2=30 maps to 0 mod 5 but 30 mod 120. In HF_p every transfer degree is 0, so I=0. For the zero ring both quotient and operation are 0. | Pass | None |
| 4.6 Degree-zero Frobenius | HZ,p=2; H𝔽₃[z]; empty X | Both routes send 2 to 4 mod 2=0, and z to z³ rather than z. Empty X gives the zero cohomology ring and its unique map on both routes. | Pass | None |
| 4.7 Ordinary/finite examples | Hℤ₃,Hℚ,0,S_p^∧; p-inversion diagram | Ordinary 2 maps to 2³ mod 3=2; rational and zero targets give 0. Sphere Frobenius is unital identity, 1↦1. The p-complete colimit of repeated p on S_p^∧ is 0, but colim π₀Map(S_p^∧,S_p^∧)=ℚ_p≠0, excluding categorical compactness. | Pass | None |
| 4.8 Spherical Witt lift and uniqueness | k=𝔽₂,𝔽₃,𝔽₄; arithmetic versus inverse Frobenius on 𝔽₂₇ | Ranks are 1,1,2; prime-field Frobenius is identity. In 𝔽₄, a↦a+1↦a, detecting nonidentity and order 2. In 𝔽₂₇ with a³=a+1, arithmetic Frobenius gives a+1, then a+2, then a; inverse Frobenius gives a+2 initially. A fixed reduction marking removes the two unmarked 𝔽₄ automorphisms. | Mathematical pass; R01 allocation | Narrow plan obligation |
| 5.1 Virtual twists | rank 0,−1; Möbius line; ρ₂ | Rank 0 gives Σ∞_+X and R⁰(X). Rank −1 at a point gives π₁R, not π₋₁R. Möbius integral cochains have differential 2 and H¹=ℤ/2; the trivial line has differential 0 and H¹=ℤ. Swap degrees for ρ₂ and 2ρ₂ are −1,+1. | Pass | None |
| 5.2 Thom adjunction | n=0,−1; p=2; R=ΣHZ,Σ²HZ | At n=0 both sides are ordinary Borel R⁰. Restriction at n=−1 gives π₂R on both sides: 0 for ΣHZ and ℤ for Σ²HZ. Mistaken rank −1 would give ℤ and 0 respectively. | Pass | None |
| 5.3 All-degree power | n=1,0,−2; HF₂ and KU | For degree-one u, Thom power is ub+u², restricting to u²; both terms are nonzero. For n=0, P₂(2)=3+sign. For Bott in degree −2, restriction is β², a unit. For n=−1 the twist −ρ plus ρ has rank 0, not 2p. | Pass | None |
| 5.4 Tate suspension | HZ,S; p=2,n=1,−1 | Correct HZ twist gives 𝔽₂ in odd homotopy degrees and 0 in even degrees; trivial rank 2 gives the opposite parity. Reflection of S^ρ fixes Tate π₁=ℤ₂ with value +1, despite underlying degree −1. Opposite virtual twists cancel to shift 0. | Pass | None |
| 5.5 Extended-power Thom comparison | X=*, V=0,1,−1; zero input; p=2 | D_p(S)=Σ∞_+BΣ_p has π₀=ℤ; D_p(0)=0. Rank +1 gives negative Thom twist −ρ, dimension −2 and sign −1. Rank −1 gives +ρ, dimension 2. Forgetting monodromy changes the Möbius test ℤ/2 to ℤ. | Pass | None |
| 5.6 All-degree Frobenius equality | n=0,1,−1; p=2 | n=0 sends 2 in HZ to 0 by either route. n=1 sends u to u+u²s by either route, of degree 1 since 2−1=1. At n=−1 both routes retain −ρ and cancel +ρ to rank 0. | Pass | None |
| 6.1 EM decompositions | p=2,3; HZ versus HF_p; sum/product | At 3 the first positive even/odd shifts are 4,5, not 2,3. At 2, HZ Tate π₁=0 and HF₂ Tate π₁=𝔽₂. In each degree the sum and product have the same single 𝔽_p summand. Integral even-degree Ext between different displayed summands is 0; the same summand has Hom=𝔽_p. | Pass | None |
| 6.2 Power coefficients and Euler signs | u at 2; v and x,z at 3; scalar at 5,7 | u(u+b)/b=u+u²s. At 3, v(v+u)(v+2u)/(−u²)=v−v³t². Writing y=βx,w=βz, (x−ye)(z−we)=xz+(yz−xw)e, matching the degree-2 formula. Unsigned coefficients give the opposite odd term. (2!)²=−1 mod 5 and (3!)²=1 mod 7. | Pass | None |
| 6.3 Stable total Steenrod map | unit,u,x,xz; left suspension; HZ | Unit component is 1 and higher components 0. Sq¹u=u²≠0 although π₁HF₂=0. At 3, θ₀x=−y and θ₀(xz)=yz−xw. β(ι×x)=−ι×βx makes both suspension routes equal −ι×βx. Integral degree-zero component sends 1 to 1 by reduction. | Pass | None |
| 7.1 Atiyah cyclic power | virtual 0,1,2,−1; line L; p=2 | Values at 0,1 are 0,1. Rank-two power has rank 4 and trace 2. Power of −1 is sign, rank 1 and trace −1, rather than trivial trace +1. On a line the p-cycle value is L^p, agreeing with ψ^p. | Pass | None |
| 7.2 KU Tate coefficients | p=2,3; r=1,2; coordinate 0 | Even ℚ_p-dimensions are (1,3) at 2 and (2,8) at 3; odd groups are 0. For r=1, Weyl-invariant field is ℚ_p. Correct p-series at x=0 is 0; (x−1)^p−1 gives −2 for odd p. | Pass | None |
| 7.3 Stable Adams/Frobenius | β,β⁻¹; line over S²; p=2,3 | Images pβ and β⁻¹/p multiply to 1. With β²=0 in KU⁰(S²), (1+β)^p=1+pβ, giving 1+2β and 1+3β. Constant map would give β, and an integral target cannot supply β⁻¹/p. | Pass | None |
| 7.4 Unbounded orbit failure | KU with trivial C_(p²)-action; periodic rational control | Comparison source/target even dimensions are 3/1 at 2 and 8/2 at 3; odd groups 0/0. For Hℚ[β±¹], finite norms are invertible and both Tate terms are 0, so unboundedness alone does not imply failure. | Pass | None |
| 7.5 Unbounded tensor-Segal failure | KU swap tensor at 2; sphere control | KU₂^∧/2 has π₀=π₂=π₋₂=𝔽₂, while rational T₂(KU)/2 has these groups 0. Sphere T₂(S) has π₀=ℤ₂, so height-one raw rationality cannot be asserted for every spectrum. | Pass | None |
| 8.1 Free-loop totalization | Y=*,S²,∨_κS²; excluded S¹ | Point gives S→S identity. S² normalized bottom degrees are (n,n+2), hence (1,3),(2,4); wedges have the same bounds independently of κ. For S¹ the first degree is n−n=0 for every n, so it does not grow. | Pass | None |
| 8.2 Controlled orbit/Tate limit | Constant tower; comparison fibers ΣⁿHF_p; G=1 | Constant fibers 0 give identity comparisons. Orbit fibers of ΣⁿHF_p have π_i=0 for i<n, hence π₀=0 for n≥1 on the stabilization comparison. For G=1, both Tate sides are 0. | Pass | None |
| 8.3 Free-loop Segal and genuine comparison | Y=*; S² and arbitrary wedges; n=0,1,2 | Point Frobenius target π₀=ℤ_p. Genuine C_p sphere fixed points have π₀=ℤ² versus homotopy fixed points ℤ⊕ℤ_p; both p-complete to ℤ_p². Wedges retain bounds (n,n+2). n=0 is identity; n=1,2 use one,two restriction pullbacks. | Pass | None |
| Extended powers and tensor convention | k=0,1,3; G=S₃; S and 0 | D₁(E)=E; D_(S₃)(S) has π₀=ℤ, D_(S₃)(0)=0. At k=0 the empty tensor is S even on 0. Swaps on degree-one/two factors have degree −1/+1. | Pass | None |
| Steenrod composition and Milnor conventions | p=2,3; degrees 0,1,2; odd products | Sq¹Sq¹=0, Sq¹Sq²=Sq³; at 3, P¹P¹=2P². Sq¹u=u² and Sq²u=0; P¹v=v³ has degree 6. β(xz)=yz−xw. Dual dimensions at 2 in degrees 0,1,2 are 1,1,1. | Pass | None |
| Announced finite Hopf-chain contract | p=2,3; n=−1,0,1 | Quotient dimensions are 1,2,8 at 2 and 1,2,12 at 3. E(Q₀,Q₁) has dimension 4, not 12. Left Sq¹ pairs 1→Sq¹ and Sq²→Sq³→0; the trivial module instead has nonzero Sq¹ homology 𝔽₂. | Precise distinct obligation | None |
| Finite norm and induced vanishing | G=1,C₂; HZ and induced object | Identity norm gives cofiber 0. C₂ norm on π₀HZ is multiplication by 2 with cokernel 𝔽₂. Induced-object Tate is 0, so ordinary fixed points are not a substitute. | Pass | None |
| Completion conventions | Hℚ,HF_p,Σ⁻¹HF_p; p=2,3 | Derived completions are 0,HF_p,Σ⁻¹HF_p. The last has π₋₁=𝔽_p; a connectivity convention requiring lower bound 0 would exclude a legitimate input. | Pass | None |
| Witt ownership, reduction and rank | 𝔽₂,𝔽₃,𝔽₄; R01 | Rank/residue-degree pairs are (1,1),(1,1),(2,2). Residue endomorphism-set sizes are 1,1,2, matched by id/φ integrally. At 𝔽₄ the images a,a+1 are roots; 0,1 both give polynomial value 1. | README passes; plan duplicates rank | R01 |
| Unramified hypothesis | ℚ₃(ζ₃) versus W(𝔽₃)[1/3] | T²+3T+3 is Eisenstein: degree 2, ramification 2, residue degree 1. W(𝔽₃)[1/3]=ℚ₃ has degree 1. Thus rational étaleness alone cannot identify those integers or ranks. | Pass | None |
| Sphere fixpoint example and ownership | S with trivial C_(p²)-action, p=2,3; 0; R02 | Residual Tate of S^(hC_p) has π₀=ℤ₂,ℤ₃, with mod-p quotients 𝔽₂,𝔽₃; zero input gives 0. These are local Segal consequences, distinct from the bounded-above vanishing statement. | Mathematics passes; citation stale | R02 |

**Pinned-library audit.** The checked package revisions agree with `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Object searches included compatible sections, eventual images, finite systems, Witt coefficients/Frobenius, spectra, Steenrod operations, Singer, Tate and Eilenberg–Steenrod carriers. The following 19 declarations were opened at those pins:

| Pinned file and line | Declaration; what its type/body does and does not supply |
|---|---|
| Mathlib/CategoryTheory/Types/Basic.lean:222 | `CategoryTheory.Functor.sections`: dependent functions satisfying transition equations; no finite or nonempty assumption is part of this definition. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:79 | `nonempty_sections_of_finite_cofiltered_system`: finite nonempty stages with the stated cofilteredness condition. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:125 | `CategoryTheory.Functor.eventualRange`: intersection of transition ranges. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:230 | `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`: finite-range stabilization in the cofiltered system. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:255 | `CategoryTheory.Functor.toEventualRangesSectionsEquiv`: sections unchanged by eventual-range replacement. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:262 | `CategoryTheory.Functor.surjective_toEventualRanges`: surjectivity on the stabilized ranges under its hypotheses. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:312 | `CategoryTheory.Functor.eval_section_surjective_of_surjective`: finite nonempty stages and surjective transitions; not arbitrary original transitions. |
| Mathlib/CategoryTheory/CofilteredSystem.lean:323 | `CategoryTheory.Functor.eventually_injective`: finite section set for the surjective finite system, with the index/nonemptiness assumptions retained. |
| Mathlib/Algebra/CharP/Lemmas.lean:321 | `frobenius`: pth-power semiring homomorphism with exponential-characteristic hypothesis. |
| Mathlib/RingTheory/WittVector/Defs.lean:52 | `WittVector`: coefficient field `coeff : ℕ → R`; an ordinary carrier, not a connective spectral algebra. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:218 | `WittVector.frobenius`: ordinary ring endomorphism. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:255 | `WittVector.coeff_frobenius_charP`: coefficientwise pth power additionally requires characteristic p. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:270 | `WittVector.frobenius_eq_map_frobenius`: comparison with coefficient Frobenius. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:275 | `WittVector.frobenius_zmodp`: identity over the prime field, not all finite fields. |
| Mathlib/RingTheory/WittVector/Compare.lean:199 | `WittVector.equiv`: W(ZMod p)≃ℤ_p, not W(k)≃ℤ_p for d>1. |
| TauCeti/RingTheory/WittVector/Frobenius.lean:43 | `WittVector.frobenius_teichmuller`: ordinary φ([a])=[a]^p, so that formula needs no new local target. |
| Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36 | `TopPair.HomologyPretheory`: functors and connecting natural transformations for topological pairs; no spectral EM object or complete operation algebra. |
| TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:70 | `HasPairSequence`: exactness for the ordinary pretheory, not a spectrum category. |
| Mathlib/CategoryTheory/Triangulated/SpectralObject.lean:44 | `CategoryTheory.Triangulated.SpectralObject`: functorial distinguished triangles indexed by composable arrows in a supplied pretriangulated category; not the category of stable homotopy spectra. |

The native finite-system results are imported, and §3.1 adds the nonsurjective/empty-limit pro-isomorphism assembly. Ordinary Witt Frobenius is imported; §4.8 concerns a marked spectral lift and identification of its Tate-valued map. The homological Tate sequence in §1.2 is continuous mod-p homology, distinguished by the sphere example from both the supplied homotopy sequence and ordinary homology of the limit. These are substantive variants rather than duplicate native declarations.

**Cross-roadmap resolution and ownership.** I used `roadmaps grep`, `roadmaps show` and `roadmaps resolve`, the content main branch, the supplied open-head files and board package object searches. The resolver reported no unresolved roadmap citation or backticked name; its external Lean check was unavailable, so the pinned declarations were checked directly above. The text-level stale attribution in R02 is not detectable merely by finding section numbers. The following are the resolved suppliers, with repository-relative locations; open proposals are contracts, not assertions of completed formalization.

| Supplier file and locations | Resolved inputs and ownership boundary |
|---|---|
| TauCetiRoadmap/StableHomotopyKTheory/README.md, Layer 5; :2455, :2523, :2680 | Spectrum/smash/EM/connectivity and operadic foundations; §7.9 Milnor comparison; §§7.14–7.19 completion, detection and rationality; §§7.21–7.26 exact couples and complete convergence. This roadmap extends those foundations with Singer/Segal and the comparisons, rather than rebuilding them. |
| TauCetiRoadmap/GeneralizedCohomology/README.md:453, :785, :878, :1214, :1536, :1652 | G2.8 free-commutative-algebra extended powers; G3.8–G3.9 limits and function-spectrum completion; G4.2/G5.3 Thom objects; G5.4 ku/KU and Bott. The tower and virtual-twist comparisons here are additional targets. |
| TauCetiRoadmap/TangentialBordism/README.md:727, :775, :859, :1504 | The B4.1/B4.2/B4.7 aliases resolve to squares, full stable operations, all-prime operations/Adams; B4.8 has infinite Milnor-exterior freeness. It does not supply the announced exhaustive finite A_p(n) chain. |
| TauCetiRoadmap/BordismFormalGroups/README.md:293, :557, :1004, §F6.4, :1528, :2508 | F3 supplies the p=2 BP⟨1⟩/ku comparison and E(1) localization; F6.1/F6.4 localization/smashing; F6.3 finite Margolis subalgebras; F6.5 finite norms/Tate and raw E(n−1)-local finite-height descent. Raw rationality at height 1, not merely K(1)-acyclicity, supports §7.5. |
| TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:639, :700, :739 | §§4.0,4.4 genuine cyclic interfaces and restriction/norm comparison; §4.5 complete cyclic resolution, EM comparison and homotopy Tate SS with pairings and conditional convergence. Strong continuous-homology convergence is proved here under its own hypotheses. |
| TauCetiRoadmap/AInfCohomology/README.md:3815, :3833, :3849 | AI.7.2 supplies bounded-below orbit vanishing and the exact unit-normalized lax monoidal tensor-Tate diagonal. Its construction does not take sphere Segal as an input. |
| TauCetiRoadmap/RefinedTraceMethods/README.md:485, :557, :588, :608, :646, :835, :881, :920, :1113, :1229, :2413, :2491, :2519 | §§2.1–2.6 action/adjunction/boundedness/parametrized/cyclic/THH interfaces; §2.8 E∞ Frobenius; §2.10 cyclic-bar/free-loop model; §§2.11–2.13 genuine and representation spheres; §2.16 restriction pullback; §5.1 localized stable Adams and §5.3 orientation; §6.1 spectral étale equivalence. R02 concerns only the extra obsolete sphere descriptions. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:344, :346, :351, :361 | Named finite-unramified supplier gives W(k)[1/p], its integers, rank and rational Frobenius for every prime. The nearby p>3 restriction belongs to a different K₃ theorem. This is the existing owner relevant to R01. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1117, :1436, :1456 | E3 coherent Kan extensions/adjoints and E5:abstract monoidal/operadic structures. Parametrized p_!⊣p*⊣p_* is also explicit in RefinedTraceMethods §2.4. |
| TauCetiRoadmap/AlgebraicTopology/README.md:946, Stage 6 items 1–2 | Ordinary cochains, products and relative comparisons; its right-suspension convention is translated to the left-suspension convention specified here. The Bockstein sign is recomputed in §6.3, not silently identified. |
| TauCetiRoadmap/TopologicalKTheory/README.md:702, :818, T1–T5 | Degree-zero Adams, bundle splitting and Bott comparison on finite CW inputs; coherent stable localized Adams is supplied by RefinedTraceMethods. Neither is restated as a new construction. |

The additional overlap searches found these relevant open constructions and resolved their objects:

- `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:141`, `:146`, `:148`: completed/formally étale lifting and perfect δ-ring spherical lifts. The target here is specifically the finite-field marked ordinary étale sphere-algebra lift and its Frobenius comparison. Its broader perfect/completed construction is not reproduced here; this roadmap's downstream contract explicitly exports the finite-field case.
- `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:1661` and `:1667`: E(k)-linear periodic Lubin–Tate rings with homotopy W(A)[[u₁,…]][u±¹], not the connective finite-field sphere-algebra object. Its scope at line 7 explicitly imports the power and transfer ideal from this roadmap.
- `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:137`: consumes this roadmap's §2.7 sphere theorem. It is not used as a supplier here. The height-one input for §7.5 resolves instead to BordismFormalGroups.

The object searches included the provided open roadmap checkouts and main, rather than just searching this roadmap's proposed names. No additional duplicate construction was identified. Suggested.lean declares no names, so it cannot collide with another roadmap's fully qualified declarations. The main GeneralizedCohomology and TopologicalKTheory roadmaps were also read for the established document shape.

**Declared gaps.** Both original slugs occur in the plan. The review brief explicitly announces both contracts. The README's exhaustive-chain paragraph at line 86 gives the same mathematical contract and named BordismFormalGroups owner; it is not treated as falsely claiming the chain already exists there. Its dimensions 1,2,8 and 1,2,12 distinguish it from the existing Margolis subalgebras. The Witt paragraph at line 111 identifies its slug, gives a precise integral finite-étale/reduction comparison, and separately imports the existing rank theorem. Only the stale, broader plan obligation is a finding. No absence of implementation of an announced gap is counted as a defect.

**Headlines, statability and padding.** The README's end theorems and deep intermediate comparisons are the following 14 groups, all individually named with missing carriers in the module docstring. Native ordinary Witt vectors, abstract triangulated spectral objects and ordinary homology pretheories cannot state these spectral theorems without substantial new carriers. No simple omitted definition would suffice.

| Headline | README target | Missing pinned carrier/interface named in Suggested.lean |
|---|---|---|
| Singer Tor-equivalence | 2.4 | Stable Steenrod algebra, its graded modules and twisted Singer functor |
| Inverse-limit Adams theorem | 2.2 | Spectra, Adams tower and continuous Ext comparison |
| Topological Singer/augmentation comparison | 2.6 | Spectral extended powers, continuous cohomology and Singer module |
| Finite-type Segal theorem | 2.7 | Coherent tensor actions, spectral Tate and completion |
| Arbitrary-cardinality bounded-below Segal | 3.4 | Those same carriers and spectral boundedness/completion predicates |
| Unique Weyl refinement | 4.1 | Coherent spectral actions and lax monoidal Tate diagonal |
| All-integer-degree Frobenius/power equality | 5.6 | E∞ spectra, represented virtual twists and power maps |
| Finite-field spherical Witt Frobenius | 4.8 | Connective spectral sphere algebra, étale lifting and Tate comparison |
| Total Steenrod Frobenius | 6.3 | Spectral HZ/HF_p, Tate and stable operations |
| KU Frobenius equals stable Adams | 7.3 | KU, spectral Tate and localized stable Adams maps |
| Unbounded KU counterexamples | 7.4–7.5 | KU, residual actions, Tate and spectral Bousfield localization |
| Simply connected free-loop totalization | 8.1 | Suspension spectra, spectral totalization and connectivity |
| Controlled Tate/limit commutation | 8.2 | Coherent finite actions, spectral norms and connectivity |
| Free-loop Segal and genuine comparisons | 8.3 | Cyclotomic THH, genuine spectra and spectral p-completion |

The 64-line Lean file has one `import Mathlib`, a module docstring and the required namespace, with zero declarations. Thus the exhaustive `#check @name` signature inventory and one-tactic padding inventory both have zero entries; no section hypothesis can have been dropped and no probe copy is needed. The native finite-set helper and ordinary Witt formulas are correctly left as supporting mathematics in the README, rather than substituted for spectral headlines.

The README has all eight layers, Examples and Dependencies at each layer, theorem hypotheses and source locators, and API lists and at least three Checks for each introduced construction. All integer twists, all primes and arbitrary small cardinalities in the bounded-below Segal theorem are retained. The finite-field spherical example is an application of ordinary spectral étale lifting, not a claim to build general perfect-base lifts. No route-specific prime restriction, computational algorithm, copied exposition, sorry'd data or option override was found. R01 is a repairable ownership-record defect, so rejection of the roadmap's scope is not warranted.

## Not verifiable

No source required for the seeded sample or the additional proof checks was unavailable. All cited works have legal cached records; no new missing-reference request or manifest edit was needed. The BMMS source was read from its OCR extraction, with the displayed Euler formula also checked independently on the p=3 and p=5 examples above.

The two announced supplier contracts remain future library obligations. This review checks their precision, allocation and mathematical use; it does not certify implementation of the finite-Hopf-chain or integral finite-étale endomorphism theorem. R01 must synchronize the latter obligation before acceptance. The empty Lean file's successful elaboration verifies file form and imports, not the truth of any spectral theorem.

## Source issues

- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 line 649 and line 660): the source says the multiplicative p-series uses x−1 in the chosen coordinate; it should be (1+x)^(p^r)−1 for r=1,2, vanishing at x=0; affects a stated result.
- **Misprint** in ns18 at the decompositions before Theorem IV.1.15 and that theorem, printed pp.332–333 (ns18 line 5120, line 5126 and line 5136): the source says odd-prime shifts are i(p−1) and i(p−1)+1; it should be 2i(p−1) and 2i(p−1)+1; affects a stated result.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 line 4852): the source says the p-complete sphere exemplifies categorical compactness among p-complete spectra; it should be finite/dualizable p-complete, since its p-inversion diagram violates compactness; affects a stated result.
- **Error** in ns18 at Remark IV.1.11, printed p.328 (ns18 line 4974): the source says transfer from the trivial subgroup alone makes the prime power additive modulo its image; it should be the ideal generated by proper Young-subgroup transfers; affects a stated result.
- **Error** in ns18 at Proposition IV.1.16 and the monomial interpretation of Theorem IV.1.15, printed pp.332–333 (ns18 line 5132 and line 5155): the source says odd-prime Frobenius has unsigned reduced-power and Bockstein coefficients; it should be (−1)^iP^i and right coefficient (−1)^(n+i)βP^i in the stated monomial/Koszul normalization; affects a stated result.
