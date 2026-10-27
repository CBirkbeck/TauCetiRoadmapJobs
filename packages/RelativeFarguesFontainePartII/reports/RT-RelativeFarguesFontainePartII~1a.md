<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6433556868 -->
Red team round 1 pass a (codex) of 4ed8f9d

Verdict: needs_changes

1. **F01** (P1) The crystalline ring is not a subring of global holomorphic functions

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:571`: “the indicated subring B_cris,ρ⁺ of B”.

   **Claim:** The radius-dependent crystalline completion embeds compatibly into B=B_(0,1).

   **Witness:** At p=2 and |a|=ρ=1/2, z=[a]²/2 is topologically nilpotent in A_cris,ρ, since v₂((2n)!/2ⁿ)=n−s₂(n)→∞. Thus 1−z is invertible there but has a primitive zero of radius 1/4 in B.

   **Exact repair text:** “Inverting p gives B_cris,ρ⁺, with its natural inclusion in B_ρ⁺. It is not in general a subring of B. Check: for p=2 and |a|=ρ=1/2, the convergent PD geometric series Σₙ([a]²/2)ⁿ inverts 1−[a]²/2, whose zero at radius 1/4 prevents its inverse from belonging to B.”

   **Repair test:** FF17 line 3942 gives B_(ρᵖ)⁺⊆B_cris,ρ⁺⊆B_ρ⁺. The witness has its pole below ρ, so it belongs to the repaired radius-dependent target and is excluded from B.

2. **F02** (P1) Endpoint splitting incorrectly asserts π-adic convergence

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1712–1714`: “the nonnegative-index pieces sum in B_(I_minus)”.

   **Claim:** Geometrically shrinking annular Laurent corrections remain a convergent series after positive-index splitting and adjoining radius zero.

   **Witness:** Take I={1/2}, E=𝔽₂((π)), |a|=1/2 and f_k=a^k (k≥1). Their annular norms are 2⁻ᵏ, but all positive pieces have radius-zero norm 1; their series is not Cauchy in B_[0,1/2].

   **Exact repair text:** “For positive-index pieces, first sum each coefficient in the complete field F (in mixed characteristic, prove convergence of the corresponding Witt carry limits). Prove the resulting lower-bounded coefficient family satisfies the boundary-zero growth condition. This constructs an element of B_(I_minus); the original series of positive pieces need not converge in its radius-zero topology. Negative-index pieces are summed in the endpoint-one topology.”

   **Repair test:** In the witness the coefficient sum is a/(1−a), a legitimate constant in B_[0,1/2]; its π-adic partial sums still do not converge. FF17 lines 14667–14683 make the same unjustified endpoint extension, so that proof cannot be imported verbatim.

3. **F03** (P2) The Hahn localization uses a monomial that need not exist

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:511`: “Γ a nonzero subgroup of ℝ with pΓ=Γ” and “A[1/π,1/T]”.

   **Claim:** The preceding T=[t] can be inverted for every permitted Hahn exponent group.

   **Witness:** Γ=√2·ℤ[1/2], p=2 satisfies 2Γ=Γ, but 1∉Γ. The monomial t=t¹ and therefore T=[t] are absent from F and A.

   **Exact repair text:** “Choose γ₀∈Γ with γ₀>0 and put T₀=[t^γ₀]. Define Bᵇ=A[1/π,1/T₀]; this localization is independent of γ₀. Use T^α solely as notation for [t^α] with α∈Γ.” Replace the proof's exponent lower bound by −Nγ₀. Keep Checks requiring 1∈Γ explicitly conditional.

   **Repair test:** For Γ=√2·ℤ[1/2] choose γ₀=√2. Then |T₀|=q^(−√2)<1 and its powers clear every finite lower exponent bound; no nonexistent exponent 1 is used.

4. **F04** (P1) The Fontaine surjectivity declaration has the wrong namespace

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:37`: “WittVector.surjective_fontaineTheta”.

   **Claim:** That qualified declaration supplies surjectivity at the pinned Mathlib.

   **Witness:** `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:190` closes namespace WittVector; line 195 declares the root theorem `surjective_fontaineTheta`. No declaration `WittVector.surjective_fontaineTheta` exists at this pin.

   **Exact repair text:** Replace `WittVector.surjective_fontaineTheta` by `surjective_fontaineTheta` in the Mathlib contract. Keep its surjective-Frobenius hypothesis.

   **Repair test:** The root declaration takes precisely surjectivity of Frobenius on ModP and returns surjectivity of the named Fontaine map; the later §2.3 Needs line already uses its correct root name.

5. **F05** (P3) The Banach–Colmez supplier target was renamed

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:2235`: “VB3, General Banach–Colmez spaces”.

   **Claim:** This names the current owner of the degree-two Banach–Colmez construction.

   **Witness:** `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1184` instead names “Banach–Colmez section and hypercohomology sheaves”, anchor `banach-colmez-space-definition`; neither the cited heading nor `general-BC` occurs at its current head.

   **Exact repair text:** “*Needs:* §1.12; §6.10; TauCetiRoadmap.VectorBundlesAndIsocrystals VB3, Banach–Colmez section and hypercohomology sheaves (banach-colmez-space-definition); gap:positive-degree-two-obstruction.” Update that gap's supplier section from “VB3 general-BC” to this current target while retaining its slug and needs.

   **Repair test:** Its `BC(E)(T)=H⁰(X_T,E_T)` specializes to E=O(2); the separately declared obstruction still supplies nonrepresentability. No missing-obstruction finding is raised.

6. **F06** (P2) Small Hahn errors do not make coefficients equal

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:513`: “a coefficient with value at least c agrees with that of x_m”.

   **Claim:** Approximation with norm error less than c gives literal equality of coefficients above the threshold c.

   **Witness:** At ρ=1/2 take x=1, x_m=1+π^m and c=1. The error norm is 2⁻ᵐ<1 and both coefficient norms are 1, but 1≠1+π^m.

   **Exact repair text:** “If a coefficient of x has term norm at least c and |x−x_m|_ρ<c, its term norm equals the corresponding term norm of x_m. Consequently the threshold sets agree, and their coefficient π-valuations agree.”

   **Repair test:** The witness gives equal term norms 1 and π-valuations 0, which suffice to transfer well-ordering and bounded denominators; coefficient equality is unnecessary.

7. **F07** (P3) A Newton definition is cited as a corollary

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:249`: “Corollary 1.6.21”.

   **Claim:** The indicated source result is a corollary at printed page 75.

   **Witness:** FF17 line 3094 labels 1.6.21 a definition: the Newton polygon on an arbitrary interval is the union of compact restrictions.

   **Exact repair text:** Replace “Corollary 1.6.21” with “Definition 1.6.21”. Also locate Corollary 1.6.17 on printed page 73, separately from Definition 1.6.18 on page 74.

   **Repair test:** FF17 lines 3047 and 3094 have precisely those labels and page locations; the mathematical convention is unchanged.

8. **F08** (P1) The interval-system comparison introduces a local dependency cycle

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1772`: “Use the interval sheaf property and the gluing theorem to identify these systems”.

   **Claim:** Section 8.5 proves comparison with locally free/coherent sheaves before the gluing theorem in §8.9, which itself requires §8.5.

   **Witness:** The §8.5 proof consumes §8.9 gluing; the explicit §8.9 Needs line at README:1854 consumes §8.5. Thus 8.5→8.9→8.5 for the combined definition/comparison target.

   **Exact repair text:** In §8.5 retain only the compatible-system definitions, restriction and cofinality. Move its sentence identifying systems with locally free/coherent O-modules to the end of §8.9 as a corollary, citing §§8.1, 8.3 and the gluing theorem just proved.

   **Repair test:** Rank-two systems remain defined before gluing, with transition B_K⊗B_J²=B_K². Their sheaf comparison follows after gluing the identity overlap matrix; §8.9 no longer consumes its own consequence.

9. **F09** (P3) Three explicit prerequisites occur after their consumers

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:877`, `:1407`, `:1447`: Needs references to §2.13 and §6.8.

   **Claim:** The displayed build order puts metric comparison before its listed coefficient-change input, and homogeneous factorization/divisor surjectivity before full orbit products.

   **Witness:** Section 2.12 needs 2.13. Sections 6.3 and 6.5 need 6.8; 6.8 needs only 6.6, 6.7 and 6.4, so a topological ordering exists.

   **Exact repair text:** Put §2.13 before §2.12 (or remove that edge if the stated proof does not use it). Order Layer 6 as current §§6.1, 6.2, 6.4, 6.6, 6.7, 6.8, 6.3, 6.5, 6.9–6.11, updating section references.

   **Repair test:** The degree-two factorization now uses already constructed degree-one full products. The d=0 empty product and weighted degree 2 calculations are unchanged.

10. **F10** (P2) The valued-homogeneity headline is statable but absent

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:2208` and `packages/RelativeFarguesFontainePartII/Suggested.lean:28`: the README promises a separate valued automorphism-extension theorem; the module only lists the primitive-point orbit theorem as unavailable.

   **Claim:** The file contains every headline expressible on the pinned carriers.

   **Witness:** The exact Hahn-field object in §11.5 is native: `HahnSeries.instField` in `Mathlib/RingTheory/HahnSeries/Summable.lean:885`, and `HahnSeries.addVal` in `Valuation.lean:44`. No primitive-point carrier occurs in its homogeneity assertion.

   **Exact repair text:** Add a headline theorem for H=HahnSeries ℚ (AlgebraicClosure (ZMod p)), with p prime: for nonzero x,y∈H of positive order, there is σ:H≃+*H fixing every constant, with σ(x)=y and order(σ(z))=(order(y)/order(x))·order(z) for every z≠0. Give it `sorry`, its own mathematical docstring and a README name. Retain the nonstatability note for the separate primitive-point orbit theorem. State the general maximally complete field formulation too, using a real-body nested-ball-intersection predicate if needed, rather than claiming that the native Hahn-field result is the entire general formulation.

   **Repair test:** For x=t,y=t² the ratio is 2 and order(σ(t^(1/2)))=1. The assertions quantify over arbitrary positive-order Hahn series, so this is the deep extension theorem, not a monomial reindexing example. Nonzero binders prevent the junk order of zero or division by zero.

11. **F11** (P2) The eigenspace Banach topology has an earlier owner

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1362–1366`: “by its Banach E_h-topology” and “prove equivalence and completeness”.

   **Claim:** The absolute eigenspace Banach topology and independence of annular radius are new targets of §6.1.

   **Witness:** `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:914`, target `norms-on-twisted-invariants`, already gives the canonical Banach topology and equivalent annular norms for every fixed twist of a finite-projective tilted Robba Frobenius module.

   **Exact repair text:** “Import the Banach topology and radius-independence from VectorBundlesAndIsocrystals VB1, Norm topology on twisted Frobenius invariants (norms-on-twisted-invariants), via its annular Frobenius comparison. This section proves the all-radius fundamental-interval estimates, the φ^h coefficient refinement and the algebraic boundary-quotient comparison, transporting that supplied topology.” Add that precise supplier to Needs.

   **Repair test:** At h=1,d=1 the rank-one specialization is exactly the supplied kernel topology. The boundary quotient still has inherited norm 1 on every nonzero eigenvector and needs this roadmap's distinct topology-transport theorem.

12. **F12** (P3) The Hahn Check identifies exponents with their indices

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:528`: “the infinite threshold set S_(ρ,1/q)=ℕ”.

   **Claim:** For the family supported at 1−p⁻ⁿ, its threshold set is ℕ.

   **Witness:** With p=q=2, the threshold exponents are 0,1/2,3/4,7/8,… . The exponent 1/2 belongs and 1 does not, whereas ℕ has the opposite memberships.

   **Exact repair text:** “Its threshold set is {1−p⁻ⁿ:n≥0}, an infinite well-ordered subset of Γ of order type ω. It lies in A; requiring finite threshold sets would wrongly exclude it.”

   **Repair test:** Every term has norm 2^(−(1−2⁻ⁿ))>1/2, and all coefficient π-valuations are 0, so both conditions hold on exactly that exponent set.

13. **F13** (P3) A cited work is missing from the source manifest

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:2012` and `packages/RelativeFarguesFontainePartII/sources.toml`: “SGA 1, Exposé V, Corollary 2.4”.

   **Claim:** Every cited work has one source-manifest entry.

   **Witness:** The manifest has only FF17, KT16, Berger08, ST02 and Poonen93. The additional citation is readable as SGA1 line 3853, Exposé V Corollary 2.4, retyped page 93 (original page 113).

   **Exact repair text:** Add one SGA1 manifest entry for Grothendieck et al., Revêtements étales et groupe fondamental, with arXiv math/0206203, locator “Exposé V, Corollary 2.4”, cited_for “10.3”, and the legal sources-service metadata. Alternatively delete the historical SGA1 mention and retain the existing FF17 locator and declared scheme-quotient supplier contract.

   **Repair test:** The cited corollary has connectedness, faithful action and the preceding finite/noetherian hypotheses; it supports the historical curve application. The general scheme-torsor extension remains the declared supplier gap, not an assertion that this corollary alone proves that generality.

14. **F14** (P2) The meromorphic divisor definition includes zero without an extended carrier

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1295` and `:1320`: “set div(f)=Σ_y ord_y(f)[y], a locally finite integral divisor” and “including 0”.

   **Claim:** Every meromorphic function has an integer-valued locally finite divisor, and the displayed divisor inequality includes the zero function.

   **Witness:** For f=0 at any classical point, ord_y(0)=+∞, not an integer. With infinitely many classical points the support is also not locally finite. FF17 line 5960 separately introduces an extended zero convention.

   **Exact repair text:** “For nonzero meromorphic f, define div(f) in Div(Y_I) by its local DVR orders.” In §5.7 write “B={0}∪{f∈M(Y)×:div(f)≥0}.” Restrict the §5.6 order API accordingly; no extra extended-divisor carrier is needed.

   **Repair test:** Zero belongs through the explicit singleton, 1 has divisor 0, and 1/a_y has coefficient −1 and remains excluded from B. No infinite integer coefficient is required.

15. **F15** (P1) The Bézout supplier citation points to a slope theorem

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1274`: “PadicDifferentialEquationsAndRigidCohomology §RD.0.10”.

   **Claim:** This Needs edge supplies the standard discrete-coefficient Bézout special case mentioned in §5.4.

   **Witness:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:973`, §RD.0.10, proves product-slope additivity and the domain property. Its discrete-Cohen-coefficient Bézout theorem is §RD.0.29 at README:1499; ordinary analytic Bézout is §RD.0.24 at README:1361.

   **Exact repair text:** Replace this edge by “PadicDifferentialEquationsAndRigidCohomology §RD.0.29, Γ_an,r and Γ_an,con are Bézout domains, for the discrete-Cohen-coefficient comparison only.” Keep the arbitrary-perfect-F proof here. For ordinary Laurent functions cite §RD.0.24 with its spherical-completeness hypothesis.

   **Repair test:** A two-generator ideal in the supplied discrete-coefficient Robba ring now invokes the actual Bézout theorem. The general-F case still uses the compact correction and exact near-zero product, so no discrete hypothesis is silently transferred.

16. **F16** (P3) Invariant rescaling does not trivialize a primitive-generator cocycle

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:1088`: “If a is multiplied by an invariant scalar unit, σ(a)/a remains 1.”

   **Claim:** The generator cocycle of a stable primitive ideal is 1 after multiplication by an invariant scalar unit.

   **Witness:** In equal characteristic 3, take s²=t, σ(s)=−s, and a=(1+s)(π−t). Its ideal is invariant, but σ(a)/a=(1−s)/(1+s)≠1. Multiplication by the invariant scalar −1 leaves this ratio unchanged.

   **Exact repair text:** “Multiplication by an invariant scalar unit leaves σ(a)/a unchanged; this ratio is 1 when a itself is invariant. For a=(1+s)(π−t), s²=t and σ(s)=−s in characteristic 3, the ratio remains (1−s)/(1+s)≠1 after invariant scalar rescaling.” Keep the separate norm-denominator computation.

   **Repair test:** Let F be the completed perfection of 𝔽₃((t)) and C its completed algebraic closure. Then 1+s is a unit congruent to 1 modulo m_C, a has normalized residue π and (a)=(π−t); the example satisfies the actual descent hypotheses.

17. **F17** (P3) Several Checks provide no mathematical test

   **Location:** `packages/RelativeFarguesFontainePartII/README.md:2232`: “This is a discriminating model constraint”; also Checks at lines 1514, 1590 and 1959.

   **Claim:** These Check bullets test the definitions or assertions against a discriminating instance.

   **Witness:** The four bullets assert a constraint, a supplier dependency, a recorded gap and an obligation. Each remains true if the compared map is replaced by zero; none gives an input or an output.

   **Exact repair text:** Delete those four commentary bullets from Checks. Keep their following computed Checks. In §0.9 add: “At I={q⁻ʳ}, with r in the value group, take f=π[a] with v_F(a)=−r. Then v_r(f)=0 and ∂v_r(f)=1. Its right directional value is (0,1), its left value is (0,−1); the inverse reverses these, although both rank-one norms equal 1.” In §1.5 replace the uninstantiated topology comparison with: “π^n has interior norm ρ^n→0 and radius-one norm 1 for all n, so the interior and radius-one topologies differ.”

   **Repair test:** The first replacement separates left from right refinement and the rank-one wrong model. The second separates the two topologies on an explicit sequence. Neither is merely a statement that a test or supplier exists.

## Verified sound

Read all 2,270 README lines and all 58 Suggested.lean lines: **1 Lean declaration**, **109 numbered targets**, **9 bold worked targets**, and **318 Check bullets in 114 blocks**. The full computed audit remains in the existing scratch notes. This report retains 23 numbered/embedded target rows, all nine bold worked-target rows and the Lean declaration row. All 318 bullets were reviewed; numerical/structural tests are grouped by their 114 Check blocks rather than counted as 318 independent theorem verifications. Definition/API blocks were checked for the three-Check requirement; R17 distinguishes actual tests from commentary. Examples do not certify universal statements.

Resolved **114 inline source anchors (110 distinct)** in the five cached works, and the three additional Poonen93 theorem/corollary locators and SGA1 corollary: **118 locator occurrences examined**. This includes correction R07 and source statements whose wording is wrong but whose location is genuine. The source errata below distinguish support from literal agreement. All six cited works were readable through the supplied legal cache or sources service; there is no outstanding reference request.

Checked **69 lines containing cross-roadmap citations**, resolving **14 explicitly qualified supplier names**, plus the named AlgebraicVectorBundles and RelativeFarguesFontaine ownership claims. The detailed supplier ledger remains in the existing scratch notes. Ownership searches used `roadmaps grep`/`roadmaps show`, the main active/completed roadmaps, board packages and all **55 provided sibling heads (110 README/Lean files)**. Searches covered ramified Witt carriers and diagonals, Q-compatible inverse limits, annuli, primitive divisors, Frobenius eigenspaces, Banach–Colmez spaces, Fréchet–Stein systems, completed analytic differentials and valued automorphism extension. Matching words alone were not treated as duplicated constructions.

The supplied elaborated signature of `TauCetiRoadmap.RelativeFarguesFontainePartII.exists_strict_laurentClosure_endomorphism` retains p-primality, characteristic, the normed algebraic closure, arbitrary universes and the valuation-order compatibility hypothesis. It agrees with the README's arbitrary characteristic-p coefficient field. Its candidate countermodels, identity and Frobenius, fail strictness; no one-tactic/pinned-lemma proof was found. **No padding finding:** the only declaration is a substantive end theorem. There are no data declarations, dropped section binders, `set_option`, prohibited imports, `lemma`, admitted examples or `True` stand-ins. I compared the supplied signature directly; I did not run Lean or a build.

The read-only diff is confined to `packages/RelativeFarguesFontainePartII/` (README, Suggested.lean, design plan, metadata, repair reports and source manifest). No process narrative, pull-request number or computational algorithm was found in README or Lean docstrings. Each numbered target has a source locator. The repair report marks no earlier finding “not actionable in this package”; no settled rejection was reopened.

The read-only dependency command returned exactly:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This checks inter-roadmap direction; it does not detect the internal target cycle R08 or forward references R09.

### Supplier contracts

All six gap slugs match between `design/plan.json` and Exact supplier contracts. Each has a named earlier supplier and a specified missing interface. The generic supplied theories do not already supply these quantitative, radius-specific, equal-characteristic, degree-two, closed-convolution or free-scheme-quotient extensions. Their absence from suppliers is not a finding. R05 repairs only a drifted section label, without reopening the declared obstruction.

### Headline acceptance test

Of nineteen headline groups, the strict Laurent-closure endomorphism is stated, seventeen require missing period, interval-system or marked-untilt carriers, and the valued-field automorphism-extension theorem is statable but absent (R10). The native p-typical topological quotient does not make the missing ramified ringed statements statable. The primitive-point consequence of valued homogeneity still requires a future carrier.

### Source locator verification

The FF17 extraction is the dated 2017 author manuscript, so chapter/page locators were checked against that version. KT16, ST02 and Poonen93 use the page numbers of the supplied author/preprint copies; Berger08 uses printed page 96. SGA1 was fetched by the sources service from the legal arXiv reprint. Poonen93 Theorem 2 is at line 395, Corollary 5 at 489 and Corollary 6 at 500; the value-group and residue-field restrictions in §11.5 match them. ST02 lines 293–430 supply the coherent-system assertions, not automatic finite generation of arbitrary coadmissible modules. KT16 Theorem 1.2 supplies the actual strict map; its completed-differential criterion needs a primitive extension and the stated separability condition.

### Sampled computed statement audit

Context S: p prime; f≥1; q=p^f; E a complete discrete valuation field with residue F_q, uniformizer π and norm q⁻¹; F nontrivially valued, perfect and complete of characteristic p with F_q embedded; all intervals nonempty. G adds algebraic closedness of F. Zero has additive valuation +∞ and has no finite divisor. Every table row inherits S unless its context says otherwise. Quantitative descent rows are conditional on the declared cochain contract. Values are computations on the instances, not claims that examples prove a universal theorem.

| Statement and context | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| 0.1 truncations and diagonal, arbitrary O_E-algebra | length 0,1; p=2,R=F₂; Δ(π) | W₀=0,W₁=R; w₁(0,1)=0=w₁(0,0), although vectors differ; Δ ghosts (π,π), wrong [π] ghosts (π,π²) | Zero/torsion inputs allowed; ghost inversion rejected |
| 0.4 polygon definition/duality, S | π−[a],v(a)=2; [a]π²; r=−1,1,3 | linear factor L(1)=1,L(3)=2; monomial L(r)=2+2r for r≥0, −∞ for r<0; inverse gives +∞ left of 2 and 2 thereafter | Right rays and minus-conjugate convention agree |
| 0.9 directional valuations, S | [a]π²,v(a)=3; product of two copies | values (3+2r,2),(3+2r,−2); product values double; both coarsen to 3+2r | Opposite directional signs agree |
| 1.11 Hahn field and coefficient criterion, k perfect, pΓ=Γ | Γ=√2Z[1/2]; a_n=π^(−n²) and π^(−n); positive π^nT^(−n) | t¹ absent; term norms at ρ=1/2 are 2^(n²−n) and 1 with unbounded denominators; last norms (2ρ)^n tend to 0 iff ρ<1/2 | Criterion separates divergent families; R03, R06, R12 |
| 1.13 crystalline radius, E=Q_p | p=2,3; abs(a)=ρ=1/2 at p=2 | v₂(2!)=1,v₃(2!)=0; v₂((2n)!/2ⁿ)=n−s₂(n)→∞; 1−[a]²/2 has zero at radius 1/4 | Natural radius inclusion only; R01 |
| 2.2 reduction invariance, complete closed ideal | R=F₂[ε]/ε²,J=(ε),Q=X²; unit ideal | (a+bε)²=a², so nilpotent coordinate disappears; J=R requires R=0 for separatedness and both limits are singleton | Completeness excludes false unit-ideal example |
| 2.10 weak LT lift, S | linearized [π^n]_LT versus unnormalized iterate | derivative of π⁻ⁿ[π^n]_LT is 1; derivative of [π^n]_LT is π^n→0 | Formal addition differs from ordinary addition |
| 3.4 geometric compact PID, G | irrational singleton; {0}; integral subring | #classical points=0, Spm field={(0)}; π invertible in B₀ but not in valuation subring; latter has (π) | Exceptional field cases retained |
| 4.3 primitive descent, S | norm(a)=1/4,numerator=1/8; p=3,s²=t,a=(1+s)(π−t) | quotient norm=1/2; σ(a)/a=(1−s)/(1+s)≠1; rescaling by −1 leaves that same nontrivial ratio | Denominator correct; invariant-rescaling Check false, R16 |
| 4.4 finite Galois orbits, S | orbit 2; S₃ with order-2 nonnormal stabilizer | degrees 2 and 6/2=3; nonnormal quotient is a 3-element set, not a quotient group | General nonnormal stabilizers handled |
| 4.7 weighted zero formula, S | degree 3 point, local order 2 | Newton jump 3·2=6; geometric pullback orders 2+2+2=6 | Counting one point with weight 1 gives wrong 2 |
| 5.6 meromorphic functions, S | a_y²/a_y; inverse; zero numerator | local orders 1 and −1; compatible restrictions keep these integers; zero function has no finite divisor | Zero has no defined integral divisor, R14 |
| 6.8 full products, G | one orbit; empty orbit divisor | φΠ₊=π^dΠ₊/b and φΠ₋=bΠ₋ multiply to π^dΠ; half-orbit multiplicities sum to 1 at every translate; empty=1 | Scalar-class canonical; degree 0 included |
| 6.10 repeated-jet sequence, G | d=1; same point repeated twice; distinct points | one point kernel dimension_E=1; double point quotient residue length 2 and kernel still E-line; two distinct points product of two length-1 quotients | Jets not product of equal residue fields |
| 7.3 positive twists, S,d>0 | V=0; trivial E-representation | invariants 0 for V=0; for V=E, invariants P_d(F)≠0; H¹=0 in both cases | Nonzero invariant assertion explicitly excludes V=0 |
| 8.2 endpoint splitting, S | E=F₂((π)),I={1/2},f_k=a^k,abs(a)=1/2 | annular norm 2⁻ᵏ→0; each radius-zero norm 1; coefficient sum a/(1−a) exists | Original endpoint-series convergence false; R02 |
| 8.5 interval systems, S | rank 0,1,2; rank jump | restrictions B_K⊗B_J^n=B_K^n; triple restrictions identity; ranks 1 and 2 cannot be isomorphic | Definitions sound; sheaf-comparison cycle R08 |
| 8.8 nonlinear matrix factorization, Banach E-algebras | n=0,1; Z=diag(T,T⁻¹) | rank 0 singleton identity; rank 1 conjugation trivial; Z E₂₁ Z⁻¹=T⁻²E₂₁; remainder UZVZ⁻¹ quadratic | Conjugated tangent and Z-dependent radius correct |
| 9.4 arbitrary radii, S | value group q^Q; J={q⁻√²} and [q⁻√²,q⁻¹] | singleton contains 0 admissible value-group subintervals; irrational endpoint not in contained rational compact exhaustion | Separate arbitrary-compact descent target necessary |
| 10.2 separable coefficient base change, S | unramified degree 2; equal-char inseparable tensor | φ′=φ²; geometric separable tensor K×K; inseparable tensor K[ε]/ε² has nonzero ε²=0 | Separability retained; Proj scalar twist cancels degree-zero ratios |
| 10.6 line degree/characters, S | Φ=π⁻¹φ,πφ; tensor; degree 0 | degrees 1,−1; tensor multiplier 1 and degree 0; fixed E-line only degree 0 | Dual and Tate signs agree |
| 11.2 strict endomorphism, arbitrary characteristic-p k | p=2,3; identity and Frobenius; trivial norm; d-sequence | identity surjective=true, rejected; Frobenius surjective on perfect completion and fails k-fixing on F₄; trivial norm gives norm(t)=1 but v(t)<v(1); at p=2, d₁=3,d₂=7,d₃=17 and d₂−2d₁=1,d₃−2d₂=3 | Single Lean headline is deep; no padding |
| 11.5 homogeneity/orbit theorem, G with homogeneity | x=t,y=t² in Hahn(Q,Fbar_p); norm-preserving subgroup | ratio 2, order σ(t^1/2)=1; an isometry preserves order 1 and cannot send t to t² | Native extension headline missing, R10 |

The nine bold worked-target rows and the sole Lean declaration row are retained below.

| Bold worked target | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Norms, scalar homogeneity and slope signs | q=2,r=2,π; slopes 2,5 | raw=1/4, normalized=1/2; v₁=2,v₃=5,v₆=7; derivatives 2,1,0 | Both slope jumps 1 |
| Coordinate comparison | q=2,r=2 | X ordinary norm 2⁻¹/², its square 1/2=raw T; π ordinary 1/2, its square 1/4=raw π | Claimed power exactly necessary |
| Metric normalization | q=2,δ=3; v(ε)=4 | ordinary distance 1/8; Frobenius gives δ′=6 and distance 1/64; vector norm 1/4→1/8 | Scalar factor 1/2, not squaring the vector norm |
| Weights and principal divisors | degree 3,order 2; weights 3,2 | jump 6=2+2+2; weighted sum 5≠number of points 2 | Weight agrees with pinned finite sum |
| Forward products and interpolation shift | divisor Π₋=Σ_{n<0}[φⁿy] | divisor φΠ₋=Σ_{n≤0}[φⁿy]; adjacent tails have supremum multiplicity 1, whereas sum gives 2 on overlap | Missing n=0 restored without double counting |
| Geometric and general chart distinction | gcd g of minimum-degree a and b | g divides a, so ν(a)=ν(g)+ν(a/g); minimality ν(g)≥ν(a) gives ν(a/g)=0, hence unit | General-field character obstruction retained |
| Corrected nonlinear factorization | Z=diag(T,T⁻¹),V=E₂₁ | ZVZ⁻¹=T⁻²E₂₁; linear term U+ZVZ⁻¹, quadratic term UZVZ⁻¹ | Tangent differs from unconjugated sum |
| Bounded fibre dimension and torsion length | jet exponents 1,2,3,… | fibre dimensions 1,1,1,…; lengths 1,2,3,…; n copies of residue give dimension n | Tests uniform fibres, not lengths |
| Scheme quotients and positive lines | separable quadratic residue; multiplier π⁻¹; Koszul | closed stabilizer size 2 but geometric stabilizer 1; degree −v(π⁻¹)=1; −ts+st=0 | Geometric inertia, sign and ordering agree |

| Suggested declaration | Section and full variable/instance context | Instances and computed values | Result / change |
|---|---|---|---|
| `exists_strict_laurentClosure_endomorphism`, line 40 | Layer 11. p:ℕ, Fact p.Prime; k:Type u₁, Field k, CharP k p; K:Type u₂, NormedField K, Algebra (LaurentSeries k) K, IsAlgClosure (LaurentSeries k) K; hvaluation compares every embedded x,y by norm and Valued.v. The conclusion gives a continuous ring endomorphism of UniformSpace.Completion K, fixing embedded k and not surjective. No ambient section variables. | For x=t,y=1, valuation(t)<valuation(1), hence norm(t)<1; for a∈k×, base valuation(a)=valuation(1), hence norm(a)=1. A trivial norm makes the t test false. Identity and Frobenius on the completed perfect closure are surjective, so fail the conclusion. At p=2,k=F₄ Frobenius also moves a primitive cube root, so fails coefficient fixing. Zero ring cannot instantiate Field. | Supplied elaborated signature retains every binder and arbitrary universes. KT16 Theorem 1.2 matches arbitrary characteristic-p k. One-tactic probe: neither identity nor Frobenius supplies the strict map; no pinned theorem was found proving it. No padding or sorry'd data. No Lean process was run. |

## Not verifiable

- No fresh Lean elaboration or build was run, as the read-only brief prohibits it. The supplied elaborated signature was inspected declaration by declaration; proposed new signatures in R10 still require the repair worker's permitted elaboration.
- The six declared supplier contracts are future mathematical inputs. Their ownership, matching slugs and boundaries were checked; their future proofs cannot be certified from the current suppliers. The Lubin–Tate supplier was available only as its board design, not an implemented or open-roadmap package.
- The computed instances and locator audit do not replace proofs of the deep repaired targets. In particular, coefficientwise endpoint reconstruction after R02, quantitative continuous descent, uniform generation, and arbitrary-radius descent still require the promised arguments.
- Ownership was checked against all 55 supplied sibling heads, main, and readable board packages. Ownership against other open pull requests without supplied files was not checked; search-index hits outside those inputs were not used to establish an owner or a missing declaration.
- The source issues describe the legally readable versions. No comparison with a later printed correction was available, and no published correction is asserted.

## Source issues

- **Misprint** in FF17 at Préface §2.2, printed page 24 (FF17 line 1052): the source says the annular valuation is the sum of point valuations; it should be their infimum, giving 1 rather than an infinite sum for the constant p; affects a stated result.
- **Misprint** in FF17 at Préface §3.1, printed page 32 (FF17 line 1343): the source says integral Witt coefficients can be arbitrary tilt-field elements; it should be elements of the tilt valuation ring; affects a stated result.
- **Error** in FF17 at Préface Corollary 3.3, note 26, printed page 32 (FF17 line 1373): the source says the integral local ring has exotic nonclosed maximal ideals; it should be nonclosed primes, or maximal ideals after localization, since the integral ring has one maximal ideal; affects a stated result.
- **Misprint** in FF17 at Proposition 1.4.9, printed page 64 (FF17 lines 2691, 2695): the source says the leading product exponent is n₀m₀; it should be n₀+m₀, as π²π³=π⁵; affects the proof.
- **Misprint** in FF17 at Example 1.5.3, printed page 67 (FF17 lines 2803–2805): the source says d+1 indexed factors give a degree-d unit leading coefficient; it should be d factors with matching coefficient and slope indices, or degree d+1; affects a stated result.
- **Error** in FF17 at Lemma 1.6.8, printed page 71 (FF17 lines 2953–2959): the source says the coefficient-change norm identity also holds at radius zero; it should be renormalized there: a ramification-e extension raises the normalized discrete valuation by e, with the residue-cardinality factor; affects a stated result.
- **Error** in FF17 at Proposition 1.6.16, printed page 73 (FF17 line 3039): the source says one endpoint's supporting line is bounded using the other endpoint's value and derivative; it should be a bound using value and derivative at the same endpoint; affects the proof.
- **Misprint** in FF17 at Proposition 1.6.25, printed page 77 (FF17 line 3198): the source says the tail valuation equals the fixed number λ−r₁; it should be bounded below by that number; for a single tail term its value varies as λ−r; affects the proof.
- **Misprint** in FF17 at Proposition 1.6.25, printed page 77 (FF17 lines 3211, 3214): the source says the supporting value subtracts (N+1)r; it should be P(N+1)+(N+1)r with this transform convention; affects the proof.
- **Error** in FF17 at §1.7.1, printed page 79 (FF17 line 3269): the source says local finiteness in bounded absolute-exponent intervals characterizes the completed Laurent perfection; it should be finite support below every real bound; otherwise the divergent negative-exponent series is admitted; affects a stated result.
- **Error** in FF17 at §1.7.1, printed page 79 (FF17 lines 3280–3286): the source says π-adic completion of the perfected polynomial ring gives A; it should be the weak completion also allowing convergence in the monomial parameter, since reduction must contain infinite positive-power series; affects a stated result.
- **Error** in FF17 at Lemma 1.7.2, printed page 81 (FF17 line 3388): the source says reciprocal-radius comparison preserves the numerical norm; it should be the ordinary norm raised to r when ρ=q⁻ʳ; π gives q⁻ʳ versus q⁻¹; affects a stated result.
- **Error** in FF17 at §1.7.2, printed page 82 (FF17 line 3402): the source says X↦X^q is finite étale in both coefficient characteristics; it should be finite radicial in characteristic p, where its derivative is zero; affects a stated result.
- **Error** in FF17 at Proposition 1.7.3, printed page 82 (FF17 lines 3442–3443): the source says the cyclotomic reciprocal-radius comparison is a literal isometry; it should include the same norm power as in the monomial comparison; testing the coefficient π already distinguishes them; affects a stated result.
- **Misprint** in FF17 at §1.7.3, printed page 83 (FF17 lines 3449, 3456): the source says the subsequent radius interval ends at q^(−1/(q−1)); it should retain the preceding bound q^(−(q−1)/q), with its strict endpoint condition; affects a stated result.
- **Error** in FF17 at §1.7.5, printed page 84 (FF17 line 3536): the source says B_I has integral Hahn coefficients subject to a well-ordered-threshold condition; it should allow fraction-field coefficients with denominator bounds on every threshold set; π⁻¹ must be included without admitting norm-unbounded series; affects a stated result.
- **Error** in FF17 at Proposition 1.9.1, printed page 87 (FF17 lines 3654–3659): the source says positive-index correction terms converge after adjoining radius zero; it should sum coefficients separately; constants aⁿ have annular norm tending to zero but constant radius-zero norm 1; affects the proof.
- **Misprint** in FF17 at Proposition 1.10.5, printed page 90 (FF17 line 3788): the source says the resulting sum belongs to B_[0,1]; it should be B_[ρ,1], as used in the statement and preceding convergence argument; affects the proof.
- **Misprint** in FF17 at Corollary 2.1.4, printed page 100 (FF17 line 4115): the source says the transition Frobenius acts on A/pA; it should be A/πA, the quotients in the displayed inverse limit; affects a stated result.
- **Gap** in FF17 at Proposition 2.2.6, printed page 107 (FF17 lines 4436–4439): the source says the p=2 unit approximation modulo 8 is left as an exercise; it should include that additional approximation before applying the root-lifting argument; affects the proof.
- **Misprint** in FF17 at Proposition 2.2.16, printed page 111 (FF17 line 4603): the source says an element of 1+m_F has additive valuation 1; it should be 0, so multiplication preserves the additive valuation; affects the proof.
- **Error** in FF17 at Proposition 2.3.2 and Remark 2.3.3, printed pages 115–116 (FF17 lines 4742–4744, 4776): the source says the additive proximity is the ordinary ultrametric distance; it should be q to the negative proximity, making the diagonal distance zero instead of infinity; affects a stated result.
- **Misprint** in FF17 at Example 2.3.7, printed page 117 (FF17 line 4821): the source says the cyclotomic quotient includes an additional [α] term; it should be the p-term sum of [α^(i/p)] for 0≤i<p; affects a stated result.
- **Error** in FF17 at the paragraph after Proposition 2.3.9, printed page 118 (FF17 lines 4865–4868): the source says the Frobenius-induced untilt map is isometric for the displayed valuations; it should rescale additive valuations by q^k; normalized E-valuations are isometric; affects a stated result.
- **Error** in FF17 at Proposition 2.3.16, printed page 120 (FF17 line 4955): the source says the absolute difference of evaluations is at least their positive proximity; it should assert equality after truncating both evaluations at that proximity; the constant 1 refutes the printed inequality; affects the proof.
- **Misprint** in FF17 at Proposition 2.4.5, printed page 125 (FF17 line 5140): the source says the newly added coefficient has factor π^d; it should have π^(d+1); affects the proof.
- **Error** in FF17 at Corollary 2.5.4, printed page 128, and Corollary 3.5.3, printed page 146 (FF17 lines 5277, 5894): the source says every closed maximal ideal of every interval ring is a classical point; it should exclude the zero maximal ideal of irrational-singleton fields, whose classical point set is empty; affects a stated result.
- **Error** in FF17 at Proposition 3.1.6, printed page 135 (FF17 lines 5502–5503): the source says a normalized primitive generator has interior norm 1; it should retain its nonzero norm in the denominator of the cocycle estimate; affects the proof.
- **Error** in FF17 at Proposition 3.1.7 and Theorem 3.1.8, printed page 136 (FF17 lines 5514, 5529): the source says the orbit products are indexed by Gal(L/F) for an arbitrary stabilizer field; it should use the coset set G_F/G_L, including nonnormal stabilizers; affects a stated result.
- **Misprint** in FF17 at Theorem 3.4.4, printed page 143 (FF17 line 5763): the source says Newton slopes are the point radii; it should be their negative base-q logarithms, as the following multiplicity formula already uses; affects a stated result.
- **Error** in FF17 at Lemma 3.4.5, printed page 144 (FF17 lines 5794–5804): the source says each geometric conjugate has norm equal to the radius raised to degree d; it should have the original radius; the generator estimate needs a bound uniform in d; affects the proof.
- **Misprint** in FF17 at §3.6, printed page 148 (FF17 line 5985): the source says g has no zeros on the inner interval; it should be h=f/g, since g was chosen to carry exactly those zeros; affects the proof.
- **Error** in FF17 at Theorem 6.4.4, printed page 254 (FF17 lines 10317–10318): the source says the interpolation ideal is generated by the unshifted negative product; it should use its Frobenius translate to include the n=0 zero; affects a stated result.
- **Error** in FF17 at Theorem 6.4.4, printed page 254 (FF17 lines 10319–10326): the source says repeated orbit conditions add the multiplicities of overlapping backward tails; it should take the pointwise supremum of the translated divisor requirements; adjacent translates already distinguish sum from supremum; affects the proof.
- **Error** in FF17 at Proposition 7.1.2, printed page 262 (FF17 line 10589): the source says positive-twist invariants are nonzero for every finite-dimensional representation; it should require the representation nonzero; for V=0 the invariant space is 0; affects a stated result.
- **Misprint** in FF17 at Proposition 7.3.1, printed page 267 (FF17 lines 10787–10791): the source says the Koszul maps are (−s,t) followed by (s,t); it should have second map (t,s), giving −ts+st=0; affects the proof.
- **Error** in FF17 at §7.8, printed pages 271–272 (FF17 lines 10964–10976): the source says arbitrary semilinear endomorphisms define a rigid tensor category with all rank-one objects invertible; it should require invertible Frobenius linearization; the zero rank-one map has no tensor inverse; affects a stated result.
- **Misprint** in FF17 at §7.8, printed page 272 (FF17 lines 10985–10987): the source says every Frobenius line has a one-dimensional geometric fixed space; it should restrict this assertion to degree-zero lines; affects a stated result.
- **Error** in FF17 at §11.2.1, printed page 369 (FF17 lines 14599–14600): the source says compact interval rings including radius 1 are principal; it should restrict that recall to compact intervals in [0,1); affects a stated result.
- **Gap** in FF17 at Proposition 11.2.2, printed pages 369–370 (FF17 lines 14613–14623): the source says the Fréchet–Stein coherent-system theorem directly gives finite-projective global sections; it should additionally prove uniform finite generation and projectivity for these annular bundle systems; affects the proof.
- **Misprint** in FF17 at Lemma 11.2.6, printed page 371 (FF17 line 14669): the source says the negative-index comparison repeats the same radius on both sides; it should compare its norm at ρ with its norm at ρ′, for positive ρ≤ρ′; affects the proof.
- **Error** in FF17 at Lemma 11.2.6, printed page 371 (FF17 lines 14667–14683): the source says positive-index monotonicity gives convergence in the enlarged interval containing zero; it should treat the separately defined radius-zero norm by coefficient summation, not that monotonicity; affects the proof.
- **Error** in FF17 at Remark 11.2.8, printed page 371 (FF17 lines 14700–14706): the source says finite subcovers of compact tests suffice for the interval sheaf assertion; it should require finite compact refinements; the disjoint half-open partition would otherwise force a domain to be a product; affects a stated result.
- **Gap** in FF17 at Lemma 11.2.10, printed page 372 (FF17 lines 14715–14726): the source says surjectivity of the unconjugated sum justifies the inverse-function argument at arbitrary Z; it should verify surjectivity of U+ZVZ⁻¹, the actual tangent map, and its quantitative bound; affects the proof.
- **Misprint** in FF17 at Proposition 11.2.15, printed page 375 (FF17 line 14863): the source says the entire extension ring is a finite sum with power-bounded coefficients; it should allow coefficients in B_F,I, as the next display does; affects the proof.
- **Gap** in FF17 at §11.2.4 after Proposition 11.2.18, printed page 377 (FF17 lines 14907–14919): the source says descent for value-group compact endpoints immediately gives descent on every interval; it should prove arbitrary-compact descent separately; an irrational singleton has no contained value-group compact exhaustion; affects the proof.
- **Misprint** in KT16 at Lemma 2.4, printed page 3 (KT16 line 115): the source says the base-changed extension uses the separable subfield l instead of L; it should be L completed-tensored with K′, so the named element t has an image; affects the proof.
- **Misprint** in KT16 at the proof of Theorem 1.2, printed pages 4–5 (KT16 lines 169, 181–184): the source says the sums start at index 0 after defining d_i and c_i only for positive indices; it should start at 1, or explicitly define both zeroth terms; affects the proof.
- **Misprint** in KT16 at the proof of Theorem 1.2, printed page 5 (KT16 lines 192–194): the source says the p^n-power sum and its derivative omit all c_i factors; it should retain c_i^(p^n), and c_n^(p^n) in the derivative; their norm 1 leaves the estimate unchanged; affects the proof.
- **Misprint** in Berger08 at Remark 1.1.3, printed page 96 (Berger08 lines 429–436): the source says the decreasing sequence starts at β₁ but its series and elimination use β₀; it should define the sequence starting at β₀; affects the proof.
- **Misprint** in SGA1 at Exposé V, Corollary 2.4, retyped page 93, original printed page 113 (SGA1 line 3858): the source says the inertia element acts trivially on G; it should act trivially on X, where faithfulness of the group action applies; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4ed8f9d9431c8e73b2b584583ef4c8ba1e3bb996", "job": "RT-RelativeFarguesFontainePartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
