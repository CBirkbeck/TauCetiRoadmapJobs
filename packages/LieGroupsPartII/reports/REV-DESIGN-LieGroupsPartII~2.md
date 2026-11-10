# Review of LieGroupsPartII (design, round 2)

**Verdict:** needs changes

Reviewed the 42 plan targets and all 32 numbered README sections, including the 15 seeded targets. There are 12 findings: 5 P1, 5 P2 and 2 P3. The target graph is acyclic, but passing the dependency gate does not resolve the supplier drift, duplicate ownership or counterexamples below. This is a repairable Part II, not a rejection of its parabolic-group scope. No design or source-manifest entry was changed.

## Previous findings, checked individually

The labels F01–F11 below are those of the previous review and repair report. None was marked “not actionable in this package”; no settled exception is being reopened.

| Previous finding | Current passage and independent check | Status |
|---|---|---|
| F01, missing centre in §9.3 | README:860 now says “iff `𝔮` contains the centre `𝔷` and …”. For the trace-zero upper algebra in `gl₂`, dimensions are 2 versus 3 for the minimal parabolic; adjoining the scalar identity gives dimension 3 and both conditions. | Repaired. |
| F02, §6.3/§7.3 cycle | README:640 now gives the intersection argument using `q = l n`, and :643 lists “§§3.1, 5.1–5.3, 6.1–6.2”. The plan has no `6.3 → 7.3` edge; a DFS of all 42 targets and 99 target edges found no cycle. | Repaired. |
| F03, Bruhat hypothesis and O(1,1) | README:440 says the union is indexed by `W_G`; :785 says the matrix Bruhat theorem assumes no component condition. `O(1,1) = P ⊔ dP`, both cells have dimension 1. Replacing the dynamic group by `MAN` correctly handles the diagram automorphism of `sl₃`. | Repaired for the theorem. A changed explanatory Check in §7.3 remains false: R07. |
| F04, unnecessary Matsumoto gap | README:827 uses “it is connected (MordellLawrenceVenkatesh §3.10)” and then axiom (v). The Matsumoto gap is absent from both files; two gaps remain. The new supplier really states analytic connectedness. | Repaired locally. Its new insertion point exposes the ownership/order defect R06. |
| F05, RootSystems Layers 1–2 | README:106 says “Only its section ‘Exact supplier contracts’ is consumed”. The plan cites that section and the actual native declarations. | Repaired. |
| F06, final-target labels | All eleven labels are absent. The current README contains no “final target” occurrence. | Repaired. |
| F07, redundant B-containment | README:663 now reads “if `g P_J g⁻¹ ⊆ P_{J'}`, then …”. Native `subgroupB_le_standardParabolic` supplies the formerly redundant premise. | Repaired. |
| F08, polar uniqueness citation | README:94 names `Matrix.GeneralLinearGroup.existsUnique_posDef_mul_unitary`; :742 cites it in the proof and Needs line. Its type at `TauCeti/Analysis/Matrix/Polar.lean:76` has precisely the positive-times-unitary order. | Repaired as a citation; the general polar theorem now belongs to the base roadmap: R05. |
| F09, ALS.0.2 scope | README:827 now says “For `𝐇 = (Res_{F/ℚ} G)_ℝ` …”. ALS.0.2 at the head of #871 has this number-field restriction. | Repaired. |
| F10, dropping X-membership | README:764 says “neither `X ∈ linearLieAlgebra G` nor finitely many components is needed”; :772 says closedness puts the limit in G. The new universal claim is false; the supplied SL₂ example does not establish it. | Not repaired; R04 gives a counterexample to the replacement. |
| F11, two matrix headlines | README:786 adds `exists_eq_nonnegEigenspaces_of_le`; :794 adds `exists_titsSystem_linear`. Plan targets 8.3f and 8.3g have the corresponding statements. | Repaired at design stage. There is no Suggested.lean yet. |

## R01 (P1) — The base Cartan and Iwasawa contracts describe an obsolete supplier

**Location.** `packages/LieGroupsPartII/design/README.md:102`: “Its pinned `CartanInvolution` structure records only compactness of the fixed set and reductivity of `𝔤`.” Also §§1.1, 2.6 and plan targets 1.1, 2.6.

**Claim.** Adding the listed form/polar fields refines the current base datum; the listed §2.6 obligations construct its IwasawaData; the SU(2) nontrivial involution satisfies the base fields.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean:491` requires `global_model : FiniteCartanMatrixModel G θ`; :509–588 adds restricted-root, Nplus and chamber-coverage fields. These are absent from this design's claimed exhaustive contract. The SU(2) polar collision excludes the required model.

**Exact repair.** Reconcile with LieGroups on main, not its earlier signature. Retain its actual `CartanInvolution`, including the global model, and make B an additional compatible form; consume the base polar theorem instead of presenting its conclusion as missing. In §2.6 construct all actual fields, including exact restricted roots/root spaces, Nplus, chamber inequalities, closedness, normalizer coverage and split-centre lineality; add the requisite §2.3 input. Change the SU(2) and circle descriptions to non-examples of the current base datum as well. Update the Summary, contracts and plan together. Replace the obsolete supplier declaration names `lieMap_lieExp` and `monoidHom_eq_of_lieMap_eq` by the native `map_lieExp` (`TauCeti/Geometry/Lie/Functor.lean:315`) and `lieMap_injective` (`TauCeti/Geometry/Lie/Faithfulness.lean:50`), with their hypotheses. They are not declarations of the base's current Suggested.lean.

**Repair test.** `GL₂` has the identity matrix cover and its genuine positive-root chamber; `SU(2)` with the stated nontrivial involution has `(1,πY)` and `(−1,0)` with the same polar image, so cannot meet the base global-model theorem. The corrected contract distinguishes them. This is supplier drift, not an invitation to weaken the base.

## R02 (P1) — Conjugation cannot change the invariant form in a datum

**Location.** `packages/LieGroupsPartII/design/README.md:289`: “there is `g ∈ G⁰` with `gDg⁻¹ = D'`”; transport is defined at :146. Also the Summary, §1.3's wording and plan target 2.5 (:408).

**Claim.** Equal split centres suffice for conjugacy of the entire pairs `(θ,B)`.

**Witness.** On `G = ℝ^×`, use the same inversion θ and forms `B(x,y)=xy`, `B'(x,y)=2xy`. Both satisfy every datum condition and have split centre ℝ. Ad is identity, so the transported values at `(1,1)` remain 1, never 2.

**Exact repair.** State conjugacy of the involutions, eigenspaces, maximal abelian subspaces and positive systems, without equality of the forms. If retaining a theorem about equality of whole data, explicitly require `B = B'` as well; Ad-invariance makes this necessary. After R01, also specify transport or equivalence of the auxiliary global matrix model rather than equality of arbitrary model choices. Use the form-independent theorem for minimal-parabolic conjugacy. Change the Summary and §1.3 terminology consistently and add the scaling example as a negative Check.

**Repair test.** The two scaled data have identical θ, 𝔞 and positive system, so the form-independent assertion holds with `g=1`; the whole-datum assertion correctly excludes them. The same obstruction occurs on semisimple groups with B and 2B, so semisimplicity does not repair the wording.

## R03 (P1) — The split-centre direct product fails for disconnected groups

**Location.** `packages/LieGroupsPartII/design/README.md:600–602`: “`Lie(⁰L) = ⁰𝔩`” and “`⁰L × A_L → L` is an isomorphism”. Plan target 6.2 begins at :1044.

**Claim.** The character-kernel formula and direct product hold for every reductive Cartan datum, with no restriction on the component action on its Lie-algebra centre.

**Witness.** Use the design's own `L = ℝ ⋊ C₂` from :196, with inversion action. Every positive character kills ℝ and C₂, so `⁰L=L`, `Lie(⁰L)=ℝ`; the displayed `⁰𝔩` is 0 and `A_L=ℝ`. Multiplication is not injective.

**Exact repair.** Preserve the general disconnected theory. Put `V=𝔷(𝔩)∩𝔭`, `F=V^{Ad(L)}` and `V₀=F^⊥` in V for Bθ. State

- `Lie(⁰L)=[𝔩,𝔩] ⊕ (𝔷∩𝔨) ⊕ V₀`;
- `⁰L=K_L exp((𝔭∩[𝔩,𝔩]) ⊕ V₀)`;
- `⁰L × exp(F) → L` is the direct-product isomorphism.

Explain the finite component action and the averaging projection `V → F` that gives the positive characters. Retain `A_L=exp(V)` as the datum's split component; recover the present formulas when the component action on V is trivial, in particular under the component condition. Apply that specialization in §6.3 using §3.1. Update the plan and add this disconnected Check.

**Repair test.** For `ℝ ⋊ C₂`, `F=0`, `V₀=ℝ`, so the corrected product is `L×1=L` and the Lie algebra is ℝ. For `ℝ^×`, `F=ℝ`, `V₀=0`, recovering `{±1}×ℝ_{>0}`. The general statement must not be silently restricted to connected groups.

## R04 (P1) — The repaired matrix Levi factorization loses invariance of G

**Location.** `packages/LieGroupsPartII/design/README.md:764–772`: arbitrary symmetric X is allowed, and the limit “lies in `G`, because `G` is closed”. Plan target 8.2d begins at :1602.

**Claim.** Every closed transpose-stable subgroup has the stated Levi factorization for every symmetric ambient matrix X.

**Witness.** Let `O=½[[√3,−1],[1,√3]]`, `G=OᵀSL₂(ℤ)O`, `X=diag(1,0)`. Then `g=Oᵀ[[2,3],[1,2]]O=[[2+√3,2],[0,2−√3]]`. Its conjugation limit l is diagonal, but `(OlOᵀ)₁₂=3/2`, so `l∉G`.

G is closed and transpose-stable: SL₂(ℤ) has both properties and O is orthogonal. Its conjugates converge to `l=diag(2+√3,2−√3)`, so g belongs to the defined dynamic parabolic. In any claimed factorization `g=l' u`, taking the ambient limit forces `l'=l`; thus no such factorization exists. The erroneous proof applies closedness to a family not known to lie in G.

**Exact repair.** Require `exp(tX) G exp(−tX)=G` for all real t in the factorization theorem, or restore the sufficient hypothesis `X∈linearLieAlgebra G`. Keep the definitions and the purely intersection-based subgroup assertions at their valid wider generality. Retaining the normalization hypothesis allows the SL₂ example `X=diag(1,0)` even though X is not traceless. Remove the claim that no invariance is used, and update target 8.2d and its Checks.

**Repair test.** The conjugated integral group fails the normalization hypothesis, since its above conjugates converge outside G. For `SL₂(ℝ)`, diagonal conjugation normalizes G, the limit is `diag(a,a⁻¹)∈G`, and the stated factor `u₁₂=b/a` is correct. This directly corrects F10's replacement, rather than merely reinstating an unused premise.

## R05 (P2) — The self-adjoint polar theorem is re-planned after the base owns it

**Location.** `packages/LieGroupsPartII/design/README.md:734–742` and plan target 8.1c assign the general closed, transpose-stable, finite-component polar construction to this roadmap.

**Claim.** This roadmap owns the matrix-group Cartan structure theorem as new mathematics.

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:1199–1232` already owns general finite matrix-cover models and proves matrix polar factors remain in H, compactness/maximality of K, and the diffeomorphism. Taking its covering to be identity gives exactly this case.

**Exact repair.** Import the general matrix polar/Cartan theorem from LieGroups Layer 9. Keep only the explicit adapter identifying its tangent Lie algebra with `linearLieAlgebra G`, and any genuinely additional form/parabolic comparison. Remove the duplicate polar proof target from 8.1c and cite the supplier in Scope and the exact contracts. Review §2.2 against that layer's maximal-abelian/exhaustion input at :1357–1363 as well; do not reassign the base's geometric chamber construction.

**Repair test.** The identity cover of `GL₂(ℝ)` supplies the same K and symmetric 𝔭, and the same polar map. No second theorem constructing these factors is needed. The remaining parabolic structure in Layers 3–7 is still a valid Part II extension.

## R06 (P2) — The new supplier order contradicts the asserted ownership transfer

**Location.** `packages/LieGroupsPartII/design/README.md:41`: “the supply runs from this roadmap to that one”; also :887 and the plan's AutomorphicFormsOnReductiveGroups consumer entry.

**Claim.** AutomorphicFormsOnReductiveGroups imports its §2.3a from this roadmap.

**Witness.** Open #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:374–380`, still constructs MAN and the full real-algebraic comparison. ORDER:60 places it before MordellLawrenceVenkatesh at :160; the gate inserts this candidate after :160. The purported consumer is earlier and owns the same comparison.

**Exact repair.** Use a single downward ownership decision that works with the actual order. Import #1037's roadmap §2.3a for its real-algebraic class, in particular the already-owned comparison of §9.2; retain the explicitly broader nonalgebraic extensions here, describing the difference in one clause. Remove the assertion that the earlier roadmap receives these results from this candidate, and repoint consumers of §9.2 to the existing owner. An alternative requires an actual coordinated ownership move to an earlier supplier, not a prose promise that an earlier consumer will import upward. Also remove the asserted downstream supply to NoncompactQuantumSymmetry where it would run backward (ORDER:155).

**Repair test.** With the existing comparison consumed from AutomorphicFormsOnReductiveGroups §2.3a, the arrows are `AutomorphicFormsOnReductiveGroups → LieGroupsPartII` and `MordellLawrenceVenkatesh → LieGroupsPartII`. The general Lie-group extension still includes nonalgebraic finite covers. The previous review's insertion-point justification no longer applies.

## R07 (P1) — The changed dynamic Check contradicts its own containment theorem

**Location.** `packages/LieGroupsPartII/design/README.md:718`: “`Q(X)` and `Z_G(X)` can exceed `Q_{Π'}` and `L_{Π'}`”.

**Claim.** In the displayed automorphism-group example Q(X) exceeds the normalizer-defined standard parabolic.

**Witness.** §7.3(i) gives `Q(X)⊆N_G(𝔮_{Π'})=Q_{Π'}`. For the displayed regular X₀ in Aut(sl₃), `Q(X₀)=P⊔τP=Q_∅`, where `τ=σAd(w₀)` preserves the positive roots. It exceeds P, not Q_∅.

**Exact repair.** Replace the final sentence by `Q(X₀)=Q_∅⊋P`, `Z_G(X₀)⊋L_∅=MA`; retain the universal containment. Add a contrasting regular `X₁=diag(3,1,−4)`: τ does not fix X₁, so `Q(X₁)=P⊊Q_∅`. Update any duplicated Check in the plan.

**Repair test.** `τX₀=X₀`; `τX₁=diag(4,−1,−3)≠X₁`. The regular-cell formula gives respectively two and one P-cosets; the normalizer of the positive subalgebra stays `P⊔τP`.

## R08 (P2) — The root-flow iff statements omit Y ≠ 0

**Location.** `packages/LieGroupsPartII/design/README.md:62`: “This stays bounded … iff `β(X) ≥ 0`, and tends to `1` iff `β(X) > 0`.”

**Claim.** Both equivalences hold for every Y in the root space, including zero.

**Witness.** In GL₂ take `X=diag(1,0)`, `β=e₂−e₁`, `Y=0`. The conjugated exponential is constantly 1, bounded and convergent to 1, whereas `β(X)=−1`; both right-hand inequalities are false.

**Exact repair.** Keep the exponential identity for all Y, but put `Y≠0` on both equivalences. Give the zero-vector exception explicitly. Add the zero and nonzero negative-root examples as Checks of the sign convention.

**Repair test.** For `Y=E₂₁`, the family is `I+e^tE₂₁`, unbounded; for Y=0 it is I. For `Y=E₁₂`, it is `I+e^(−t)E₁₂`, converging to I. All corrected cases agree.

## R09 (P2) — The comparison proof puts zero-weight roots in the unipotent radical

**Location.** `packages/LieGroupsPartII/design/README.md:847`: for both (c) and (d), “`N = exp 𝔫 ⊆ 𝐔(ℝ)`”.

**Claim.** The whole minimal unipotent N lies in the dynamic unipotent radical for a cocharacter anywhere in the closed positive chamber.

**Witness.** Take H=SL₂ and the trivial cocharacter. Then `Π'=Π`, `P_H(λ)=H`, `U_H(λ)=1`, whereas `N={I+bE₁₂}` contains `I+E₁₂≠1`.

**Exact repair.** For (d), use `N⊆P_H(λ)(ℝ)`: all positive roots have nonnegative λ-weight. Only the strictly positive-weight factor `N_{Π'}` lies in `U_H(λ)(ℝ)`. For (c), regularity makes all those weights strictly positive. Make that distinction in the proof, or in the imported comparison contract after R06.

**Repair test.** For λ=0, the required inclusion becomes `N⊆H`, while `N_Π=1=U_H(0)(ℝ)`. For `diag(t,t⁻¹)`, the upper root has weight 2 and `N=U_H(λ)(ℝ)`.

## R10 (P2) — The machine-read compactness gap has no mathematical needs sentence

**Location.** `packages/LieGroupsPartII/design/plan.json:2160`: `"needs": "Borel–Tits Proposition 9.3 over k = ℝ."`.

**Claim.** This is the precise one-sentence supplier contract announced by intake.

**Witness.** The needs value names a source result but gives no quantified groups or conclusion. README:112 and the detail field contain the implication; the intake's needs sentence does not. `borel-tits1965 line 2938` has hypotheses and three equivalent conditions.

**Exact repair.** Put the intended implication itself in needs: “For a connected linear algebraic group H over ℝ and a closed ℝ-subgroup L, compactness of H(ℝ)/L(ℝ) implies that L contains a maximal connected ℝ-trigonalizable subgroup of H.” Keep the existing slug and supplier. Likewise make the minimal-orderings needs sentence explicitly quantify a connected reductive H over a field k and a maximal k-split torus S, as its existing detail does.

**Repair test.** `H=SL₂`, `L=B` has compact quotient ℙ¹(ℝ) and contains the maximal split solvable B; `L=1` has noncompact quotient and is excluded. No new gap, duplicate owner or request for the already-settled source is needed.

## R11 (P3) — Small-rank Checks use unstated lower bounds

**Location.** `packages/LieGroupsPartII/design/README.md:155`, :326, :487, :800 and :901. Representative claim: “These are the subgroups of `TauCeti.glTitsSystem ℝ (n − 1)`.”

**Witness.** At n=0, `glTitsSystem ℝ (0−1)` is on GL₁, not GL₀ (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`). At n=1, the motion group's Lie algebra is central ℝ; SO₀(1,1) has no roots and its flag quotient is a point, not S⁰.

**Exact repair.** Give the GL comparison for n≥1 and handle GL₀ by the trivial-group Check. Give the Euclidean-motion non-example and SO₀(n,1) root/sphere formulas for n≥2, and record the n=1 exceptions. Propagate these bounds to repeated Worked examples and the plan. In the native GL contract at :89, retain the actual `[Field k] [Nontrivial kˣ]` assumptions; the declaration's ambient normalizer is not the all-field scheme-normalizer version.

**Repair test.** GL₀ and its Weyl group each have one element; GL₁ has nontrivial underlying group and trivial Weyl group. `ℝ⋊C₂` is the valid datum used in §1.3, and SO₀(1,1)=A has P=G and a one-point quotient. For n≥2 the cited sphere and motion-group non-example have the intended values.

## R12 (P3) — The minimal-parabolic definition has only two Checks

**Location.** `packages/LieGroupsPartII/design/README.md:404–409` defines minimal parabolics relative to a datum, then lists only the SL₂ and rank-one Checks.

**Claim.** Every definition has at least three discriminating Checks.

**Witness.** The two bullets are at :408–409. Neither tests the newly specified common split-centre condition or a rank-zero group, and the definition's plan target 3.4 likewise has only two tests.

**Exact repair.** Add a third Check using the tilted `ℝ×S¹` data: all have P=G, although θc and θc′ are not conjugate for c≠c′. Explain that equality of the subgroup alone does not recover a datum and that the definition's permitted triples retain the fixed split centre. Update the plan test.

**Repair test.** `Σ=∅`, `N=1`, `M={0}×S¹`, `A_c={(t,ct)}` and `M A_c=G` for every c, whereas the split lines differ. This distinguishes the subgroup from the extra datum, instead of just repeating its definition.

## Verified sound

### Principles and mechanical checks

This remains an extension of the base in the direction of real parabolics. No route-specific prime restriction, executable algorithm, sorry'd data or set_option was found in the reviewed design. No copied passage from the readable sources was found. The diagram/central component cases are retained, not excluded. The main-library duplication and supply issues are R01, R05 and R06. No suspicious file/source instructions were acted on.

The dependency command required in the brief completed with:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after MordellLawrenceVenkatesh (the intake inserts it when its design is accepted)
depcheck: 233 roadmaps, 2095 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Separately, all 42 target IDs resolve in the plan's target graph, with 99 target-to-target edges and no cycle. This check does not model the backwards consumer assertion R06. All Needs lines and the supplier list were read. All nine layers have Examples and Dependencies. The README has the required opening and major sections. Checks are substantive except for the explicit defects above; the missing third definition Check is R12.

A fresh `roadmaps resolve` run found no unresolved roadmap citation or name, but explicitly reported that it did not check names outside TauCetiRoadmap because it could not locate pinned Lake packages in its configured host context. The direct reads of the supplied pinned checkouts below supply that audit; the resolver's clean output is not evidence against R01's changed signatures.

### Computed adversarial table

Rows cover every seeded section, the headlines and every finding. The unchanged computed rows of the previous review were used only as supporting evidence, not for its uncomputed “context/generality” row. The broad character-kernel and arbitrary-X claims were retested despite the previous positive rows. Values below use the intended real Lie-group objects; R01 still requires reconciling their supplier types.

| Statement | Instances | Computed sides/values | Result and change |
|---|---|---|---|
| Conventions: root and flow signs | GL₂, X=diag(1,0), Y=E₁₂ or E₂₁ or 0 | `[X,E₁₂]=E₁₂`; conjugates `I+e^(−t)E₁₂`, `I+e^tE₂₁`, I; β(X)=1,−1,−1 | Signs correct; zero exception R08. |
| §1.1 form and polar object | GL₂; SU₂ with inner involution; trivial group | trace-form values 2 and −2; SU₂ images `(1,πY)` and `(−1,0)` both −1; zero algebra polar map is one point | Intended positivity correct; current-base non-example R01. |
| §1.1 components and centre | ℝ^×; ℝ⋊C₂ | K={±1} and K={0}⋊C₂, respectively; π₀ has 2 elements in each; exp on split ℝ is injective; second group's component acts by −1 | Supports component discussion and R03. |
| §1.2 involution conjugacy | sl₂, g=diag(2,1/2); compact su₂; zero algebra | σ′σ=Ad(diag(4,1/4))=exp(2ad X), X=diag(log2,−log2); compact and zero cases X=0 | Formula and uniqueness pass these cases. |
| §1.3 global involution conjugacy | θa on ℝ⋊C₂; tilted ℝ×S¹ | `c_b θ₀ c_b⁻¹(t,1)=(−t+4b,1)`, b=a/4; tilted split line is {(x,cx)} and inner conjugation is identity | Involution statement passes; pair wording must lose B-equality, R02. |
| §2.1 nonreduced roots | BC₁, BC₂, A₂ | indivisible roots ±λ; BC₂ indivisible B₂ has 8 chambers; A₂ has 6, wall stabilizer order 2; coroot(2λ)=coroot(λ)/2 | Reduced-subsystem route works; native Base is stricter than informal nonreduced bases. |
| §2.2 maximal abelian subspaces | GL₂; compact group | symmetric space dimension 3, maximal commuting diagonals dimension 2; π/4 rotation moves off-diagonal traceless line to diagonal line; compact p=a=0 | Geometry passes; reconcile base ownership, R05. |
| §2.3 two Weyl groups | SL₂; O(1,1) | SL₂ rotation by π/2 acts by −1; W order 2. In O(1,1), dYd=−Y, Σ=∅, W=1, W_G=C₂ | Faithful actual quotient must retain central action. |
| §2.4 component equivalences | GL₂; O(1,1); Aut(sl₃); compact O₄ | M meets 2/2, 2/4, 1/2 components respectively; W_G orders 2,2,12 vs root W orders 2,1,6; compact a=0 and M=G | Equivalences pass; compact O₄ also separates component condition from inner-complex axiom. |
| §2.5 whole-triple conjugacy | ℝ^× with B,2B | same θ,a=ℝ,Σ⁺=∅; transported B(1,1)=1 versus B′(1,1)=2 | False, R02. |
| §2.6 Iwasawa adapter | SL₂; compact group | closed chamber t≥0 spans a; open chamber omits 0; using both root spaces gives 1+1+2=4>dim sl₂=3; compact A=N=1 | Values correct; actual supplier has more fields, R01. |
| §3.1 centralizers | GL₃, s=ℝdiag(1,1,−2); s=0,a | centralizer dimensions 5,9,3; roots respectively ±α₁, all A₂, none; each is transpose-stable | Pass; under component condition its inheritance uses wall stabilizers. |
| §3.2 M,A,N and §3.3 minimal Langlands | SL₂, `[[-2,3],[0,−1/2]]`; GL₂ | factors −I, diag(2,1/2), I−(3/2)E₁₂ multiply to the input; b⊥=ℝE₁₂, whereas nilradical(b)=ℝI⊕ℝE₁₂ | Order and B-orthogonal definition pass. |
| §3.3 compact quotient and normalizer | SL₂; O(1,1); compact group | K/M=S¹/{±1}=ℙ¹; O(1,1) has [G:P]=2 and N_G(P)=G; compact P=G | Self-normalization correctly requires the component condition. |
| §3.4 conjugacy class | SL₂; tilted ℝ×S¹ | point stabilizers form one conjugacy class; for every c, M A_c=G while p_c differs | Group conclusion survives R02; add third Check, R12. |
| §4.1 fixed points | SL₂; SL₃; O(1,1) | 2 eigenlines; 6 coordinate flags; 2 discrete points with A acting trivially | Repaired count is |W_G|, not |W|. |
| §4.2 cells and dimensions | SL₃; SU(2,1); O(1,1); Aut(sl₃) | dimensions 5,6,6,7,7,8; SU big cell 5+(2+1)=8; O cells P,dP both dimension 1; Aut has 12 cells, 2 open | Broader W_G theorem passes these disconnected tests; unique dense cell needs the condition. |
| §4.3 real Tits system | SL₂; compact group; Aut(sl₃); GL₀ | SL₂ has 2 cells and a non-normalizing reflection; compact simple set empty; two root reflections generate order 6, not Aut's 12; GL₀ is trivial but cited glTitsSystem is GL₁ | Main theorem passes; bounds in R11. |
| §5.1 standard root sums | SL₃; BC₁ | subset dimensions 5,6,6,8; at full BC₁ subset, −2λ is included; a_Π is split centre | Definitions exclude truncated-root wrong model. |
| §5.2 classification | sl₃; sl₂(ℂ) as real; compact group | adding E₃₁ forces `[E₁₂,E₃₁]=−E₃₂`; `[iH,zE₂₁]=−2izE₂₁`; compact q₀=g gives 1 over-algebra | No partial negative-root-space counterexample; 4,2,1 standard choices. |
| §5.3 eigenspaces | diag(1,1,−2) in sl₃; X=0 | simple-root values 0,3; nonnegative sum dimension 6 and kernel dimension 4; at 0 sum=kernel=g dimension 8 | Chamber direction and wall convention pass. |
| §6.1 standard groups | GL₃; O(1,1) | Weyl-subgroup orders 1,2,2,6; O normalizer of q₀=g is G, strictly larger than P | Correct conditional normalizer/classification. |
| §6.2 character kernel | ℝ^×; GL₂; ℝ⋊C₂ | ⁰L={±1}; |det|=1; all characters trivial in last case, so ⁰L=L and Lie dimension 1 versus displayed 0 | False in retained disconnected generality, R03. |
| §6.3 standard Langlands | GL₃, J={α₁}; J=∅,Π; SU(2,1) | L=GL₂×GL₁, A dimension 2, M dimension 3, N dimension 2, total Q dimension 7; endpoint N dimensions 3 and 0; SU minimal Q dimension 1+1+3=5 | Internal intersection proof passes; use corrected §6.2 specialization. |
| §7.1 abstract conjugacy | S₃=GL₂(𝔽₂), B=< (12) >; rank 0 | for J=∅, conjugate B⊆B iff g∈B (2 choices); for full J, all 6 g qualify; rank 0 B=G | Tests both directions without commutativity or a field restriction. |
| §7.2 parabolic types | SL₃; compact; O(1,1) | 4 types: flag, plane, line, whole; compact 1 type; O has Lie(P)=g but N_G(g)=G≠P | Conditional correspondence passes. |
| §7.3 dynamics | GL₂; X=0; Aut(sl₃) at X₀ and X₁ | GL₂ c-entry scales e^t, so c=0; X=0 gives Q=G,N=1; Aut gives Q(X₀)=P⊔τP=Q_∅ but Q(X₁)=P⊊Q_∅ | New regular formula passes; last sentence fails, R07. |
| §8.1 self-adjoint model | GL₂; discrete diag(2^k,2^(−k)); upper unipotent | Lie algebra dimensions 4,0,1; latter two polar source dimensions 0 and 0 against nontrivial groups | Finite-components and transpose tests work; construction imported by R05. |
| §§8.2/8.2b/8.2c definitions | GL₂, X=diag(1,0), g=[[2,3],[0,5]] | limit diag(2,5); l u has u₁₂=3/2; u l would need u₁₂=3/5; X=0 gives P=L=G,U=1 | Definitions and multiplication order pass. |
| §8.2d factorization | OᵀSL₂(ℤ)O, X=diag(1,0); GL₂ skew X | first limit has conjugated off-diagonal 3/2 outside integer group; skew case P=GL₂, U=1, L={aI+bX} | Arbitrary symmetric theorem false, R04; symmetry is also necessary. |
| §8.3 component predicate | O(p,q), p>q≥1; p=q≥1 | M block determinant pairs `(∏ε·det k′,∏ε)` attain 4 pairs in first case and 2 in second | Agrees with abstract condition. |
| §8.3b minimal matrix Langlands | SL₂; O(1,1); Aut(sl₃) | SL₂ b/a factor; O dynamic P is normal index 2; Aut regular dynamic P contains τ outside MAN | Conditional assertion and repaired choice MAN pass. |
| §8.3c matrix Bruhat | O(1,1); Aut(sl₃) | cells 2 and 12 with MAN; same double coset gives k⁻¹k′∈M; dynamic replacement identifies 1 and τ | Hypothesis-free MAN statement passes. |
| §8.3d subgroup classification/iff | SL₃ X,2X with X=diag(1,1,−2); O(1,1) | both SL centralizers dimension 4 and same block P; O X=0,Y nonzero have same 1D centralizer but Q=G versus P | Condition is essential and sufficient on these tests. |
| §8.3e maximal abelian conjugacy | GL₂; compact | spectral rotation gives equal 2D commuting subspaces; compact both 0, k=1 | Pass, subject to base ownership audit R05. |
| §8.3f new eigenspace headline | SL₃; GL₂ scalar 0 and I | four sums dimensions 5,6,6,8; X,2X same 4D centralizer; scalars both centralize all 4D gl₂ and give the whole sum | Nontrivial headline, not a boundary Check disguised as a theorem. |
| §8.3g new Tits headline | GL₂; O(1,1); compact | GL₂ W=C₂; O normal P makes every sPs⁻¹=P, violating axiom; compact S=∅ | Nontrivial conditional headline. |
| §9.1 real points/components | GL₂; SO(2,1); O(1,1) | GL₂ sign matrix meets negative determinant; SO M={1,diag(1,−1,−1)} meets both components; O₂(ℂ) disconnected and Ad(d)=−1 on abelian Lie algebra, not inner | New connected-complex proof route passes; order issue R06. |
| §9.2 comparison and walls | GL₂ λ=(t,1); SL₂ λ=0; SO(2,1) | upper triangular P; trivial λ gives Q=L=SL₂,U=1; hyperbola torus S(ℝ) has 2 components and A is identity component | End statements pass; proof inclusion fails at wall, R09. |
| §9.3 complexification iff | gl₂ trace-zero Borel, scalar line, full upper Borel; su₂ | dimensions 2,1,3; first contains semisimple Borel but omits centre; scalar line has centre but no sl₂ Borel; upper Borel has both; compact full g has both | Repaired iff passes both independent negative controls. |

No characteristic-p, DVR, residue-field or denominator specialization is claimed by the real analytic targets. The abstract Tits target was checked over S₃ and in rank zero; the cited algebraic comparison is over ℝ. Natural subtraction does occur in the GL library comparison and was tested at zero (R11). There is no hidden division by zero in the SL₂ factor b/a because a is an invertible diagonal entry. Rescaling B, omitting the centre, reversing the conjugation direction and replacing MAN by a larger dynamic group were explicitly tested as wrong models.

### Source audit

All eight cited works have manifest entries. Four cached open texts were read at the cited passages; four books are settled uncertified and were not requested again. There is no new missing-reference request. No publication-version theorem numbering was inferred from a preprint: the manifest identifies arXiv v4 for Brown–Fisher–Hurtado, v2 for Brown–Rodriguez Hertz–Wang, and v2 for Bradlow et al.

| Seeded target(s) | Locator and what was actually verified |
|---|---|
| 1.1, 1.2, 1.3 | Knapp VII §2 / VI §2, as recorded; book unavailable. Mathematical form/scale/polar tests above; source hypotheses not certified. |
| 2.3, 2.4, 2.6 | Knapp VI §5, VII §5, VI §4 respectively; unavailable. Actual base and native contracts checked; §2.6 drift is R01. |
| 3.1 | Knapp VII §2; unavailable. Centralizer root sums checked on GL₃ and at s=0,a. |
| 4.1, 4.2 | Knapp VII §4 and Warner I §1.2; unavailable. Disconnected W_G extension independently tested; do not claim those books were read for that extension. |
| 5.1 | `brown-rodriguezhertz-wang2022 line 122`, equation (1) at lines 138–141, preprint p.3, supports the root-sum convention. Lines 124–129 explicitly assume connected semisimple G with finite centre. Reductive/disconnected extensions need this roadmap's arguments, not an expanded attribution to that passage. |
| 6.3 | Knapp VII §7, Wallach I §2.2, Warner I §1.2; unavailable. Repaired internal proof tested on block matrices and both endpoint subsets. |
| 7.2 | Knapp VII §7 unavailable. `brown-rodriguezhertz-wang2022 line 154`, preprint p.4, records the standard group/algebra correspondence only in its semisimple finite-centre setting. |
| 8.1 | Wallach I §2.1, Knapp VII §2 unavailable. ALS.F.1 read at #871 and base LieGroups Layer 9 read on main. Native polar uniqueness opened at the pin. |
| 8.2 | Knapp VII §7 unavailable; Brown–Rodriguez Hertz–Wang §1.2 does not state the new arbitrary-symmetric-X intersection theorem. R04 refutes that claimed extension. |
| 9.1 | Knapp VII §2 unavailable. Borel–Tits Theorem 14.4 verified at `borel-tits1965 line 3750`, printed p.146, for connected real algebraic G; it is only the stated remark. ALS.F.1 and MordellLawrenceVenkatesh §3.10 support the replacement route. |

Additional source checks: Borel–Tits 4.15 is at lines 1488–1524, pp.90–91; 5.9 at 1802–1807, p.98; 5.17–5.20 at 1924–1954, pp.101–102; 9.3 at 2938–2963, pp.126–127; 14.7 at 3775–3821, pp.147–148. The first is an ordering-based algebraic parabolic construction, not an assertion about arbitrary ambient symmetric matrices. Section 14.7 explicitly starts with semisimple groups; the reductive extension must retain the split centre as this design does. Proposition 9.3 supplies the intended compactness implication in the gap. Corollary 5.18's inclusion orientation agrees with §7.1 after matching its two subset labels.

`brown-fisher-hurtado2022 line 499`, equation (1) at 516–521, preprint p.11, and the group correspondence at 529–534, p.12, agree with the other paper's root-sum convention since span(−Π′)=span(Π′). Both explicitly cite Knapp Proposition 7.76; `brown-rodriguezhertz-wang2022 line 143` also cites Lemma 7.73. This corroborates the numbers, not the inaccessible book's complete statements. `bradlow-collier-garciaprada-gothen-oliveira2024 line 72` (p.2) and lines 197–210 (p.5) support the consumer reference to Θ-positive parabolics.

### Pinned declarations opened and ownership resolved

The hashes in the design agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are library pins; the changed roadmap on main is a separate supplier, not a pinned library declaration.

- Mathlib `LieGroup`, `Geometry/Manifold/Algebra/LieGroup.lean:72`, records smooth multiplication and inversion; finite dimension and the chosen model are separate inputs. `LeftInvariantDerivation`, `Geometry/Manifold/Algebra/LeftInvariantDerivation.lean:47`, is the derivation carrier. `LieDerivation.IsKilling.exists_eq_ad`, `Algebra/Lie/Derivation/Killing.lean:108`, requires finite module and nondegenerate Killing form. The finite-dimensional real semisimple use meets those requirements.
- `RootPairing.Base`, `Mathlib/LinearAlgebra/RootSystem/Base.lean:68`, has both root and coroot additive-monoid conditions. In BC₁ no singleton support generates both λ and its half-coroot counterpart. `RootPairing.weylGroup`, `WeylGroup.lean:55`, is the reflection-generated group. `RootPairing.Base.existsUnique_map_eq`, `TauCeti/LinearAlgebra/RootSystem/Weyl/Bases.lean:170`, and `TauCeti.stabilizer_eq_closure_wallReflections`, `FundamentalDomain.lean:201` (hypotheses :148), support the reduced-system imports.
- `DoubleCoset.doubleCoset` and `DoubleCoset.Quotient`, `Mathlib/GroupTheory/DoubleCoset.lean:37,79`, are set/group quotients; they provide no topology. `Module.End.eigenspace`, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, is the kernel of `f−μ·1`, including all zero-eigenvectors. The new eigenspace headline has a native carrier.
- `Matrix.exp_transpose` and `Matrix.exp_conj`, `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean:113,185`, support matrix conjugation; the latter requires the conjugating matrix to be a unit. `Bornology.IsBounded`, `Topology/Bornology/Basic.lean:101`, depends on the chosen bornology; §8's expression is in the finite-dimensional ambient matrix space. `ConnectedComponents`, `Topology/Connected/Clopen.lean:500`, is the quotient by connected components, not a finiteness assertion.
- `TauCeti.TitsSystem`, `TauCeti/GroupTheory/TitsSystem/Basic.lean:50`, and its full axioms were opened; no field, finiteness or topology assumption is present. In particular its last axiom is noncontainment of a conjugate of B in B. The finite real examples satisfy this stronger, correct form.
- The Bruhat imports resolve in `TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean:100` and `Bruhat/Uniqueness.lean:35,99,111`: `bruhatCell`, injectivity, disjointness and unique membership. The parabolic imports resolve in `Parabolic/Basic.lean:48,152,160`, `Classification.lean:114,146`, `Normalizer.lean:66,77`, `DoubleCoset.lean:199`, `TitsSystem.lean:110`, plus `RankOne.lean:63` and `Coxeter.lean:178`. The double-coset equivalence's native direction is Weyl classes to group classes; its inverse gives the README's displayed equivalence. No duplicate abstract classification is planned. Searches of these files found no general transporter theorem identical to §7.1; that remains legitimate new abstract work.
- The GL-specific imports resolve in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195,270`, `Iwasawa.lean:224,280`, `RestrictedWeylGroup.lean:230`, `Bruhat.lean:218`, `Cartan.lean:65`, `MaximalCompact.lean:158`. Their fields and factor orders were opened. `glTitsSystem` uses Fin(n+1) and nontrivial field units, as in R11. Ambient polar uniqueness is `TauCeti/Analysis/Matrix/Polar.lean:76`.
- `TauCeti.Cocharacter.parabolic`, `limit`, `levi`, `unipotent`, `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154,208,245,277`, use extension of `λ(T)gλ(T)⁻¹` over zero. With λ(t)=diag(t,1), the lower entry is t⁻¹c and extension requires c=0, matching the analytic sign. `TauCeti.borelSubalgebra`, `TauCeti/Algebra/Lie/Weights/Borel.lean:439`, is the actual Cartan-plus-positive-root subalgebra, not a free predicate.

Cross-roadmap citations were resolved afresh, using main for existing roadmaps and the supplied heads for new ones:

- LieGroups on main: Layers 0,1,2,3,4,7,9 exist. Its native exponential/Ad/Lie-functor contracts are in README:44–53 and :446–456; integration is Suggested.lean:196. Layer 9's changes are R01/R05. The current Iwasawa fields were read, not inferred from the old review's line numbers.
- RootSystems on main: its Exact supplier contracts record the finite reduced root theory; its own layers are not prerequisites after F05's repair. Its README shape and that of LieGroups and ReductiveGroups were read as house-style examples.
- ReductiveGroups on main: Layer 7 at README:2253 supplies the actual algebraic Borel/parabolic/cocharacter and relative-root framework; Layer 7b at :2608 includes the parabolic double-coset theorem at :2647 with common-torus hypotheses. Its current rational-point Tits construction at :2343 is for a split maximal torus/Borel. The design should not treat this as an already-provided nonsplit rational Bruhat theorem. No target here needs that stronger import: the Lie-theoretic Bruhat theorem is proved here and the cocharacter/root comparison is the relevant Layer 9 input. The two declared gaps are still distinct from these imports; R10 concerns the wording sent to the supplier, not their present absence.
- ArithmeticLocallySymmetricSpaces, #871: ALS.F.1 at README:580–604, ALS.0.1 at :1167–1230, ALS.0.2 at :1246–1285 and ALS.0.3 at :1287–1300. The two resolver leads `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse` are planned supplier names at :582 and :1187. They are not falsely reported as missing native declarations.
- MordellLawrenceVenkatesh, #1231: README:1461, §3.10, explicitly states connectedness of complex points of a connected locally finite-type complex scheme. A connected real algebraic group in characteristic zero is geometrically connected, so its base change is a valid application; this does not assume the real point group is connected. R06 records the effect of this legitimate new dependency.
- AutomorphicFormsOnReductiveGroups, #1037: §2.3a at README:372–390 owns the algebraic-real specialization and its comparison. §§2.3–2.4 consume parabolic data. The head has not imported this candidate; R06 is not resolved by its proposed consumer paragraph.

The board-packages index was read first; its three listed active packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. The available board README tree was searched by object. The required `roadmaps grep` search across main/open heads for minimal parabolics, Langlands decomposition, self-adjoint linear groups, dynamicParabolic, conjugate standard parabolics and complex connectedness returned 52 matching lines. Relevant owners were opened rather than inferred from names. The overlap file has no shared-head conflict or dropped/new-only cited ID. Its nearest roadmaps were checked: FlagVarieties on main and #2114 concerns algebraic groups over algebraically closed fields; ShimuraData #1038 concerns algebraic cocharacters/Hodge filtrations and uses the native dynamic construction; ReductiveGroups was checked on main, not consumed from revision #1332. Their carriers do not duplicate the real dynamic theorem. The substantive overlaps are those in R05/R06. Open work not represented by the supplied index/files was not independently searched for outside the roadmap tools.

### Headline and Lean acceptance audit

No `packages/LieGroupsPartII/Suggested.lean` exists. This is a design review, so no absent-file, padding or missing-docstring finding is raised. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run; there is no build result, warning-only claim or mechanical #check result to report. The one-tactic probe has zero sorried declarations to test.

The Summary's headlines are: Cartan-involution/data and Iwasawa-triple conjugacy; minimal MAN decomposition; Bruhat cells; the real Tits system; standard parabolic subalgebra and subgroup classification; full standard-parabolic Langlands decomposition; general parabolic type/Lie-algebra correspondence; dynamic descriptions; the self-adjoint model; and the real-algebraic comparison. The conjugacy/form and arbitrary-X statements need R02/R04 before being made acceptance tests, and supplier-owned material must be imported after R05/R06.

There are 13 explicit planned own identifiers: six definitions (`IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi`, `LinearComponentCondition`) and seven theorem names (`dynamicLevi_decomposition`, `minimalParabolic_langlands`, `bruhat_decomposition_linear`, `eq_dynamicParabolic_of_le`, `exists_conj_maximalAbelian`, `exists_eq_nonnegEigenspaces_of_le`, `exists_titsSystem_linear`). They resolve to design targets, not declarations in a nonexistent acceptance file. The new eigenspace and Tits headlines use native carriers opened above and are substantial statements. The matrix definitions can have genuine bodies; no sorry'd data is necessary. At package stage all surviving statable headlines, including the full parabolic Langlands result rather than only a weaker LU factorization, need signatures; omissions must name the precise missing carrier in the module docstring. General finite-dimensional semisimple involution conjugacy also has native Lie-algebra/endomorphism carriers and must not be discarded merely because it is not a matrix-group statement. These are acceptance obligations, not a claim that an unwritten Lean file has passed.

## Not verifiable

- `knapp2002`: VI §§2,4–5; VII §§2,4–7, including Lemma 7.73 and Proposition 7.76. Settled uncertified; no legal text supplied. The manifest notes the edition/DOI distinction. The precise pages and full hypotheses of those book passages were not checked, and the indirect citations do not certify them.
- `warner1972`: I §§1.1–1.2; `wallach1988`: I §§2.1–2.2; `bourbaki-lie4-6`: IV §2 nos.1–7 and VI §1. All are settled uncertified, so no repeated source request was made.
- Lean elaboration, elaborated binder comparison and tactic probes: unavailable in this lane and no Suggested.lean exists. Mathematical witnesses here are calculations, not Lean proofs.
- Ownership against unprovided/unindexed open pull-request contents: not checked beyond the supplied roadmap tools and board index. No independent pull-request discovery or GitHub write was performed.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p.3, line 134: the source says simplicity excludes any linear combination of other positive roots; it should be nonnegative integer combinations; affects a stated result.
