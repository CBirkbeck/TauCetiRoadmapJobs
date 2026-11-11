<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13471#issuecomment-6790834334 -->
Review (codex) of 3cb5b73

Verdict: needs_changes

1. **F01** (P1) General microlocalisation need not preserve filtration degree

   **Location:** packages/LocallyAnalyticDistributionsPartII/README.md:290. “The map A → Q_T(A) is a strictly filtered ring map”.

   **Claim:** Strictness holds for every homogeneous Ore set in the associated graded ring of a Zariskian filtered ring.

   **Witness:** A = ℚ₃[x,x⁻¹], F_n = span{x^i : |i|≤n}, F_n=0 for n<0. Its graded ring is ℚ₃[X,Y]/(XY). For T={X^j}, x⁻¹ has original degree 1 but localised degree −1.

   The hypotheses hold: the Rees ring is ℚ₃[t,u,v]/(uv−t²), hence noetherian, and F₋₁=0 is in the radical of F₀=ℚ₃. The original filtration is separated, exhaustive and even complete. Inverting the degree-one element x puts its inverse in F₋₁ of the localisation. Completion embeds this localisation in ℚ₃((x⁻¹)); it does not kill x⁻¹. Thus the inverse image of F₋₁ contains x⁻¹ although F₋₁A=0. AW13 line 415 states the localisation's graded-ring comparison, not this blanket strictness assertion.

   **Exact repair:** State that the canonical map is filtered, retaining the graded-ring comparison and all the general microlocalisation theory. Add strictness under a sufficient hypothesis such as every element of T being regular in gr A: graded localisation is then injective and preserves the degree of every nonzero element. Keep the independently established strictness in §3.4, where gr A is a domain. Add this Laurent example as a negative Check. The corrected general assertion gives −1≤1 in the example; for the domain-symbol control A=ℤ₃[[X]], T=⟨gr 3⟩, degrees of 3 and X remain −1 in the increasing adic convention.

2. **F02** (P1) Ramified Verma modules use the wrong deformation index

   **Location:** packages/LocallyAnalyticDistributionsPartII/README.md:570, compared with the definition at :195 and base change at :202. “For an R-linear character λ : p^n t → R, let V̂^λ = `Û(𝔤)_{n,K}` `⊗_{Û(b⁺)_{n,K}}` K_λ”.

   **Claim:** A character integral on pⁿt defines a module over the completed Borel based on πⁿb⁺, for arbitrary ramified K.

   **Witness:** p=3, R=ℤ₃[π], π²=3, 𝔾=SL₂, n=1, λ(3h)=1. In Û(πb⁺), 1−3h is a unit, with inverse Σ_j(3h)^j. The proposed character sends this unit to zero.

   Indeed λ(πh)=π⁻¹ is not integral. The group can be the level-nine congruence kernel, so (1/3)R L_G=3sl₂(R), exactly as required by :570. This is an admissible instance, not an arbitrary incompatible lattice. The one-dimensional completed Borel module K_λ in the displayed tensor product does not exist. The scalar-ring repair of previous R17 is correct, but does not fix this independent p-versus-π problem.

   **Exact repair:** Write e=v_π(p) and use Û(pⁿ𝔤)_K=Û(𝔤)_{en,K}, and likewise the Borel and nilradical, throughout §4.13. Keep λ on pⁿt and the congruence level pⁿ⁺¹. Alternatively use the explicit lattice notation throughout this target. This agrees with §2.1's already correct ramification factor. In the example, the corrected Borel is Û(3b⁺)_K, where λ(3h)=1 is integral and 1−3h is not a unit; the obstruction disappears. At n=0, en=0, so §§4.12 and 4.14 are unchanged. Record the source's corresponding index slip: AW14 line 453 uses πⁿ, whereas lines 731 and 741 use pⁿ.

3. **F03** (P2) The arbitrary coefficient-field route exceeds its named suppliers

   **Location:** packages/LocallyAnalyticDistributionsPartII/README.md:307–309 and :61; also :570 and :574. “The ordered-series description and the graded ring for ω_U are NoncommutativeAndEquivariantIwasawa §0.8.”

   **Claim:** The cited supplier provides these inputs for every complete unramified coefficient DVR; §4.13 also invokes §3.6 for every complete discretely valued coefficient field.

   **Witness:** At #1307, TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:380,383–385 requires O finite free over ℤ_p. Take R=W(𝔽̄₃): R/3R has infinite 𝔽₃-dimension. It satisfies §3.2 but not that contract. The same field is outside §3.6's finite-extension hypothesis.

   This is a coefficient-domain mismatch, not a claim that the desired mathematics is false. The chosen R is the integer ring of the completed maximal unramified extension inside ℂ₃; p=3 is a uniformiser. Even G={1} lies outside the supplier's finite-free coefficient domain. The compact finite-module topology supplied in that roadmap's §F.1 must also not be transferred to this R: its residue quotient is infinite discrete. Both existing declared gaps concern distribution/Fréchet–Stein theory and do not supply this Iwasawa coefficient extension.

   **Exact repair:** Preserve the complete-discretely-valued generality. Mark and prove in §3.2 the extension of the ordered-series/graded comparison to arbitrary unramified coefficient DVRs, or declare a precise additional supplier contract for it. For §4.13 give the coefficient-general microlocalisation map, using §3.5 and its coefficient construction, or extend the base-change target beyond finite K/ℚ_p using an unramified coefficient subfield K′ with K/K′ finite. Do not invoke finite-dimensional tensor-product base change directly for infinite K/ℚ_p. State the domains in the supplier contract and Needs lines. Controls: R=W(𝔽̄₃), G=ℤ₃ must give gr R[[G]]=𝔽̄₃[P,X]; R=ℤ₃ gives 𝔽₃[P,X]. For G={1}, the extended map is K→K in both cases, although only the latter coefficient ring is finite over ℤ₃.

Three findings: two P1 and one P2. All seventeen previous findings have been repaired as requested; the new findings concern the generality of other assertions, including the newly expanded ramified statement. The two headline signatures elaborate and neither is padding. No package input was changed.

## Verified sound

### Previous findings checked first

I read the round-2 review and round-3 repair report before the fresh pass. No previous item was marked “not actionable in this package”. Quotes in this table are from packages/LocallyAnalyticDistributionsPartII/README.md unless specified. The assessment concerns the original finding; independent defects in the same section are identified separately above.

| Previous id | Repaired passage | Assessment and retest |
|---|---|---|
| R01 | :473 “D(G, K)_λ ≅ C^la(G, K)[λ ∘ S]′_b” | Repaired, including Suggested.lean:39–41 and inversion in §4.5. Torus pairings are 2 for the old ideal and 0 for the corrected ideal. |
| R02 | :234 “distributions supported in H” and “rank ℓ₁⋯ℓ_j” | Repaired. At G=ℤ₃, r=r₁, supported ranks are 1 for H={1} and 3 for H=G. |
| R03 | :379 “modules that admit a `p^a`𝔤-stable R-lattice”; :394 “If g_R is contained in a Chevalley lattice” | Repaired. The PGL₃ order has det(q)=−2/27; 3q is integral and the deeper-level argument retains general semisimplicity. |
| R04 | :166 “a free left D(H, K)-module on `δ_{g₁⁻¹}`” | Repaired. The inverse transversal in S₃ meets three right cosets rather than two. |
| R05 | :540 “β(t)(x) = pr₁(tx)” | Repaired. For u²=2, β(u/2)(u)=1, β(u/2)(1)=0. I also checked right R-linearity and the right T-action (f·t)(x)=f(tx). |
| R06 | :457 “for a fixed χ” and “P_z(dχ + ρ) = P_z(−(dχ + ρ))” | Repaired. X(0)=−X(0)=0 despite X being odd; the SL₃ cubic still gives −6 and 6. |
| R07 | :327 “S₀ = ⋃_a p^a(1 + pR)” | Repaired. In ℤ₃, 1 and 3 belong; 2 does not. Saturation still gives all nonzero scalars. |
| R08 | :55 “such that B is coadmissible as a left A-module” | Repaired in README and design/plan.json. B=A⟨T⟩ over A=ℚ_p is excluded; finite B=A² is allowed. |
| R09 | :197 “`Module.Basis.pbwBasis`” and “`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`” | Repaired. The pinned ordered basis is valid over ℤ₃, not merely fields. No future PBW owner is asserted. |
| R10 | :621 “`exists_surjective_algHom_end_symPower`”; Suggested.lean:98 | Repaired. The product form uses the native tensor and symmetric-power actions. End dimensions are 1,4,9 for k=0,1,2. |
| R11 | :300 “Q_T(A) = Â is the completion of A” | Repaired. ℤ_(3) completes to ℤ₃, whereas ℤ₃ remains itself. New R01 concerns another API bullet. |
| R12 | :556 “a commutative complete intersection, a hypersurface only for m = 1” | Repaired. Disjoint-block relations have codimensions 0,1,2 for m=0,1,2; each has a unit leading coefficient in its own H_i. |
| R13 | :392 “§9.2, Proposition and its proof, p. 61” | Repaired. AW13 line 2816 is labelled Proposition; its proof constructs the lattice. |
| R14 | :384 “the congruence depth is a = 0” | Repaired. For m=0,1,2 the level a+1 stays 1. |
| R15 | :211 “for h ≠ 0 with a basis vector u” | Repaired. The coefficient sequences are πⁿ→0 versus 1; rank zero gives K=K. |
| R16 | :351 “its K-linear span K[G], which is dense” | Repaired. Augmentation separates 0 from G, while K[{1}]=K. |
| R17 | :562 “extended R-linearly” and “R `⊗_{ℤ_p}` t₀” | Repaired, including the base-changed Lie algebra at :570. For π²=3, a(πh)=3−π. New R02 concerns the deformation index. |

The repaired patterns were searched throughout the package: antipodes and inversion; supported versus multiplied distributions; lattice existence; transversals and cocycles; exact symbols versus their saturation; restrictions of coadmissibility; PBW ownership; symmetric-power actions; completeness; factor/depth notation; dense spans; and coefficient rings. The general filtered-map and ramified-index failures were found in that pass.

### Principles, shape and headline coverage

The six layers follow the mathematical dependencies: lattices, distributions, completions, microlocalisation, central quotients, and the algebraic-function application. This is not a source's chapter sequence. The Part II boundary with LocallyAnalyticDistributions is real. General noncommutative carriers are retained; the endpoint covers every integral Casimir parameter, including non-induced parameters. The separatedness issue in Fu's distribution proof is an explicit hypothesis of that alternative route, not a hidden premise of the endpoint. I found no copied passage, computational algorithm, sorry-defined datum, set_option, admitted example, forbidden supplier, or process/machine-path residue in the roadmap or Lean docstrings.

There are 37 Needs lines, six Examples subsections and six Dependencies subsections. Fourteen definition sections have API lists and respectively 4,4,4,4,4,4,4,4,4,5,4,5,4,4 Checks (58 total), for §§0.1,0.2,1.1,2.1,2.2,2.5,3.1,3.3,3.7,3.9,4.1,4.2,4.4,5.1. Definition count alone was not used as mathematical evidence. The two added native carriers are needed by the headlines. House shape was compared with the main-branch PadicMeasuresIwasawaAlgebras and RepresentationTheory/LieHighestWeight roadmaps.

| Headline from the Summary and scope | Suggested.lean coverage |
|---|---|
| Semisimplicity of finite-dimensional rational Iwasawa modules, §3.8 | Stated at :78 on the actual completed-group-algebra carrier, with odd p, finite dimension and the scalar tower. |
| Algebraic Peter–Weyl, §5.2 | Stated at :98 for every finite product and finite K/ℚ_p, prescribing the native action on every group element and asserting surjectivity. |
| Fu injectivity, §4.14 | Named in the module docstring; the specified microlocalisation map and noncommutative completed central quotient are missing at the pins. |
| AW microlocalisation and D_(1/p), §§3.4–3.5 | Named; filtered microlocalisation and the nonabelian Banach distribution stages are missing. |
| Affinoid Verma faithfulness, §4.13 | Named; the affinoid Verma carrier and completed action are missing. R02 corrects its README specification. |
| Frommer and the crossed-product decomposition, §§2.3–2.4 | Named; distribution Banach stages are missing. |
| Isotypic quotient comparison, §3.10 | Named; the microlocalised module and comparison map are missing. |
| Central strong duality, domains and normal forms, §§4.3,4.7–4.10 | Named; their analytic topologies and completed quotients are missing. The antipode formula now agrees. |
| Arens–Michael Fréchet–Stein theorem, §2.5 | Named; the envelope and Fréchet–Stein carriers are missing. |

No further statable headline omission or substitute was found. The generic filtered completion remains a construction target, not a few-line predicate that could legitimately be inserted in Suggested.lean.

### Elaboration, binders and padding

The required `lake env lean` invocation on packages/LocallyAnalyticDistributionsPartII/Suggested.lean, from the content checkout using the absolute input path, exited 0. Its only diagnostics were the two expected “declaration uses sorry” warnings, at lines 78 and 98. Imported object files were already present; no build was needed. The header uses Mathlib and the two used individual TauCeti modules, with the module/public-import syntax supported by the pin.

I elaborated one scratch copy with `#check @` for all four declarations. Both definitions retain Fact p.Prime. The semisimplicity theorem retains p≠2, both module structures, IsScalarTower and FiniteDimensional. The Peter–Weyl theorem retains p≠2, m, k, Field K, both scalar algebras, the scalar tower and FiniteDimensional ℚ_p K. The elaborated types agree with §§0.2,3.8,5.2. All four local declaration names occur in the README; no additional backticked local API declaration is claimed.

Both sorried theorems were tested with closing probes for `simp`, `rfl` and `infer_instance`. None closed. The probe uses `solve | simp`, so merely simplifying an existential goal is not mistaken for a proof. The resulting scratch file elaborated with only its two sorry warnings and four requested signatures. The library near-matches were inspected: Maschke concerns finite-group monoid algebras; vector-space semisimplicity does not give Iwasawa-invariant complements; the native Burnside theorem requires an action and irreducibility and does not construct the completed action. There is no padding finding.

### Seeded source sample

All fifteen requested sample targets were checked against the cached legal texts, including the theorem labels, printed preprint pages, assumptions and proof steps used. The manifest contains fifteen distinct works, ten accessible and five settled as waived/uncertified. No new text was fetched or requested. Pages below refer to the cited versions, not PDF viewer indices.

| Target | Locator read | Outcome |
|---|---|---|
| 1.2 Crossed products | ST02 lines 514–526, Lemma 3.1 proof, p.13; AW13 lines 3317–3349, §10.6, p.72 | Right cosets versus left module bases are now distinguished. The normal case passes to a crossed product. MR01 remains waived. |
| 1.3 Centre | ST02 lines 635–644, Proposition 3.7, p.16 | Connected algebraic ambient group is required and retained. Reflection is a valid negative control. DG70 remains waived. |
| 2.4 Crossed Banach step | FU24 lines 822–875, Proposition 5.3, pp.17–18; KOH07 lines 665–705, pp.15–16 | r_n, odd p, maximum p^(n−1), basis size p^(nd) and central quotient all agree. |
| 3.3 S₀ | AW13 lines 3228–3234 and 3298–3306, §§10.4,10.6, pp.70–71 | Exact powers of gr p, not arbitrary nonzero symbols; unramified condition retained. |
| 3.4 Microlocal comparison | AW13 lines 3235–3282, §10.4 Theorem, pp.70–71, and 3317–3325, §10.6, p.72 | Strictness is proved here by the PBW degree computation; it survives R01's correction to the general theory. Coefficient supply needs R03. |
| 3.5 D_(1/p) | AW14 lines 609–666, §§5.1–5.2 Lemma, pp.13–14 | Norm and normalisation agree. The roadmap correctly changes the source's bounded series to null weighted coefficients. |
| 3.6 Ramified extension | AW13 lines 791–803, §3.9 Lemma(c), p.17; FU24 lines 686–699, (17)–(18), p.14 | Finite coefficient extension supports the statement as written in §3.6, with the deformation index multiplied by e. Its use outside that domain is R03. |
| 4.3 Strong duality | FU24 lines 792–806, Theorem 5.2 and (25)–(26), p.16; ST02 lines 675–678, p.17 | Transposing the specified action inserts S. The repair computes this rather than treating preservation of the centre as preservation of characters. |
| 4.4 Principal series | FU24 lines 768–791 and 811–817, pp.16–17 | B=TN and the triangular decomposition are part of the setting. The section construction gives f₀ with unit values; its differentiated character now includes S. |
| 4.5 Density and injection | FU24 lines 807–817, Theorem 5.2 proof, pp.16–17 | Multiplication by f₀ gives density. The added inversion argument transfers it to the dual character. |
| 4.6 Banach quotients | FU24 lines 879–930, Proposition 5.5 and (29), pp.18–19; ST03 lines 449–473, Proposition 3.7, pp.11–12 | The quotient inverse-limit theorem gives precisely the topological algebra comparison under the declared contract. |
| 4.10 Normal form | FU24 lines 1024–1042, proof of Theorem 5.1, p.21; its Lemma 3.3, pp.9–10 | Source leaves the normal-form exercise; the roadmap supplies bounded division. The weight is pⁿ on e,f,h, not p^(n−1). |
| 4.12 Integral highest weights | FU24 lines 160–169, Theorem 1.5 and following paragraph, pp.3–4; AW14 lines 447–474, §§4.5–4.6, pp.10–11 | The quadratic-root construction is a stated derivation from these results. Integral R-linear domain at depth zero is now correct. |
| 5.1 Algebraic functions | FU24 lines 1057–1100, §6, pp.21–22 | Coordinate relation, degree count and open-subgroup interpretation agree. |
| 5.2 Peter–Weyl | FU24 lines 1094–1115, §6 and (32), p.22; AW13 §§11.2–11.3, pp.80–81 | Matrix coefficient quotient and dimension agree. The corrected upper-unipotent right action is verified below. |

Additional repair passages read: KOH07 lines 222–227,357–365,665–705 for supported distributions; AW13 lines 2811–2840 and 3653–3730 for lattices, semisimplicity and Lie modules; ST03 lines 474–477 for restriction of coadmissibility; AB07 lines 612–629 for the Frobenius inverse; AW14 lines 453–458 and 728–751 for R02; BCGP25 lines 1112–1157 and SCHM13 lines 196–230 for envelope conventions. The settled inaccessible texts were not treated as newly missing.

### Computed adversarial table

This table covers the seeded sample, headlines, all repaired patterns and every finding. For unchanged material I also used the round-2 table's computed rows, not its blanket summaries. Additional rows here expose failures that those examples did not test. Computations are controls, not proofs of the deep theorems. The zero ring, equal-characteristic coefficients and noncompact ambient groups are outside the respective explicit hypotheses; p=2 is admitted by the two subgroup definitions but excluded by the odd-prime headline binders.

| Statement | Instances | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.1 Lazard normalisation | ℤ₃; G₁; trivial group | L_(3G)=3ℤ₃=3L_G; [3e,3f]=9h∈3L_G; trivial L=0 | Consistent; no change |
| §§0.2–0.3 congruence carriers | p=2,3,5; m=0 | −I has order 2 and reduces to I at 2; indices at 3,5 are 24,120; empty product size 1; log G₁=3sl₂ | Odd-prime premise discriminates |
| §1.1 derivative and convolution | f(z)=z²+3z; exp(3e),exp(3f) | Derivative 3 versus −3; products have diagonals (10,1) and (1,10); commutator of distributions is h̃ | Sign and order agree |
| §1.2 transversals | S₃, H=⟨(12)⟩ | Original representatives meet 3 left cosets but 2 right cosets: spans 6 versus 4; inverses meet 3 right cosets: span 6 | Previous R04 repaired |
| §1.2 cocycle | ℤ₃/3ℤ₃, lifts 0,1,2 | 2+2=3+1: δ₂δ₂=δ₃δ₁, not δ₁ | Twisting required and retained |
| §1.3 centre | O(2) reflection and SO(2) | sxs⁻¹=−x versus x; for sl₂, [Δ,e]=[Δ,f]=0 | Connectedness hypothesis correct |
| §2.1 PBW and completion | rank 0,1,3 | Basis sizes in degree ≤1 are 1,2,4; πⁿ coefficients tend to 0 while 1 does not | Native PBW consumed |
| §2.1 proper inclusion | h=Ru; h=0 | Σπⁿuⁿ has coefficients πⁿ in u, 1 in πu; rank zero gives K=K | Previous R15 repaired |
| §2.1 deformation base change | e=2,n=1 | πh base changes to a unit times (π′)²h′: en=2, not 1 | Correct here; R02 propagates it |
| §§2.2–2.3 Frommer rank | p=3,r=3^(−1/3) | Terms at degrees 1,3,9 have norms 3^(−1/3),1,1/3; ℓ=3 | Correct maximum |
| §2.3 supported closure | G=ℤ₃²; H=0,ℤ₃×0,G | Ranks over U_r are 1,3,9 respectively | Previous R02 repaired |
| §2.4 crossed radii | p=3,n=1,2; d=0,1 | log norms 1,3; norms of 3ⁿlog are both 1/3; basis ranks 1 or 3ⁿ | Exponential and rank agree |
| §2.5 envelope | rank-one abelian; zero Lie algebra | Coefficients must be null for every r≥1; exp coefficient norm rⁿ3^v₃(n!) is not null at r=1; rank zero gives K | Distinct from a single Banach step |
| §3.1 identity Ore set | ℤ_(3),ℤ₃ | A_S=A in both cases; both completions ℤ₃, only second equals A | Previous R11 repaired |
| §3.1 strictness | ℚ₃[x,x⁻¹], T=⟨X⟩ | deg_A(x⁻¹)=1; deg_Q(x⁻¹)=−1; F₋₁A=0 but x⁻¹∈F₋₁Q | False: R01 |
| §§3.2–3.3 symbol normalisation | 3+X², X+9 | Adic orders both 1; symbols P and X respectively; first is in S₀, second is not | Correct |
| §3.2 coefficient supplier | R=W(𝔽̄₃) versus ℤ₃ | Residue dimensions ∞ versus 1 over 𝔽₃; expected graded rings 𝔽̄₃[P,X] versus 𝔽₃[P,X] | Supplier only covers finite-free case: R03 |
| §3.3 exact-symbol set | G=1,R=ℤ₃ | 1,3,12∈S₀; 2,6,−1∉S₀; localisation is ℚ₃ in either saturation description | Previous R07 repaired |
| §3.3 ramification | π²=3 | 3∈m², so 0=3−3∈3+m² | Direct ramified Ore formula excluded |
| §3.4 comparison | rank 1 and 0 | b↦exp(3u)−1 has leading term 3u, norm 1/3; u=(1/3)log(1+b); rank zero R[1/3]=K | Correct scale and rationalisation |
| §3.5 null coefficients | d_j=3^(−j) | Weighted norms are 1, not →0; corresponding unit-radius coefficients are 1 | Bounded series correctly excluded |
| §3.6 finite base change | K=ℚ₃(√3); G=1 | Basis 1,√3; K⊗ℚ₃=K; span K[{1}]=K but closure of {1}={1} | Previous R16 repaired |
| §3.7 modules | 0,K,K[C₃] | Microlocal dimensions 0,1,1; distribution extensions 0,1,3; exp(9u)−1=9u times a unit | Exact but not faithful |
| §3.8 semisimplicity | m=0; zero module; abelian negative control | Scalar algebra K and zero module are semisimple; on K² with γ=1+N, N²=0≠N, invariant line has no invariant complement | Actual nonabelian hypothesis matters |
| §§3.8–3.9 stable lattices | PGL₃ at 3; standard module | q eigenvalues 1/3,1/3,−2/3; det valuation −3; 1−3q=diag(0,0,3); 3q integral | Previous R03 repaired |
| §3.8 indices | factor counts m=0,1,2, depth a=0 | a+1=1 in all cases, rather than m+1=1,2,3 | Previous R14 repaired |
| §3.9 native action | W=K,K² | Trivial action 1; exp(3e) acts by [[1,3],[0,1]]=I+3e | Completed and algebraic actions agree |
| §3.10 quotient | W=K²; M=A,0,W^t | End dimension 4; zero quotient 0; both W^t quotients dimension 2t | Stable-lattice hypotheses retained |
| §4.1 Casimir | k=0,1,2 | Eigenvalues 0,3/2,4; Killing Casimir Ω=Δ/4 | Scalar normalisation correct |
| §4.1 unit ideal | r=3^(−2/3),λ=1/3 | Norm Δ≤3^(2/3)<3=norm λ; Δ−λ invertible; quotient 0 | Nonintegral negative control correct |
| §4.2 square criterion | p=3,5 and λ=1; c=0,2 | 2λ+1=3: odd 3-adic valuation, nonsquare mod 5; c=0,2 gives λ=0,4 and squares 1,9 | Both directions discriminate |
| §4.2 pointwise antipode | trivial torus; SL₃ weight (1,1,−2) | X(0)=−X(0)=0; cubic values −6 and 6; SΔ=Δ | Previous R06 repaired |
| §4.3 duality | torus f(g)=g, ν(x)=−1 | (x̃+δ₁)(f)=2; (x̃−δ₁)(f)=0; λ=ν∘S has λ(x)=1 | Previous R01 repaired |
| §4.4 eigenfunction | χ(t)=t at 3; χ=1 | f₀(4)=4, norm 1; constant function fails 1=4; trivial χ gives f₀=1 | Correct nonvanishing requirement |
| §4.5 density/inversion | torus t and t⁻¹ | Left eigenvalues −1 and +1; inversion preserves sup norm; multiplication by f₀ preserves approximation error | Dual-character density established |
| §4.6 inverse limit | m=0; zero/unit ideal | lim K=K; lim 0=0; quotient by zero gives original D | No spurious nonzero quotient |
| §§4.7–4.8 domains | p=3, r=3^(−1/√2) | 1>1/√2>1/2; ρ=3^(1−1/√2)>1; determinant of quadratic symbol matrix −1/2≠0 | Irrational radius uses bounded division |
| §4.8 normal form | λ=0; ρ=1 and ρ>1 | h²=2h−4ef; RHS weights ≤ρ²; rank-zero quotient K | Correct bound and endpoint |
| §4.9 Frobenius inverse | ℚ[u]/(u²−2) | α(f)=u/2; β(u/2)(u)=1, β(u/2)(1)=0; old value was 1/2 | Previous R05 repaired |
| §4.9 grade | zero module; T=R=field | Both zero-module grades ∞; both regular-module grades 0, Ext⁰=R | Compatible conventions |
| §4.10 weighted normal form | n=1; d_j=3^(2j) | Weighted terms 3^(−j)→0; target weight-one terms 3^(−2j)→0; c_j∈{0,1} | Correct injection direction |
| §4.11 graded intersection | p=3,n=1,m=0,1,2 | Relations q_i³ in disjoint 3-variable blocks; codimensions 0,1,2; dimensions 0,2,4 over graded coefficients | Previous R12 repaired |
| §4.12 integral parameters | λ=1,−1/2; m=0 | a=−1+√3 gives 1; a=−1 gives −1/2; empty extension degree 1=2⁰; a(√3h)=3−√3 | Previous R17 repaired |
| §4.13 ramified index | π²=3,n=1,λ(3h)=1 | λ(πh)=π⁻¹; unit 1−3h would act by 0; corrected index en=2 | False carrier specification: R02 |
| §4.13 nonfinite coefficients | K=completed ℚ₃^nr,n=0 | [K:ℚ₃]=∞, e=1; completed Lie algebra still has rank 3 over R | §3.6 cannot be applied: R03 |
| §4.14 end theorem | p=3,λ=1; m=0 | Quadratic extension degree 2 and integral a; n=0 remains en=0; m=0 map is identity ℚ₃→ℚ₃ | Endpoint route survives R02 |
| §5.1 degree filtration | degrees 0,1,2; ±I | Graded-piece dimensions 1,4,10−1=9; filtered-piece dimensions 1,5,14; x−w vanishes at ±I but is not zero in K[SL₂] | Open subgroup hypothesis needed |
| §5.2 Peter–Weyl | k=0,1,2; m=0; (k₁,k₂)=(1,2) | End dimensions 1,4,9; empty tensor End dimension 1; two-factor dimension (2·3)²=36 | New Lean headline has intended scope |
| §5.2 action prescription | k=1, p=3 | I, I+3E₁₂, I+3E₂₁, diag(4,1/4) span dimension 4; trivial-action span has dimension 1 | Arbitrary-action stand-in excluded |
| §5.2 left/right convention | lower-left and upper-right translation | (n_lower⁻¹g)₁₁=x and (gn_upper)₁₁=x; (gn_lower)₁₁=x+ay | Source correction correct |
| General FS restriction gap | B=A⟨T⟩ versus A² over A=ℚ_p | B-rank 1 in both; A-dimensions ∞ and 2 | Repaired coadmissibility condition excludes first |

### Pins, duplication and suppliers

The pins inspected are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. A separate scratch compilation resolved 46 native names covering both library contracts and completed-group-algebra group elements, without errors. Representative declaration bodies and hypotheses opened at these pins are recorded here:

| Object | File and line at the pin | Evidence and limit |
|---|---|---|
| Enveloping algebra, lift and sl₂ | Mathlib/Algebra/Lie/UniversalEnveloping.lean:80,92; Mathlib/Algebra/Lie/Classical.lean:92; Mathlib/Algebra/Lie/Sl2.lean:38 | Native Lie map and universal lift; trace-zero Lie algebra and triple laws. |
| Congruence subgroup ingredients | Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225; Mathlib/NumberTheory/Padics/RingHoms.lean:301; Mathlib/Algebra/Group/Subgroup/Basic.lean:172 | Ring-map reduction and coordinatewise subgroup. CongruenceSubgroups.lean:42,80,132 concerns SL₂(ℤ), not SL₂(ℤ_p). |
| Completed group algebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145,252 | Compatible inverse-limit families; `of` maps to quotient group basis elements. General carrier does not assume compact coefficients. |
| Compact action | TauCeti/Topology/Algebra/Module/Compact.lean:294; TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:251,322 | Compact-module predicate contains four displayed topological conditions; it does not itself add a separate T2 field. Action theorem has its additional ambient topology/action hypotheses. Actual ℤ_p lattices satisfy them. |
| PBW | TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75; Basis.lean:96,175; Injective.lean:213 | Basis over arbitrary commutative ring with a chosen Lie basis; associated-graded equivalence for a free Lie algebra. No field-only limitation. |
| Casimir | TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:125,175 | Killing-dual basis normalisation and centrality; package uses Δ=4Ω. |
| Symmetric-power action | TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57; Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369 | `symPowerRep` acts on native symmetric powers; `toGL` preserves the given SL matrix. |
| Completion limitation | Mathlib/RingTheory/AdicCompletion/Algebra.lean:40,97 | Ring instance has commutative input; it is not the required noncommutative enveloping completion. |
| Closure, Ore and flatness | Mathlib/Topology/Algebra/Algebra.lean:263; Mathlib/GroupTheory/OreLocalization/OreSet.lean:52; Mathlib/RingTheory/Flat/Basic.lean:114; FaithfullyFlat/Basic.lean:64 | Native closure/Ore/flatness predicates, not the microlocal completion theorem. |
| Semisimplicity near-matches | Mathlib/RingTheory/SimpleModule/Basic.lean:66; Mathlib/RepresentationTheory/Maschke.lean:165 | Complemented submodule lattice; Maschke has finite-group hypotheses and a different ring. |
| Density near-match | Mathlib/RingTheory/SimpleModule/Basic.lean:573; TauCeti/RepresentationTheory/Irreducible.lean:242 | Jacobson density and algebraically closed Burnside; neither supplies an Iwasawa action on the symmetric-power lattice. |
| Same short theorem name | TauCeti/QuantumGroups/UqSl2/CompleteReducibility.lean:300 | Quantum sl₂ over ℂ at generic q, not the package's fully qualified theorem or its algebra. |

Object searches covered the pins, main, board packages and configured open heads: completed algebras/actions, PBW, Casimirs, symmetric powers, Frommer closures, microlocalisation, Arens–Michael envelopes, central quotients and Peter–Weyl. I read the board package index before drawing ownership conclusions. The generic microlocal completion and p-adic algebraic Peter–Weyl target have no second owner in the accessible search results. CompactGroups/CompactGroupsPartII's complex Hilbert-space Peter–Weyl theory is a different object. The generic finite-crossed-product Ext theorem extends the Iwasawa-specific comparison of NoncommutativeAndEquivariantIwasawa §F.1; it does not rebuild its Iwasawa application.

Every cross-roadmap section was resolved anew. The following readable heads/main files were checked, not remembered from round 2:

| Supplier or overlap candidate | Resolved sections and ownership |
|---|---|
| PadicLocalLanglandsForGL2Qp, #1312 | TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205–239, §0.1: common analytic spaces, convolution order, distribution duality, Fréchet–Stein theory and Schikhof duality. Its reuse table at :2424 explains the AnalyticSupport aliases and operation names. |
| NoncommutativeAndEquivariantIwasawa, #1307 | TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:150,177,209,271,303,333,378,435,590: §§0.1–0.3,0.5–0.8,F.1,0.13a. Left/right cosets and the Lazard sign agree. R03 records the coefficient-domain limitation. |
| LocallyAnalyticDistributions, #854 | TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891,1048,1081,1344: §§0.0–0.3 give locally convex operations, Amice, Hahn–Banach/open mapping and chart/dual comparisons. The discrete-coefficient common objects are explicitly those of PadicLocalLanglandsForGL2Qp. |
| PadicMeasuresIwasawaAlgebras, main | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:398,657,909: Layer 0, §§1.2,1.7. Measures use multiplication xy; countable quotient towers suffice for compact p-adic analytic groups. |
| LieHighestWeight, main | TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,405,567,931: Layers 0,3,5,7. Ordered PBW is now consumed natively; complete reducibility, Verma modules and the raw HC projection retain the package's normalisation. |
| CompletedCohomologyPartII, #1035 | TauCetiRoadmap/CompletedCohomologyPartII/README.md:7–23: tower cohomology, arithmetic modules and dimension bounds, not the completed enveloping or algebraic-function constructions here. |
| GlobalGaloisDeformationsPartII, #1837 | TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md, Scope and ownership: deformation rings, Selmer conditions and automorphic deformation comparisons; no competing microlocal or distribution ownership found. |

The supplied overlap report has no conflicting head, dropped cited id, revision-only id or dropped local id. Its five vocabulary-near heads were read as above. The citation resolver reports no cross-roadmap citation or Lean name found nowhere; it explicitly does not inspect the pinned libraries on its own host, which is why I ran the independent native checks locally. Unprovided open-head files were not guessed or fetched outside the configured roadmap tools.

Both declared gaps have matching slugs, supplier and section in design/plan.json and README:55,57: `frechet-stein-general` and `radius-algebras`. The former now includes ST03 Lemma 3.8's coadmissibility hypothesis; the latter retains HYP and the rational-power radius range for the Fréchet–Stein stages. They request the missing general theory/coordinate presentation from its existing owner, not an unowned replacement. Their declared status is not a finding and R03 is distinct from them.

The required dependency command returned:

```text
depcheck: 237 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order or tooling file was edited. Within the package, §4.7's reference forward to §4.8 is acyclic: §4.8 needs §§2.1,4.1, not §4.7; Layer 5 consumes the module comparisons of Layer 3. The mechanical check does not certify the supplier generality addressed by R03.

## Not verifiable

- SCH11 is settled as uncertified/paywalled. Its Theorem 28.3 and cited lattice/coordinate locators were not read in the original book; accessible AW13 and supplier statements were compared. No new request was made.
- FROM03, DDMS99, MR01 and DG70 remain waived. Their original proofs were not available. KOH07 supplies the accessible Frommer theorem and supported-distribution corollary; AW13/AB07/ST02 expose the relevant uses of the other texts.
- Ownership against open pull requests without a readable head supplied by the configured tools was not independently checked. No finding asserts absence on the basis of an unavailable file.
- Elaboration and one-tactic probes do not prove the deep headline theorems. Their truth assessment uses the source hypotheses and computations above; full formal proofs were not attempted.

## Source issues

- **Misprint** in FU24 at §4, equation (16), printed page 14: the source says the completion has bounded weighted coefficients; it should require weighted coefficients tending to zero; affects nothing.
- **Gap** in FU24 at Theorem 4.2, printed page 14: the source says all real radii give noetherian Banach algebras by ST03; it should supply an irrational-radius proof or restrict that assertion; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed page 14: the source says the same Ore set works over ramified coefficients; it should start unramified and extend coefficients; affects the proof.
- **Error** in FU24 at Theorem 5.7, printed page 20: the source says every central parameter gives a domain; it should exclude parameters making the quotient zero, including the displayed nonintegral control; affects a stated result.
- **Gap** in FU24 at proof of Theorem 5.7, printed page 20: the source says the weaker-norm quotient has the asserted graded ring; it should establish separatedness of the induced quotient filtration; affects the proof.
- **Error** in FU24 at Remark 5.8, printed pages 20–21: the source says integrality characterises induced parameters; it should require 2λ+1 to be a square in ℤ_p; affects a stated result.
- **Misprint** in FU24 at §6, printed page 22: the source says the right stabiliser of x^k is a lower upper triangular subgroup; it should specify the upper unipotent subgroup; affects nothing.
- **Error** in FU24 at §5 before Theorem 5.2, printed page 16: the source says induction has character dχ composed with HC; it should include the antipode with the specified left-translation convention; affects a stated result.
- **Error** in FU24 at Theorem 5.2, printed page 16: the source says the natural dual uses the same central character; it should use the antipode-twisted character under this convention; affects a stated result.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 14: the source says the radius-one-over-p completion has bounded weighted coefficients; it should require null weighted coefficients; affects nothing.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 15: the source says distributions on G surject onto distributions on the underlying ℚ_p-analytic group; it should reverse that arrow; affects the proof.
- **Misprint** in AW14 at §5.4 Theorem, printed page 16: the source says a character on pⁿt uses the earlier deformation indexed n; it should use index en under the π-adic convention, e=v_π(p); affects a stated result.
- **Misprint** in BCGP25 at Definition 2.2.31, printed page 24: the source says the stage tensor puts a left module before its extending algebra; it should put the extending algebra first; affects nothing.
- **Error** in AB07 at §5.4 Lemma proof, printed page 17: the source says the Frobenius inverse extracts only the inverse-index coefficient; it should extract the identity coefficient of tx, including the cocycle; affects the proof.
- **Misprint** in AB07 at §5.4 Corollary, printed page 17: the source says R=T∗G while calling R the base; it should say T=R∗G; affects nothing.
- **Misprint** in AW13 at §11.1 Theorem(b) proof, printed page 80: the source says V→RLV is the counit and LRW→W the unit; it should interchange those names; affects nothing.
- **Misprint** in AW13 at §11.1 Theorem(b) proof, printed page 80: the source says restriction from U₀-modules is Hom_KG(U₀,−); it should say restriction of scalars, equivalently Hom_U₀(U₀,−); affects the proof.
- **Error** in SCHM13 at Proposition 3.2.1 proof, printed page 6: the source says every radius above one works for every basis; it should require radii dominating bracket coefficients, or an integral Lie lattice; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3cb5b73fec2d8ca01e5fd33a91da4949d1f6a47d", "job": "REV-PKG-LocallyAnalyticDistributionsPartII~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
