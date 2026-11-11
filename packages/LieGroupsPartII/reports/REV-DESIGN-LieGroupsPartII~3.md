# Review of LieGroupsPartII (design, round 3)

**Verdict:** needs changes

Five findings: three P2 and two P3; three blocking. The Part II scope is repairable. I read all 31 numbered README sections, all 40 plan targets and their 139 Checks, the previous review and repair report, the supplied indexes, the relevant current suppliers and pinned declarations. The 15 seeded targets were revisited. No design, plan or manifest entry was changed. Only the review deliverables were written.

## Previous findings, checked individually

Identifiers in this table refer to round 2. None was marked “not actionable in this package”; no settled exception is reopened. The prior adversarial table contains computed values for all numbered sections; unchanged material was checked against those values, rather than against its prose assurances. Changed passages and the seeded targets were independently recomputed below.

| Previous finding | Repaired passage and verification | Status |
| --- | --- | --- |
| R01, obsolete base contract | README:141 now retains “every field of `C`, including its finite central matrix-cover model”; :300–319 supplies exact roots, Nplus, inequalities, closedness, coverage and central lineality. These match LieGroups Suggested.lean:484–588. SU(2)'s collision and the circle's period now exclude the base datum too. Native naturality/faithfulness resolve at the pin. | Repaired. |
| R02, conjugating forms | README:290 says “This does not identify `B` with `B'` or arbitrary matrix-model choices.” On ℝ^×, conjugation preserves B(1,1)=1, whereas B′(1,1)=2; θ and the Iwasawa choices agree with g=1. Transport of the model is explicitly specified at :149. | Repaired. |
| R03, disconnected split centre | README:610 says “Multiplication `⁰L × lieExp(F) → L` is an isomorphism of Lie groups.” For inversion on ℝ, F=0 and ⁰L=L; for swapping on ℝ², F is diagonal and the character kernel has antidiagonal Lie algebra. The §6.3 specialization explicitly obtains trivial component action from §3.1. | Repaired. |
| R04, limit outside G | README:770 adds “`exp(tX) G exp(−tX) = G` for every real `t`”; :777 uses it before closedness. The rotated SL₂(ℤ) example has limit outside G and fails this hypothesis, whereas SL₂(ℝ), X=diag(1,0), satisfies it. | Repaired for factorization. The separate plan transpose APIs still omit hypotheses: new R01. |
| R05, duplicate polar/maximal-abelian construction | README:746 says “Use LieGroups Layer 9 with the identity covering”; :240 imports maximal-abelian conjugacy/exhaustion. Plan targets 2.2 and 8.3e are absent, with their dependencies replaced. | Repaired locally. The same ownership pattern remains for the quotient/reflections in §2.3: new R02. |
| R06, backward ownership transfer | README:840 says “Use AutomorphicFormsOnReductiveGroups §2.3a's maximal split torus … and minimal-parabolic comparison”. Open #1037:378 supplies the strict-chamber case; it does not supply all walls. README:41 and :883–888 no longer make that earlier roadmap or NoncompactQuantumSymmetry consumers. | Repaired. Keeping the additional wall case is justified. |
| R07, dynamic Check exceeding its normalizer | README:731 now gives “`Q(X₀) = Q_∅ ⊋ P`” and “`Q(X₁) = P ⊊ Q_∅`”. For τ=σAd(w₀), τX₀=X₀ and τX₁=(4,−1,−3)≠(3,1,−4). Both satisfy Q(X)⊆Q_∅. | Repaired. |
| R08, zero root vector | README:62 now says “For `Y ≠ 0`”; :730 distinguishes I from I+e^tE₂₁ and I+e^(−t)E₁₂. Both iff statements exclude the zero-vector counterexample. | Repaired. |
| R09, zero-weight roots in U | README:848 says “Only its strictly positive-weight factor `N_{Π'}` lies in `𝐔_𝐇(λ)(ℝ)`”. At λ=0 in SL₂, N_Π=U(0)=1 while I+E₁₂∈N⊆P(0)=G. | Repaired. |
| R10, vague gap needs | Both plan needs sentences now quantify the groups, fields and subgroup and state the mathematical conclusion; README:111–112 uses the same slugs and hypotheses. Borel–Tits 5.9 and 9.3 support the requested inputs. | Repaired. |
| R11, small-rank bounds | README:493 explicitly separates GL₀ from `glTitsSystem ℝ (n−1)`; :620 handles the GL₀ denominator; :902 separates SO₀(1,1). The remaining unrestricted O(p,p) and plan matrix-unit/sign Checks still fail at zero. | Partly repaired: new R05. |
| R12, only two minimal-parabolic Checks | README:417 adds “The tilted `ℝ × S¹` data … `P = G`”. There are now three Checks; the new one gives equal P with different split-central lines and different involutions. | Repaired. |

## R01 (P2) — The plan's transpose APIs omit symmetry and subgroup stability

**Location.** `packages/LieGroupsPartII/design/plan.json:1442`: “θ maps dynamicParabolic G X onto dynamicParabolic G (−X)”; :1550: “θ-stable when X is symmetric”. The enclosing targets 8.2 and 8.2c quantify arbitrary matrix X and arbitrary subgroup G. README §8.2's theorem retains the needed symmetry and transpose-stability hypotheses.

**Claim.** These transport statements hold at the wider definition generality recorded by the plan.

**Witness.** Take G=GL₂(ℝ), X=[[1,1],[0,0]], g=I+X. Then Xg=gX. With S=[[1,−1],[0,1]], S⁻¹θ(g)S=[[0,1],[−1/2,3/2]]; its −X-orbit has upper entry e^t, hence is unbounded.

Thus g lies in dynamicParabolic G X but θ(g) does not lie in dynamicParabolic G (−X). Independently, for G={I+tE₁₂} and symmetric X=0, dynamicLevi G X=G, but θ(I+E₁₂)=I−E₂₁∉G.

**Exact repair.** Keep the definitions on arbitrary G,X. State the general ambient transport identities with transformed subgroup and matrix: θ(dynamicParabolic G X)=dynamicParabolic (θG) (−Xᵀ) and θ(dynamicLevi G X)=dynamicLevi (θG) Xᵀ. Specialize to the existing same-G, ±X formulas only when G is transpose-stable and X is symmetric. Carry those hypotheses into both API bullets and add these two negative controls to the plan and README. No finite-component or Lie-algebra-membership hypothesis is needed for these identities.

**Repair test.** The first witness's θ(g) commutes with Xᵀ, so its corrected −Xᵀ orbit is constant. The second witness is transported to the lower-unitriangular θG, which contains I−E₂₁. For symmetric diag(1,0) in GL₂, upper and lower groups are interchanged as intended. Exact rational multiplication verifies S⁻¹XS=diag(1,0) and the displayed matrix.

## R02 (P2) — Section 2.3 still reconstructs base-owned Weyl data

**Location.** `packages/LieGroupsPartII/design/README.md:249`: “define `W_G = N_K(𝔞)/Z_K(𝔞)`”; :252 gives reflection representatives as new assertions, and :258 assigns their construction to integrated sl₂-triples. The same definition/construction is target 2.3 in `packages/LieGroupsPartII/design/plan.json:238`.

**Claim.** This roadmap owns construction of the actual normalizer quotient and its restricted-reflection representatives.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1354–1360` on main already owns the actual quotient N_K(a)/Z_K(a), its compact normalizer representatives realizing restricted reflections, and chamber coverage, on the same full global-model carrier.

**Exact repair.** Import that quotient and the supplied reflection realization by LieGroups Layer 9 in Scope and the exact contract. Retain §2.3's additional comparison of the connected quotient with W(Σ), normality inside W_G, and the G-normalizer/centralizer formulas. If the explicit exponential formula for a prescribed root vector is a genuinely stronger variant, identify that additional conclusion in one clause and prove only that variant; do not reconstruct the supplied quotient or existence of representatives. Update target 2.3's ownership/API and downstream needs accordingly. Remove :268's obsolete assertion that the base README identifies W_G with W(Σ) without hypotheses: the current base explicitly uses the actual quotient.

**Repair test.** For SL₂ both imported and reconstructed quotients have order 2 and the quarter-turn acts by −1. For O(1,1), the imported actual quotient has order 2 while W(Σ)=1; §2.3's new comparison/component discussion retains this distinction. Importing the base object loses no disconnected generality. This is a remaining duplicate object, not rejection of the Part II's scope.

## R03 (P2) — The ReductiveGroups contract drops its split hypotheses

**Location.** `packages/LieGroupsPartII/design/README.md:110`: “the Bruhat decomposition and Tits system of `𝐇(k)`”, in a contract for connected reductive groups over a field. The same broad attribution occurs at :29 and in the plan's ReductiveGroups supplier description.

**Claim.** ReductiveGroups Layer 7 supplies this rational-point result in the full nonsplit generality of the contract.

**Witness.** `TauCetiRoadmap/ReductiveGroups/README.md:2934–2946` on main explicitly assumes a split maximal torus T and a Borel B⊇T; its stated Tits theorem has subgroupB=B(k). The relative-root paragraph at :2929 supplies no broader Tits theorem.

**Exact repair.** Qualify this supplier item with its actual split-maximal-torus/Borel hypotheses, or remove the unused Bruhat/Tits item from this contract. Keep the general relative-root and cocharacter-parabolic inputs, which the supplier does own. Layer 9 does not require a supplied nonsplit rational Tits theorem: this roadmap already constructs its analytic one. Do not add a new gap for an unused stronger import.

**Repair test.** For split GL₂ over ℝ, T is diagonal, B is upper triangular and the two Bruhat cells are B and {g₂₁≠0}, so the corrected supplier applies. For the anisotropic real group SU(2), the maximal real split torus has dimension 0 whereas a maximal geometric torus has dimension 1; there is no real Borel. The quoted supplier theorem cannot instantiate there. The analytic conclusion remains covered here by compact G: P=G and W=1.

## R04 (P3) — Several target blocks omit their local dependency or source locator

**Location.** `packages/LieGroupsPartII/design/README.md:216–236` (§2.1), :360–381 (§3.2), :409–417 (§3.4), and :510–530 (§5.1). Representative: “For an Iwasawa triple and `Π' ⊆ Π` define”.

**Claim.** Every retained target carries its own needs and every mathematical claim a locator.

**Witness.** Sections 2.1, 3.2 and 5.1 have no `*Needs:*` line; §§3.2, 3.4 and 5.1 have no source locator. Their plan entries have prerequisites/locators, which are not displayed in these README target blocks.

**Exact repair.** Add target-local needs to §2.1 (native root-pairing/base/Weyl/chamber declarations), §3.2 (§§2.3,2.6 and the Lie-subgroup/exponential inputs), and §5.1 (§2.1 and base Layer 9 root spaces). Add the existing manifest locators to §§3.2 and 3.4, and cite Brown–Rodriguez Hertz–Wang §1.2 equation (1), pp.3–4, for §5.1's root-sum formula; identify the reductive extension through the supplied root decomposition and §1.1. Do not invent book page numbers for the settled unread books.

**Repair test.** In GL₂ the §3.2 factors −I, diag(2,1/2), I−(3/2)E₁₂ multiply to [[−2,3],[0,−1/2]]. For §5.1 in sl₃, the four subsets give dimensions 5,6,6,8; the added inputs supply exactly these root-space constructions. The roadmap's order is unchanged, with no new upward edge.

## R05 (P3) — Rank-zero qualifications still fail in repeated Checks

**Location.** `packages/LieGroupsPartII/design/README.md:813`: “`O(p, p)` (fails)”; `packages/LieGroupsPartII/design/plan.json:1660` uses “diag(−1,1,…,1)” without n≥1, and :1908 uses E₁₁ without that bound.

**Claim.** The component condition fails for every O(p,p), and the displayed sign-matrix/matrix-unit witnesses exist for every n.

**Witness.** At p=0, O(0,0)=1, a=0, M=G, and its sole component meets M. At n=0, GL₀ has determinant 1 and no E₁₁ or determinant-negative component.

**Exact repair.** Write p≥1 on O(p,p)'s failure claim, including repeated plan wording, and give O(0,0)=1 as the true boundary case. Put n≥1 on the sign and E₁₁ witnesses in targets 8.3 and 9.1; at n=0 record the single component and trivial adjoint action without a matrix unit. Preserve the already-correct GL₀, SO₀(1,1) and n−1 exceptions elsewhere.

**Repair test.** For p=q=1, M meets 2 of 4 components, so failure remains. For p=q=0 it meets 1 of 1, so the condition holds. GL₁ has the negative point −1 and the genuine 1×1 E₁₁; GL₀ has one point and the zero tangent algebra. This completes, rather than reverses, round 2 R11's repair.

## Verified sound

### Coverage and principles

The review covered 9 layers, 31 numbered sections, 40 plan targets and 139 plan Checks. The prior table's computed rows were available for the unchanged targets; I read their current statements, tested the changed passages, and independently revisited all 15 sampled targets. The table below records the seeded targets, headlines, repairs and every target touched by a finding. It does not claim that examples prove the general theorems.

The general Lie-group scope retains finite central covers, disconnected component actions, nonreduced roots and all ranks. No good-prime or route-specific replacement was found. The global matrix model is the base carrier, not a new conclusion assumed as a field. The parabolic and character-kernel results are real extensions. The remaining duplicated quotient/reflection object is R02. The minimal algebraic comparison is now genuinely imported from #1037; the chamber-wall comparison is additional work.

The 9 layers have mathematical names, not source chapter names. Their order is accounted for by explicit mathematical uses: positive roots/Iwasawa → MAN → Bruhat/Tits → group parabolics; root sums → eigenspaces → Langlands; these then feed general parabolics/dynamics and the matrix/algebraic comparisons. No claim to follow a source's organization was found. All 9 layers end with Examples and Dependencies. The missing local needs/locators are R04. The plan's 15 definition targets each have at least three Checks; the paired README definitions retain their mathematical APIs and grouped Checks. Section 3.4 now has three as well. Inline recalled terminology in theorem §1.2 is not a separate new carrier.

No computational algorithm target, source passage copied verbatim, prohibited supplier, local machine path, PR number, HTML anchor, set_option or sorry'd data was found in the design. Gram–Schmidt is only the identification of the existing GL example. There are no maintainer notes to refute or uphold. The exact-source limitations below prevent certification of the unread book locators, not a repeated source request.

### Computed adversarial table

Here θ denotes transpose-inverse in matrix examples. Dimensions are real unless indicated otherwise. Each row states actual values; “retain” means no mathematical repair is requested for that row, subject to the separately listed ownership/source issues.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Standing group/datum conventions | GL₀, GL₂ | GL₀: G=K=1, Lie=0. GL₂: dim Lie=4=1+3=dim k+dim p. | Retain full base hypotheses. |
| Root sign and flow iff | X=diag(1,0), Y=0,E₁₂,E₂₁ | [X,E₁₂]=E₁₂; [X,E₂₁]=−E₂₁. Flows I, I+e^(−t)E₁₂→I, I+e^tE₂₁ unbounded. | Nonzero-Y qualification repaired. |
| MAN multiplication convention; §§3.2–3.3 | SL₂, [[−2,3],[0,−1/2]] | (−I)diag(2,1/2)(I−3E₁₂/2) has entries −2,3,0,−1/2. Opposite factor order needs a different unipotent coefficient. | Retain; R04 adds local inputs. |
| Algebraic/analytic dynamic sign | GL₂, λ(t)=diag(t,1) | Conjugation gives upper tb and lower t⁻¹c; with t=e^(−s), upper e^(−s)b and lower e^s c. Both require c=0. | Retain. |
| §1.1 form definition/adjoints | GL₂ H=diag(1,−1), J=[[0,1],[−1,0]] | tr(H²)=2; tr(J²)=−2; Bθ(H,H)=Bθ(J,J)=2. ad H has eigenvalues 0,2,−2. Opposite B gives −2. | Adjoint/sign API passes. |
| §1.1 base datum negative controls | SU₂ nontrivial θ; circle inversion | exp(πJ)=−I: polar(1,πJ)=polar(−I,0). Circle exp(1)=exp(0)=0. | Both fail full base model; repaired. |
| §1.1 transport | GL₂ and arbitrary model π | Transported π′(gkg⁻¹)=π(k); B(Ad(g⁻¹)Ad(g)H,Ad(g⁻¹)Ad(g)H)=2. | Model transport and invariant B agree. |
| §1.2 semisimple conjugacy | sl₂ g=diag(2,1/2); su₂; zero algebra | σ′σ on E₁₂ multiplies by 16=exp(2ad diag(log2,−log2)); compact and zero cases have p=0, X=0. | Factor 2, uniqueness and degeneration pass. |
| §1.3 underlying involution conjugacy | ℝ^× scaled forms; tilted ℝ×S¹ | θ=θ′ and split line=ℝ, but B(1,1)=1≠2. At (1/8,0), θ₀=(−1/8,0), θ₁=(−1/8,−1/4 mod ℤ). | Equal split centre works; arbitrary forms/different lines cannot be identified. |
| §1.3 component cocycle | ℝ⋊C₂ | c_bθ₀c_b⁻¹(t,1)=(−t+4b,1); b=a/4 gives θ_a; K_a's reflection has translation a/2. | Central correction is necessary and has correct sign. |
| §2.1 positives, simple roots, subsystem API | BC₁, BC₂, A₂, empty system | BC₁ indivisible ±λ, positives λ,2λ, simple λ; BC₂ subsystem on e₂ has ±e₂,±2e₂ and W order 8; A₂ has 6 chambers and wall stabilizer order 2; empty system has 1 positive system and W=1. | Nonreduced route passes; R04 adds needs. |
| §2.2 supplied maximal-abelian geometry | GL₂; compact G | Symmetric space dim 3, maximal commuting plane span(I,E₁₂+E₂₁) dim 2; rotation π/4 sends it to diagonal plane dim 2. Compact p=a=0. | Correctly imported. |
| §2.3 actual/root Weyl groups | SL₂; O(1,1); GL₁ | Orders (W_G,WΣ)=(2,2),(2,1),(1,1); quarter-turn sends H to −H; O reflection sends Y to −Y despite empty roots. | New comparison sound; import base object per R02. |
| §2.4 component condition | GL₂, O(1,1), Aut(sl₃), compact O₄ | M meets 2/2, 2/4, 1/2, 2/2 components respectively; root/geometric Weyl orders 2/2,1/2,6/12,1/1. | Condition distinguishes intended cases; compact O₄ separates it from axiom (v). |
| §2.5 Iwasawa-choice conjugacy | ℝ^× with B,2B; SL₃ | g=1 preserves θ,a,∅ despite form values 1 and 2. Six permutations carry the six A₂ positive systems. | Form-independent statement repaired. |
| §2.6 exact-root/Nplus adapter | SL₂, compact G | SL₂ roots ±α with α(H)=2, root dimensions 1,1; canonical N=Nplus upper unipotent. Lie complement 1+1+1=3; both-root counterfeit gives 1+1+2=4 and intersects k in dim 1. Compact roots empty, N=Nplus=1. | Matches actual base fields. |
| §2.6 chamber laws | GL₂, SL₂ | h₁≥h₂ contains ±I; swap sends (0,1) to (1,0), root value 1. In SL₂, closed ray spans dim 1; t=1/j→0 stays in closed ray, open ray omits 0. | Coverage, closedness and central lineality pass. |
| §3.1 centralizer datum | GL₃, s=ℝdiag(1,1,−2), 0, a | L=GL₂×GL₁, G, diagonal; dimensions 5,9,3 and roots ±α₁, all A₂, empty respectively. | Restricted form/model and root formula pass. |
| §3.2 M and N definitions | SL₂; SL₂(ℂ); compact G | M={±I}, N dim 1; M=U(1), N dim 2; compact M=P=G,A=N=1. Replacing M by M⁰ loses −I in SL₂. | Definitions discriminate; R04 adds locator/needs. |
| §3.3 orthogonal recovery | gl₂ upper algebra | Lie P dim 3, B-orthogonal ℝE₁₂ dim 1, nilradical ℝI+ℝE₁₂ dim 2. | Correct orthogonal, not nilradical. |
| §3.3 compact quotient and normalizer | SO₀(2,1), SO₀(1,1), O(1,1) | Quotients S¹, point, two points; O has N_G(P)=G and [G:P]=2 although roots empty. | Component and rank restrictions retained. |
| §3.4 minimal parabolic class | SL₂; tilted ℝ×S¹ | Stabilizers parametrized by ℙ¹; tilted data all have P=G while lines slopes 0 and 1 differ. | Third Check repaired; R04 adds source. |
| §4.1 flow fixed points | SL₂, SL₃, O(1,1) | 2 eigenlines, 6 coordinate flags, 2 discrete fixed cosets; the last root Weyl group has only 1 element. | Actual W_G count retained. |
| §4.2 Bruhat and dimensions | SL₃, SU(2,1), O(1,1), Aut(sl₃) | Inversion numbers 0,1,1,2,2,3 give dims 5,6,6,7,7,8; SU big cell 5+2+1=8; O two dim-1 open cells; Aut 12 cells, 2 open. | Disconnected extension and multiplicities pass. |
| §4.3 Tits system | GL₀,GL₁,GL₂; compact G | Weyl sizes 1,1,2; GL₀/compact have S=∅, B=G. At n=0, n−1=0 indexes native GL₁, not GL₀. | Existing n≥1 guard correct. |
| §5.1 standard root sums | sl₃, BC₁ | Four q dimensions 5,6,6,8; full BC₁ subset includes −2λ. At full type a_Π is split centre. | Root subsets correct; R04 adds source/needs. |
| §5.2 over-algebra classification | sl₃; sl₂(ℂ) real; compact G | [E₁₂,E₃₁]=−E₃₂ outside upper+ℝE₃₁; [iH,E₂₁]=−2iE₂₁ forces the whole real 2-plane; compact q₀=g gives 1 choice. | No partial-root-space counterfeit survives. |
| §5.3 eigenspaces | sl₃ X=(1,1,−2), (2,−1,−1), 0 | Off-diagonal eigenvalues 0,3,0,3,−3,−3 for first; q/l/n dims 6/4/2 for first two, 8/8/0 at zero. | Closed-wall and zero statements pass. |
| §6.1 normalizer/classification | GL₃; O(1,1) | Standard Weyl subgroups orders 1,2,2,6; O normalizer of q₀=g equals G≠P. | Correct component restriction. |
| §6.2 positive-character kernel | ℝ⋊C₂; ℝ^× | Inversion forces differential ℓ=−ℓ=0, so F=0,V₀=ℝ,⁰L=L and Lie⁰L=ℝ. For ℝ^×, F=ℝ,V₀=0,⁰L={±1}. | Corrected general formula passes. |
| §6.2 finite averaging and h | swapping ℝ²⋊C₂ | pr_F(3,1)=((3,1)+(1,3))/2=(2,2); residual=(1,−1); h projects onto diagonal. | Both fixed and moving directions retained. |
| §6.2 characters/product/periods | ℝ^×, tilted torus, GL₂ | h(−2)=log2; h(4)=2log2. Tilted h(t,s)=(t,ct), kernel={0}×S¹. GL₂ h=(log|det|/2)I; diag(2,1/2) is in ⁰L but not K. | Additivity, intrinsic kernel and datum-dependent complement pass. |
| §6.2 zero/compact products | compact G, inversion semidirect product, GL₀ | Compact h=0 and ⁰L=G; inversion gives L×1=L, while old product had (exp(−t),exp t) all over 1; GL₀ V=0 with no division. | Full-model restriction and correction are consistent. |
| §6.3 full Langlands | GL₃ blocks 2+1; SU(2,1); full type | GL: F=V dim 2, V₀=0; M/A/N dims 3/2/2 sum to dim Q=7. SU minimal dims 1+1+3=5. Full type N=1, Q=G. | Specialization uses inherited component condition; intersection proof has no §7.3 cycle. |
| §7.1 abstract conjugacy | S₃ with B=⟨(12)⟩; cyclic and Q₈ rank-zero systems | Exactly 2 of 6 g conjugate B into B, precisely B; for full J all 6 qualify. For B=G, S=∅ all elements qualify and P_J=G. | Nonabelian and degenerate cases pass. |
| §7.2 parabolic group/algebra correspondence | SL₃, compact G, O(1,1) | SL₃ four types: flag/plane/line/whole; compact one type, Q=G; O Lie P=g but N_G(g)=G≠P. | Both directions valid with condition. |
| §7.3 regular dynamics | Aut(sl₃), X₀=(1,0,−1), X₁=(3,1,−4) | τX₀=X₀; τX₁=(4,−1,−3)≠X₁. Q(X₀) has 2 P-cosets, Q(X₁) has 1; Q_∅ always has 2, N(Xi)=N. | Repaired Check respects universal containment. |
| §8.1 self-adjoint predicate | GL₂, discrete diag(2^k,2^(−k)), upper unipotent | Lie dimensions 4,0,1. Discrete group has infinitely many components and nontrivial elements outside K exp p; upper unipotent has p=0,K=1 but dim G=1. | Two hypotheses independently discriminate. |
| §8.1 tangent/form adapter | GL₂, SL₂, GL₀ | Tangents all 4 matrices, trace-zero dim 3, zero. det exp(tE₁₁)=e^t excludes E₁₁ from sl₂. Bθ=tr(XYᵀ) gives sum of entry squares. | Base polar theorem imported, form adapter is additional. |
| §8.2 three definitions/factor order | GL₂ X=diag(1,0), g=[[2,3],[0,5]]; X=0 | P upper, U upper unitriangular, L diagonal; l=diag(2,5), u₁₂=3/2; u·l order requires 3/5. At zero P=L=G,U=1. | Retain. |
| §8.2 normalization in factorization | rotated SL₂(ℤ); SL₂(ℝ), X=diag(1,0) | Integral example limit l=diag(2+√3,2−√3), (OlOᵀ)₁₂=3/2∉ℤ; real example factors diag(a,a⁻¹)(I+(b/a)E₁₂). | Normalization excludes exactly the obstruction; trace-zero X unnecessary. |
| Plan 8.2 transpose API | GL₂, X=[[1,1],[0,0]], g=I+X | Xg=gX=[[2,2],[0,0]], original orbit constant. In X-eigenbasis opposite orbit of θ(g) is [[0,e^t],[−e^(−t)/2,3/2]], unbounded. | False without symmetry; R01. |
| Plan 8.2c transpose API | G={I+tE₁₂}, X=0 | L=G; θ(I+E₁₂)=I−E₂₁∉G. In transformed θG it is present. | False without subgroup stability; R01. |
| §8.2 symmetry negative control | GL₂ X=[[0,1],[−1,0]] | Rotation conjugates bounded for all g, so P=G; U=1, L={aI+bX}∩GL₂, proper of dim 2 versus dim G=4. | Symmetry genuinely needed for decomposition. |
| §8.3 component predicate | O(p,q), p>q≥1; p=q≥1; p=q=0 | M determinant pairs are all 4 pairs; only (1,1),(−1,−1); sole (1,1), respectively. Component coverage 4/4,2/4,1/1. | Positive-rank formulas correct; residual zero failure R05. |
| §8.3 minimal matrix Langlands/Tits | SL₂; O(1,1); compact G | SL₂ has MAN factors and W=C₂; O P is normal of index 2 so every sPs⁻¹=P; compact P=G,S=∅. | Component condition is essential. |
| §8.3 matrix Bruhat headline | O(1,1), Aut(sl₃) | MAN gives 2 and 12 cells. With dynamic P at symmetric X₀ in Aut, 1 and τ give same double coset but τ acts nontrivially on a. | Correct choice MAN without component condition. |
| §8.3 subgroup/eigenspace headlines | sl₃ X=(1,1,−2),2X; gl₂ 0,I | sl₃ same centralizer dim 4 and q dim 6; regular (1,0,−1) has centralizer dim 2 and q dim 5. gl₂ 0,I both have centralizer and q dim 4. | Equality iff centralizer comparison passes under stated containment. |
| §9.1 components/inner action | GL₂, SO(2,1), disconnected O(1,1) | GL sign meets negative component; SO M={I,diag(1,−1,−1)} meets 2/2. O reflection acts −1 on 1D abelian complex Lie algebra but Int={1}. | Connected algebraic hypothesis necessary; bound on extra E₁₁ Check R05. |
| §9.2 wall comparison | GL₃ λ=(t,t,t^(−2)); SL₂ λ=0 or (t,t⁻¹) | GL weights 0,3,−3 give block 2+1 Q and U dim 2. SL₂ zero gives Q=L=G,U=1; regular gives upper-root weight 2 and U=N. | Repaired nonnegative/strict distinction. |
| §9.2 torus/real-point component comparison | SO(2,1); Gm×SO₂ | Split hyperbola torus has 2 real components; A has index 2. Nonzero analytic tilt c has no algebraic split-to-anisotropic homomorphism; c=0 gives the algebraic datum. | Retain supplied minimal bridge. |
| §9.3 complexification iff | gl₂ trace-zero upper, scalar line, full upper | Dimensions 2,1,3. First has sl₂ Borel but lacks I; second has I but no Borel; third has both and is minimal parabolic. | Independent conditions both needed. |
| §9.3 compact/complex examples | su₂; sl₂(ℂ) real; abelian real algebra | su₂ full complexification dimℂ3 contains Borel dim2, compact Cartan dimℂ1 does not. Complex-real case gives two Borel summands, dimℂ4; abelian case centre condition forces q=g. | Both directions and rank zero pass. |
| R03 supplier generality | split GL₂ and anisotropic SU₂ over ℝ | GL₂ split maximal torus dimension 2, W order 2. SU₂ real split rank 0 versus geometric rank 1; real minimal parabolic=G, W=1, but no real Borel input. | General analytic theorem survives; supplier contract must retain its split hypotheses. |

The exact rational 2×2 transpose witness, S₃ conjugation count, sl₃ eigenvalue counts, six A₂ inversion counts and component-sign pairs were also checked with a small local Python calculation. No code was downloaded. Other displayed computations are direct matrix/root/group calculations. Zero rings/DVRs/characteristic p are outside the real analytic hypotheses; the abstract Tits statement was checked independently on S₃ and rank-zero nonabelian/cyclic systems. The native GL comparison retains its Field and Nontrivial kˣ assumptions: over 𝔽₂ the diagonal point subgroup is 1 and its ambient GL₂ normalizer has 6 elements, not the 2 monomial elements. All divisions used here have explicit reasons: a≠0 for an invertible triangular SL₂ matrix, n≥1 for log|det|/n, and a nonempty finite component group for averaging. R05 records the remaining out-of-range matrix-unit cases.

### Sources and the seeded sample

All eight cited works have exactly one manifest entry. Four cached open texts were read; four books are explicitly settled uncertified and were not fetched again. No new source or missing-reference request was necessary. Preprint numbers are used as recorded in the manifest, not silently assigned to the published editions.

| Seeded target | Locator checked and outcome |
| --- | --- |
| 1.1 Reductive Cartan data | Knapp VII §2: settled uncertified. Full base signature checked against main, and positive/negative form and global-model witnesses computed above; the book's exact hypotheses/pages are not certified. |
| 1.3 Underlying Cartan involutions | Knapp VI §2 and VII §2: settled uncertified. The form-independent statement and disconnected cocycle correction were checked mathematically; no claim to have read those book passages. |
| 2.1 Positive systems | Bourbaki VI §1: settled uncertified. Pinned Base's root and coroot generation fields and the reduced Weyl/chamber imports were opened; BC₁/BC₂ and A₂ values above. |
| 2.2 Maximal abelian conjugacy | Knapp VI §5: settled uncertified. LieGroups Layer 9:1354–1364 supplies the maximal-abelian geometry; GL₂ and compact cases checked. |
| 2.3 Two Weyl groups | Knapp VI §5: settled uncertified. Base ownership is R02; geometric/root quotients computed on disconnected and rank-one examples. |
| 2.5 Iwasawa triples | Knapp VI §§2,5: settled uncertified. Scaling and tilted-centre controls verify that the new statement does not equate the forms. |
| 2.6 Base Iwasawa datum | Knapp VI §4: settled uncertified. Actual base fields at Suggested.lean:509–588 all accounted for, including the separate Nplus and chamber conditions. |
| 3.1 Centralizers | Knapp VII §2: settled uncertified. GL₃ centralizers at s=0, a and a wall give dimensions 9,3,5; component inheritance uses the earlier reflection/stabilizer arguments. |
| 5.3 Eigenspaces | `brown-rodriguezhertz-wang2022 line 124` supplies the connected semisimple finite-centre setting; lines 127–144 give the restricted-root decomposition and equation (1), printed preprint p.3. The eigenvalue description follows by evaluating those root spaces. This text does not itself state the arbitrary reductive/disconnected extension. Knapp VII §7 remains uncertified. |
| 6.3 Standard Langlands | Knapp VII §7, Wallach Ch.2 §2.2 and Warner Ch.1 §1.2 as recorded: settled uncertified. Internal proof and corrected character specialization checked at block type and both endpoint subsets. |
| 7.2 Parabolics | Knapp VII §7: settled uncertified. `brown-rodriguezhertz-wang2022 line 154`, preprint p.4, supports the group/algebra correspondence in its connected semisimple finite-centre setting; the general component-conditional extension is this design's work. |
| 8.1 Self-adjoint model | Wallach Ch.2 §2.1 and Knapp VII §2: settled uncertified. The base identity-cover polar input and pinned exponential/trace carriers were read; the new tangent/form adapter has the stated scope. |
| 8.2 Dynamic subgroups | Knapp VII §7 remains uncertified; Brown–Rodriguez Hertz–Wang §1.2 gives root/exponential background, not an arbitrary ambient-X Levi theorem. The elementary spectral-block proof works with the revised normalization premise. Separate plan transport overclaims are R01. |
| 8.3 Component/minimal parabolic | The internal locators §§3.3,4.2–4.3,5.2–5.3,6.1,7.3 resolve. Plan Knapp VII §§2,4,7 and Bourbaki IV §2 remain uncertified. All five matrix headline statements tested above. |
| 9.3 Complexification | Knapp VII §7: settled uncertified. Native borelSubalgebra's Killing/splitting-Cartan setting was opened; the gl₂, su₂, complex-real and abelian controls test both implications. |

Additional available-source verification:

- `borel-tits1965 line 1488`, Theorem 4.15, printed pp.90–91, constructs opposite algebraic parabolics from an ordering on a split torus's weights, with centralizer Levi. It is not an arbitrary symmetric-matrix theorem.
- `borel-tits1965 line 1802`, Corollary 5.9, p.98, gives the ordering/minimal-parabolic correspondence and simple transitivity, supporting gap:minimal-parabolic-orderings. Integer cocharacters can be chosen in each rational open chamber; empty roots give one chamber and one parabolic.
- `borel-tits1965 line 1868`, Theorem 5.15, pp.100–101, and lines 1924,1930,1935,1946, Proposition 5.17 and Corollaries 5.18–5.20, pp.101–102, support algebraic Bruhat, overgroups, conjugate containment, normalizers and double cosets. The containment direction matches §7.1 after matching subset labels.
- `borel-tits1965 line 2938`, Proposition 9.3, pp.126–127, gives the compactness/triangularizable-subgroup equivalence for locally compact characteristic-zero fields; the declared ℝ implication retains its hypotheses. SL₂/B has compact ℙ¹(ℝ), whereas SL₂/1 is noncompact.
- `borel-tits1965 line 3750`, Theorem 14.4, p.146, states the real component factorization with a maximal split torus. It is only a remark in §9.1, not a hidden cyclic input. Lines 3775–3821, §14.7, pp.147–148, explicitly assume semisimplicity; the reductive minimal bridge is correctly consumed from AutomorphicFormsOnReductiveGroups, not claimed verbatim from this passage.
- `brown-fisher-hurtado2022 line 499`, §3.1, preprint p.11, gives its connected semisimple finite-centre setting; equation (1) at lines 516–521 uses span(−Π′), equal to span(Π′). Lines 529–534, p.12, give the group/algebra correspondence. Its Proposition 7.76 citation and `brown-rodriguezhertz-wang2022 line 143`'s Lemma 7.73 citation corroborate those numbers, not the unread book's full statements.
- `bradlow-collier-garciaprada-gothen-oliveira2024 line 72`, Introduction p.2, and lines 197–210, p.5, justify the consumer reference to Θ-positive real parabolics. No result of that downstream theory is used as an input.

### Library declarations opened at the pins

The hashes in `design/plan.json` and README agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The files below were opened at those pins. Existence checks used object/definition searches, not just this roadmap's proposed names.

| Native input | File and line; contract actually read |
| --- | --- |
| LieGroup, LeftInvariantDerivation | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `LeftInvariantDerivation.lean:47`. Smooth multiplication/inversion and invariant derivations; finite-dimensional, Hausdorff and boundaryless assumptions are separate and retained in the README. |
| LieAlgebra.center, derivedSeries, IsSemisimple, IsSolvable, ad | `Mathlib/Algebra/Lie/Abelian.lean:282`, `Solvable.lean:69,259`, `Semisimple/Defs.lean:105`, `OfAssociative.lean:196`. Centre is the maximal trivial adjoint submodule; derivedSeries at 1 is the derived ideal. |
| BilinForm; inner derivations | `Mathlib/LinearAlgebra/BilinearMap.lean:539`; `Mathlib/Algebra/Lie/Derivation/Killing.lean:108`. Inner-derivation theorem requires finite-dimensional Killing Lie algebra, met by the real semisimple use. |
| RootPairing, Base, IsReduced, weylGroup | `Mathlib/LinearAlgebra/RootSystem/Defs.lean:81`, `Base.lean:68`, `Reduced.lean:50`, `WeylGroup.lean:55`. Base requires generation of both roots and coroots, so it is not the informal nonreduced base. Weyl group is generated by reflections. |
| Base.existsUnique_map_eq; stabilizer_eq_closure_wallReflections | `TauCeti/LinearAlgebra/RootSystem/Weyl/Bases.lean:170`; `FundamentalDomain.lean:201`, hypotheses at :148. Finite reduced crystallographic inputs retained; wall theorem uses ordered coefficients and reduced flip. |
| Subgroup.normalizer, centralizer; double cosets | `Mathlib/Algebra/Group/Subgroup/Defs.lean:663`, `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30`, `DoubleCoset.lean:37,79`. DoubleCoset.Quotient is a quotient of a group by sets, with no topology built in. |
| Matrix groups and unitarySubgroup | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43`, `Matrix/SpecialLinearGroup.lean:70`, `UnitaryGroup.lean:318`, `SymplecticGroup.lean:102`; `Mathlib/Algebra/Star/Unitary.lean:273`. GL is matrix units; symplectic matrices have their native submonoid/group carrier and need the embedding adapter when used inside GL. |
| NormedSpace.exp; transpose and conjugation | `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128`; `MatrixExponential.lean:113,185`. Exp's junk branch is irrelevant over finite-dimensional real matrices; conjugation requires a unit, supplied by exp or g∈GL. Transposition gives Xᵀ, explaining R01. |
| Eigenspaces; components; bounds and limits | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`; `Topology/Connected/Clopen.lean:500`, `Topology/Connected/Basic.lean:505`; `Topology/Bornology/Basic.lean:101`; `Order/Filter/Defs.lean:421`. Eigenspace is ker(f−μ1); components carry no automatic finiteness; connectedComponentIn is empty outside its set; bounds are in the ambient matrix space. |
| map_lieExp; lieMap_injective; closed subgroup | `TauCeti/Geometry/Lie/Functor.lean:315`; `Faithfulness.lean:50`; `Subgroup/Embedded.lean:157`. Faithfulness needs a preconnected source and both model spaces finite-dimensional; the application restricts to G⁰. |
| TitsSystem and Bruhat API | `TauCeti/GroupTheory/TitsSystem/Basic.lean:50`; `Bruhat/Basic.lean:100`; `Bruhat/Uniqueness.lean:35,99,111`. Only a group is assumed. The last axiom excludes conjugate containment; for simple involutions modulo B this implies the stated non-normalization. |
| Standard parabolics and overgroups | `TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean:48,152,160,206`; `Classification.lean:114,146`; `Normalizer.lean:66,77`. These supply the union, order isomorphism and self-normalization; no duplicate abstract targets are introduced. |
| Parabolic double cosets, induced systems, rank one and Coxeter | `TauCeti/GroupTheory/TitsSystem/Parabolic/DoubleCoset.lean:199`, `Parabolic/TitsSystem.lean:110`, `RankOne.lean:63`, `Coxeter.lean:178`. Double-coset equivalence's native direction is Weyl-to-group; its inverse gives the prose's displayed direction. The general conjugate-containment statement of §7.1 was not found among these existing targets. |
| GL Tits/Weyl | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195,270`, binders at :58; `RestrictedWeylGroup.lean:230`. Native Tits carrier is GL(Fin(n+1),k) with Field k and Nontrivial kˣ. |
| GL factors and Iwasawa | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperTriangular/Basic.lean:55`, `UpperUnitriangular/Basic.lean:108`, `Diagonal/Positive.lean:57`, `Iwasawa.lean:224,280`. Factor order is orthogonal, positive diagonal, unitriangular. |
| GL Bruhat/KAK/compactness/polar | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Bruhat.lean:218`, `Cartan.lean:65`, `MaximalCompact.lean:158`; `TauCeti/Analysis/Matrix/Polar.lean:76`. GL₂ big cell tests lower-left invertibility; KAK uniqueness concerns positive antitone singular values; polar uniqueness has positive-times-unitary order. |
| Algebraic dynamic groups | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154,208,245,277`. Parabolic is polynomial extension of conjugation, limit evaluates at zero, Levi is the fixed locus, unipotent is the limit kernel. No analytic ambient-X theorem is hidden in these definitions. |
| borelSubalgebra | `TauCeti/Algebra/Lie/Weights/Borel.lean:439`. It is the actual Cartan-plus-positive-root Lie subalgebra for a finite-dimensional Killing algebra and splitting Cartan, not a free predicate. |

### Ownership, suppliers and overlap resolution

I read the board-packages index before absence claims. Its three listed packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. The available board README tree was also searched by mathematical objects. The rank-one boundary coordinates of `packages/BallQuotientsAndComplexHyperbolicLattices/design/README.md:9` concern specific complex-hyperbolic models; they do not own this arbitrary finite-cover/component theory.

The supplied overlap report lists no shared head, dropped cited ID, or ID defined only by an open revision. I read its five closest roadmaps at their available heads/main. Current roadmap-tool ownership searches returned the relevant algebraic, adelic, root and Lie owners. A fresh overlaps invocation does not index this design as an open roadmap, so it cannot replace the supplied candidate overlap report. No external PR discovery or write was performed.

- **LieGroups on main**, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:252,301,356,446,463,787,1199`: all cited Layers 0–4,7,9 exist. Native exponential/Ad/Lie-subgroup interfaces are explicitly consumed there. Integration is `Suggested.lean:196`, with simply connected source; using the simply connected integration of sl₂ preserves that premise. Layer 9's full Cartan and Iwasawa structures were read at `Suggested.lean:455–588`, with polar theorem :612. Its own quotient/reflections remain the duplication R02. Its global matrix polar theorem and maximal-abelian geometry are now imported correctly.
- **RootSystems on main**, `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:123,287–298`: the Exact supplier contracts section records precisely the native chamber, wall and base declarations consumed. No new RootSystems target or later Coxeter construction is a hidden dependency.
- **ReductiveGroups on main**, `TauCetiRoadmap/ReductiveGroups/README.md:2821,2899–2932,2934–2956,3236–3283`: parabolic/cocharacter, relative-root and Levi targets exist; 7b owns additional intersection/comparison work. Its stronger nonsplit rational-point Tits contract is not present: R03. Neither of the two declared gaps was found already provided at this generality in these sections or the pins.
- **AutomorphicFormsOnReductiveGroups #1037**, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:372–380`: owns the real-algebraic minimal MAN and strict-cocharacter comparison. It is now a supplier, with the genuinely broader nonalgebraic/component theory and chamber-wall extension distinguished here. No claimed transfer to the earlier roadmap remains.
- **ArithmeticLocallySymmetricSpaces #871**, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:580–604,1167–1196,1246–1300`: ALS.F.1, ALS.0.1 and ALS.0.2–0.3 resolve. The two original citation-tool leads occur as planned supplier names at :582 and :1187. They are not claimed native pinned declarations. The number-field restriction of ALS.0.2 is retained in §9.1.
- **MordellLawrenceVenkatesh #1231**, `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1461–1467`: §3.10 explicitly supplies analytic connectedness of connected locally finite-type complex schemes. Applied to the geometrically connected base change of a connected real algebraic group in characteristic zero, this gives the claimed connected complex group; it says nothing false about connectedness of its real points.
- **FlagVarieties on main and #2114**, `TauCetiRoadmap/FlagVarieties/README.md:4–32`: owns algebraic subgroup-scheme/projective homogeneous-space classification over algebraically closed fields, not this analytic extension or the arbitrary abstract Tits transporter of §7.1.
- **ShimuraData #1038**, `TauCetiRoadmap/ShimuraData/README.md:15,506,529`: Hodge-filtration parabolics and compact duals are different interfaces; its dynamic sign agrees with the native cocharacter convention.
- **AdelicAlgebraicGroups #792**, `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1565–1584,1715`: rational algebraic characters and adelic split components do not supply the continuous positive characters of arbitrary disconnected nonalgebraic Lie groups in §6.2. The latter remains legitimately owned here.

The content checkout's main is `ab06c8c3`; the supplied overlap/citation snapshot used `c9dea9d`, so supplier line numbers were re-found by headings, not inherited from round 2. The fresh resolver reports no unresolved cross-roadmap citations, but explicitly says it did not inspect external Lean names because its own configured host lacks pinned Lake packages. Native verification in this report instead used the specified pinned files directly. A resolver's empty list was not treated as proof of a correct mathematical supplier contract.

The two gap slugs match in README and plan: `minimal-parabolic-orderings` and `real-compactness-criterion`, both assigned to ReductiveGroups Layer 7. Their needs are precise single mathematical contracts, minimal relative to the actual supplier and pins, and supported by the open source. Their present absence is not a finding. Acceptance after repair can be conditional on these contracts; this needs-changes verdict does not populate conditional_gaps.

Dependency gate output, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after MordellLawrenceVenkatesh (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2062 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Independently, DFS of the plan found 40 targets, 92 internal target edges, no missing target ID and no cycle. Every *Needs:* line and supplier paragraph was read; the missing local lines are R04, while the existing dependency directions are valid. The proposed insertion follows MordellLawrenceVenkatesh (ORDER:160), with AutomorphicFormsOnReductiveGroups and ArithmeticLocallySymmetricSpaces earlier (ORDER:59,58). No merge-order or tool file was edited.

### Headlines, names and Lean acceptance

There is no `packages/LieGroupsPartII/Suggested.lean`; this is a design, not a package acceptance. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. There is no warning-only build result, elaborated binder comparison or mechanical #check result. The one-tactic probe has zero sorried declarations to test, not a successful proof of an unwritten file.

The README's headlines are: underlying Cartan-involution and Iwasawa-choice conjugacy; minimal MAN decomposition; Bruhat and cell coordinates; the real Tits system; standard parabolic subalgebra and subgroup classification; full standard-parabolic Langlands decomposition; general parabolic type and Lie-algebra correspondence; dynamic descriptions; the self-adjoint tangent/form model and its matrix statements; the wall extension of the algebraic comparison; and the complexification criterion. The semisimple involution theorem §1.2 is also a substantive intermediate target.

The twelve explicit planned own identifiers resolve to six definitions (`IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi`, `LinearComponentCondition`) and six theorems (`dynamicLevi_decomposition`, `minimalParabolic_langlands`, `bruhat_decomposition_linear`, `eq_dynamicParabolic_of_le`, `exists_eq_nonnegEigenspaces_of_le`, `exists_titsSystem_linear`). They are design target names; no claim is made that they have been declared in Lean. The deleted maximal-abelian theorem name is no longer an owned acceptance target.

The six matrix headlines use native groups, matrices, subgroups, submodules, eigenspaces and limits with simple real-body predicates. They are statable obligations for the package, not one-tactic padding or small-value Checks. General semisimple involution conjugacy likewise has native Lie-algebra/endomorphism carriers. The full standard-parabolic Langlands headline must not be replaced by only elementary block LU factorization: its matrix form can use the continuous-character kernel on native carriers. The eventual acceptance file must either state every remaining headline on native/simple carriers or name the missing carrier precisely in its module docstring. No missing-file or missing-docstring finding is raised at this design stage.

## Not verifiable

- **knapp2002**, VI §§2,4–5 and VII §§2,4–7, including Lemma 7.73 and Proposition 7.76: settled uncertified. No legal full text was supplied. Exact pages and full hypotheses were not checked; the two papers corroborate the numbered references only. The manifest openly records that the resolved DOI is for the first edition while the cited edition is the second.
- **bourbaki-lie4-6**, IV §2 nos.1–7 and VI §1; **warner1972**, chapter 1 §§1.1–1.2; **wallach1988**, chapter 2 §§2.1–2.2: all settled uncertified. No repeat request or guessed page number.
- Lean elaboration, tactic probes and elaborated implicit-binder checks: unavailable in this lane; no acceptance file exists.
- Ownership against open PR contents outside the supplied indexes and roadmap-tool results was not checked. The three board-index entries on other branches were not treated as if their contents existed in this checkout. No global claim of absence beyond the searched main, heads, available board tree and pins is made.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p.3, line 134: the source says simple roots exclude arbitrary linear combinations of other positive roots; it should be nonnegative integer combinations; affects a stated result.
