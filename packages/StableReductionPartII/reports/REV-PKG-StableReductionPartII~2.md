<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1599#issuecomment-6403203993 -->
Review (claude) of 73beb1c

Verdict: needs_changes

1. **F01** (P2) The pairing interchange sign is attributed to graded determinant signs, which give a different sign

   **Location.** `packages/StableReductionPartII/README.md:167`: "its canonical permutation map need not be the ordinary identity on an equal argument: the self-interchange on ⟨L,L⟩ is (−1)^deg(L) … A construction which forgets all determinant signs before producing these comparison maps fails the odd-degree test." Also lines 34, 148, 155, 9624, 9629, 9632.

   **Claim.** With ⟨L,M⟩ defined as `d(L⊗M)⊗d(O)⊗d(L)∨⊗d(M)∨` in graded lines (line 165), the graded permutation gives the self-interchange (−1)^deg(L); so −1 on ℙ¹ for O(1) and +1 on ⟨ω,ω⟩ for every g≥2.

   **Witness.** The graded line d(L)∨ has grade −χ(L). Permuting the two factors d(L)∨⊗d(L)∨ under the Knudsen–Mumford rule (−1)^{ab} gives (−1)^{χ(L)²}=(−1)^{χ(L)}=(−1)^{deg L+1−g}, and the swap on L⊗L is the identity of a rank-one sheaf. On ℙ¹ with L=O(1): χ=2, sign +1, not −1. On a stable genus-2 curve with L=ω: χ(ω)=g−1=1, sign −1, not +1. The two signs agree exactly when g is odd. The sign (−1)^deg(L) is Deligne's symbol-based symmetry (mc5-deligne1987 line 1685, §6.2 p. 142, the OCR truncates the value) and Eriksson–Freixas Proposition 6.1(2) (mc5-erikssonfreixas2024 line 2894: [σ]=(−1)^κ with κ=∫c₁(L) for n=1); the same paper uses (−1)^{deg f} for ⟨O(1),O(1)⟩ on a ℙ¹-bundle over a degree-deg f finite cover (line 4335), where the graded permutation is (−1)^{(2 deg f)²}=+1. So the canonical symmetry of the sources is the graded permutation multiplied by (−1)^{χ(O_C)}=(−1)^{1−g}, and the README's justification by determinant signs is false in the main case g=2.

   **Repair.** In the Conventions (line 34) and the integral-pairing contract (lines 148, 167) say that the interchange is Deligne's symmetry constructed from symbols and norms (Deligne §6.2, EF Proposition 6.1(2)), state the law "canonical interchange = graded permutation of the four determinant factors times (−1)^{χ(O_C)}", and keep the two Checks as its witnesses, adding the negative control "the graded permutation alone gives +1 for O(1) on ℙ¹ and (−1)^{g−1} for ⟨ω,ω⟩". In §5.14 (line 9624) replace "+1 because the dualizing degree is 2g−2" by the same two-step statement. In gap:integral-deligne-pairing (line 84) ask the supplier for "the permutation isomorphism with Deligne's sign (−1)^{deg L_i deg L_j}" rather than "graded permutation laws". Tested on the refuting instance: with the law stated, ℙ¹/O(1) gives (+1)·(−1)^{1}=−1 and ⟨ω,ω⟩ at g=2 gives (−1)·(−1)^{−1}=+1, matching the Checks.

2. **F02** (P3) Ten declared gaps never appear in a `*Needs:*` line; §5.15 uses the alias CHOW-PIC

   **Location.** `README.md:9642`: "Supply gap CHOW-PIC: pairing Chern comparison and codimension-one Picard comparison for this smooth DM stack"; `README.md:9696`: "CHOW-PIC supplies an injective Pic⊗Q→CH¹⊗Q comparison".

   **Claim.** Every declared gap is a prerequisite of the targets that consume it.

   **Witness.** Counting `*Needs:*` lines that mention each slug: gap:perfect-arbitrary-base, gap:cm-duality-arbitrary-base, gap:source-dense-valuative, gap:finite-scheme-cover, gap:coarse-line-power, gap:graded-perfect-stack-descent, gap:integral-node-incidence, gap:proper-flat-picard-quotient, gap:minimal-siegel-all-characteristics, gap:stack-topology-boundary and gap:stack-chow-grr each occur 0 times (the first ten appear only in prose, e.g. §5.3 line 9474, §5.13, §6.17); CHOW-PIC is not a slug in `plan.json`, whose entry for the same content is `stack-chow-grr`.

   **Repair.** Replace CHOW-PIC by gap:stack-chow-grr in §§5.15 and 5.18 and add it to their `*Needs:*` lines; add each of the other ten slugs to the `*Needs:*` line of every target whose hypotheses or proof route names it (§5.3 gap:stack-topology-boundary; §5.13, §5.14, §5.20 gap:cm-duality-arbitrary-base; §5.14 gap:graded-perfect-stack-descent; §3.12 gap:integral-node-incidence; §6.17, §6.18 gap:minimal-siegel-all-characteristics; and so on). Test: the Needs count of every declared slug becomes at least one and the depcheck output stays at 0 problems.

3. **F03** (P3) Plan labels and source-issue identifiers remain in the prose

   **Location.** `README.md:9476`: "(sourceIssues E16–E17)"; `README.md:9480`: "with corrections E16–E17 below"; `README.md:9648`: "(confirmed E18)"; `README.md:2626`: "the comparison records signatures, not verified implementation proofs"; labels MC.0–MC.7 (47 occurrences, e.g. 9906 "MC.4/fine-level-scheme", 10024 "The MC.1 atlas"), A0 (8), DESCENT (5.6), node slugs in prose (sectionSplit, section-evaluation-scalars, fine-family-functions, section-picard-split, smooth-torelli, minimal-hodge-power, hodge-nef-big-application, pairing-chern-on-moduli, node-atlas-branch-comparison, branchTensor), "adapter" (53 occurrences, e.g. 837 "these specialized adapters").

   **Claim.** The README is timeless prose in standard vocabulary (house style; round-1 F09).

   **Witness.** None of MC.1, A0, DESCENT or CHOW-PIC is defined anywhere in the README (grep for a defining sentence returns nothing); E16–E18 are identifiers of the errata register, not of any source.

   **Repair.** Replace each label by the section it names (MC.1 → SchemeAndStackFoundations §4.15 atlas, MC.4 → §4.10 here, A0 → JacobianChallengePartII §§0.1–0.4, DESCENT → SchemeAndStackFoundations §1.1) or by a link to the local target; delete the E-identifiers (the source issues stay in the report, not in the README); delete line 2626's second sentence; replace "adapter" by "comparison" or "construction". Test: grep for `MC\.[0-9]`, `\bA0\b`, `E1[0-9]`, `adapter` returns nothing.

4. **F04** (P3) Checks that copy API bullets, in thirteen targets

   **Location.** `README.md:5769` (§2.295 Checks): "Projection at n after the limit comparison equals projection at n followed by Eₙ" is the first API bullet of the same target verbatim; likewise §§2.158, 2.159, 2.186, 2.187, 2.218, 2.255, 2.276, 2.302, 2.311, 2.345, 2.357, 2.393 (script: 13 targets with at least one Check equal to an API bullet; 2.276 and 2.295 all three). §2.123's three Checks restate its definition; §2.171's third Check restates its API.

   **Claim.** Each definition has three discriminating Checks (round-1 F07 asked for instances).

   **Witness.** A Check equal to a law holds for every carrier satisfying the law, including the wrong carriers F07 named (the zero submodule, a two-level truncation); it discriminates nothing.

   **Repair.** Replace each copied Check by an instance in the existing fixture C (A=ℤ, p=(2), R=ℤ[u,v]/(u²), N of rank 0, 1 and 2): for §2.295 the values at levels 2,3,4 of (2,3)⊗5 are (2,1), (6,1), (6,9) on both routes, the zero module gives 0 at every level, and an incompatible family (1 mod 2, 0 mod 4) is not in the limit. Test: the script's count of Checks equal to API bullets drops to zero.

5. **F05** (P3) Locator slips

   **Location.** `README.md:9934` (§6.9): "yuan-author-http §3.4, pp. 55–56"; `README.md:10243`, `10270`, `10315` (§§7.4, 7.5, 7.7): "mc4-stacks Lemma 108.9.1, tag 0DME"; `README.md:10445` and 174 other places: cache line numbers such as "(clm line 918)", "yuan-author-http line 1390".

   **Witness.** yuan-author-http line 1842 puts "3.4 Bigness in the geometric case" before the page-55 marker (line 1857) and its table of contents (line 42) says 54. The manifest entry mc4-stacks is "The Stacks Project: Cohomology of Schemes" (sources.toml 612); its cached text contains no tag 0DME (nor do the other cached Stacks chapters); Lemma 108.9.1 belongs to the Moduli Stacks chapter. Line numbers of the operator's extraction are not locators into the source.

   **Repair.** §6.9: pp. 54–56. Add a manifest entry for the Stacks Moduli Stacks chapter (or cite by tag 0DME under a key whose text contains it) and cite it in §§7.4, 7.5, 7.7. Remove "line N" cache coordinates from the README, keeping theorem, section and page.

6. **F06** (P3) Template residue and repetition

   **Location.** `README.md:837` and 343 further lines beginning "Here Only the displayed …", "Here No …", "The uses a common universe …"; `README.md:262`: "Import SchemeAndStackFoundations §0.9 and SchemeAndStackFoundations §0.9"; `README.md:9906` (§6.7): "Import JacobianChallengePartII §§6.1–6.3 and JacobianChallengePartII §§6.1–6.3"; `README.md:10121` (§6.21): "an constructed finite normalization"; §§2.106, 2.125, 2.126, 2.140, 2.141, 2.248–2.251 repeat their statement paragraph verbatim after the proof paragraph; §2.171's five API bullets each repeat the full 90-word setup paragraph.

   **Repair.** Drop the dangling "Here"/"The" prefixes (write "Only the displayed …", "A and N share a universe …"), delete the duplicated citations and repeated statements, and state the §2.171 setup once above its bullets.

Six findings: one P2, five P3. No P1. Both Lean headline theorems were checked on paper and hold over every commutative ring; the package is a legitimate continuation of StableReduction and is repairable by the fix worker.

## Round-1 findings, checked one by one

| Round-1 id | Status | Repaired passage (quoted at most 40 words) |
|---|---|---|
| F01 (P1) ownerless gaps | repaired | `design/plan.json` `gaps` has 28 entries, each with `supplier`, `section`, `needs`; `packages/StableReductionPartII/README.md` has 28 lines `What <Supplier> must provide (gap:<slug>)`; the two slug sets and the supplier names coincide (script join: 0 unmatched). |
| F02 (P1) one-gon owner | repaired | README 8672: "Import properness, smoothness, DM and the one-gon cusp from ModularCurvesPartII §§2.1–2.3 and 2.11; no new construction of generalized elliptic curves is made here." Resolved: ModularCurvesPartII §2.11 "Polygon-count stacks and decontractions" with `polygonCountStack` at its open head. |
| F03 (P1) collision coefficient | repaired | README §4.8: "the marked relative pluricanonical line on S′ is b*ω^m(Σa_iD_i)⊗O((m−Σ_(i∈I)a_i)E) … for k<0 it is that line tensored with I_p^(−k)"; the ℙ¹×ℙ¹ Check gives coefficient −2, I_p², degrees 2 and 0 (recomputed below); gap:weighted-collision-transport declared. |
| F04 (P2) duplicate requests | repaired | README 13: "`stableCurveDirectImage_nef` includes the curve-test criterion … `determinantQuotient_ample` includes the Grassmannian positivity argument"; README 180: "Use §3.5 `ModuliDescent.polarizedDescentComparison`"; README 227: "§4.1 `NormalizationExactSequence` … independently of a DVR model". All three resolved at the cited owners (below). |
| F05 (P2) surface contract | repaired | README 90: gap:positive-surface-twist now carries "smooth projective minimal surface S of general type … reduced effective Cartier divisor D whose connected components have genus at least two and whose normal line … is trivial … unless char(k)=2 and m=2, when it is at most one"; general type, pluricanonical comparison, weighted transport and low genus are four separate gaps; the C₂×ℙ¹ control is a Check (h¹=6, recomputed below). |
| F06 (P2) finite coordinates | repaired | README 56: "Use `TensorProduct.piScalarRight`, `TensorProduct.piScalarRightHom_tmul` and `TensorProduct.piScalarRight_symm_single` … lines 163, 139 and 175, directly." Verified at the pin. No target constructs the coordinates again (grep "Construct c" returns nothing). |
| F07 (P3) compatible-Hom Checks | repaired | README 4049: "Take A=ℤ, p=(2), R=ℤ[u,v]/(u²) … multiplication by 5 has h₂(1)=1 modulo 4, so it belongs to H_L and is nonzero. A zero-submodule carrier excludes it." The same pattern recurs elsewhere: R04. |
| F08 (P3) generic locators | repaired | Zero occurrences of "Mathlib modules named"; §2.152's successor cites knudsen2012 §3 pp. 11–13; sampled Mathlib line numbers (ten) all correct at the pin. |
| F09 (P3) stale prose | repaired, residue in R03 | Zero occurrences of "eight geometric stages", "remain partial", "suggested file states", "missing inverse"; README 60 cites `inv_mk` (line 104) and the CommGroup instance (line 142), both verified. Source-issue identifiers E16–E18 survive: R03. |
| F10 (P3) build order | repaired | Script over 594 numbered targets: 1344 anchor edges, 0 forward or self edges, 0 unresolved anchors (three anchors with an em dash resolve once GitHub's slug rule is applied), 0 cycles. |

## Verified sound

**Principles.** Read the Summary, Scope and ownership, Conventions, all 28 supplier contracts, How to read the build, the fifteen sampled targets in full, §§2.0–2.1, 2.44–2.45, 2.123, 2.141, 2.172, 2.388, 2.474–2.475, 3.12–3.13, 4.5–4.9, the Layer 4 subsection "Positivity, collisions and a single integral determinant", 5.5–5.6, 5.13–5.21, 6.8–6.9, 6.11–6.12, 6.16–6.17, 6.20–6.22, 7.3–7.7, Downstream consumers and Worked examples. No route-specific prime exclusion, no re-planned roadmap (the one-gon, polarized descent, nefness, normalization and Jacobian objects are imported by owner and section), no copied passage, no algorithm, no `set_option`, no sorry'd data, no LaTeX delimiters, no pull-request numbers, no process narrative beyond R03. The polynomial theorems admit the zero ring and repeated roots; the geometric statements carry their nondegeneracy and finiteness hypotheses.

**Elaboration.** From the content checkout (HEAD 0e8c6f1; pins Mathlib 6b7abb3c, Tau Ceti a91d3aaf) `lake env lean` on `packages/StableReductionPartII/Suggested.lean`: exit 0, exactly two warnings "declaration uses sorry" at lines 79 and 95. The file imports only `import Mathlib`, so no `TauCeti.*` module build was needed. A scratch file with `#check @name` for all seven declarations elaborated; every type agrees with the README (A with its CommRing instance and γ,δ,s,t in all five definitions; the exactness theorem keeps N with AddCommGroup and Module A N in its own universe; the reflexivity theorem names the actual quotient ring, section ideal and ring-linear dual). Nothing changed. One-tactic probes `simp`, `rfl`, `infer_instance` on a scratch copy all fail on both theorems; there is no library lemma closing either, so no padding. The seven Lean names occur in the README (one each); no `lemma`, no `example`, no extra import.

**Headline inventory.** Two statable headlines are stated (universal exactness of the node-section complex with its transposes; reflexivity of J and J* over every commutative base). The module docstring names nine geometric headlines as not statable and the carrier each lacks (pointed stable moduli stacks, coherent Ext, clutching and stack normalization, polarized relative Jacobians, determinant of cohomology and Deligne pairing, Siegel compactifications, relative Picard). At the pins Mathlib has `AlgebraicGeometry.Scheme` and no moduli stack of curves; Tau Ceti has `FamilyOfCurves` (`TauCeti/AlgebraicGeometry/Curves/Family.lean:56`, no genus or stability) and `LineBundleClass` (absolute classes only). No statable headline is missing and none is forced through a stand-in.

**Adversarial table.** Fixtures: R=A[u,v]/(F), F=u²+γuv+δv²−(s²+γst+δt²), c=u−s, d=v−t, b=u+s+γt, a=δv+δt+γu, Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, J=(c,d). Fixture P: γ=δ=s=t=0, R=A[v,u]/(u²). Fixture C: A=ℤ, p=(2), R=ℤ[u,v]/(u²), Â=ℤ₂, Qₙ=R/2ⁿ.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| ΦΨ=ΨΦ=F·I (nodePhi, nodePsi) | symbolic | (0,0) entry ad+bc=δv²−δt²+γuv−γut+u²−s²+γtu−γts=F; off-diagonals −ab+ba=0, −cd+dc=0; Ψ=adj Φ | correct, no change |
| nodeSection_universallyExact, both directions and transposes | arbitrary A, arbitrary A-module N; zero ring; N=ℤ/2 over ℤ; fixture P over 𝔽₂ | R⊗_A N=N[u,v]/F·N[u,v] by right exactness; F is monic of degree 2 in u, so F·m=0 forces m=0 on N[v][u] (top coefficient m_d survives); for Ψx=0 lift x̃, Ψx̃=Fy, Fx̃=ΦΨx̃=FΦy, so x̃=Φy; transposes use ΦᵀΨᵀ=(ΨΦ)ᵀ=F·I. Fixture P: ker Ψ=im Φ={(uα, vα+uβ)} with Φ(−β,α)=(uα,vα+uβ) | true for every A and N, no flatness; headline sound |
| ker P_J=im Ψ (§2.142) | arbitrary A; fixture P; A=k, s=1, γ=δ=0, char≠2 | cx=dy gives c(ax+by)=(ad+bc)y=Fy=0 and d(ax+by)=Fx=0; d=v−t is monic in v on R free over A[v], so ax+by=0 and (x,y)∈ker Φ=im Ψ. Fixture P: ker{ux−vy=0}={(vy₁+ux₁,uy₁)}=Ψ(y₁,−x₁). Split case R=k[v]×k[v]: component u=1 kernel k[v]⊕0 = im Ψ, component u=−1 kernel {(−vy/2,y)} = im Ψ | correct; eJ sends [1,0],[0,1] to c,−d as the Checks say |
| pointedSection_reflexive | arbitrary A; zero ring; fixture P; ℤ/2 over ℤ as negative control | J≅coker Ψ with 0→J→R²→Ψ R²→Φ R² exact and dual sequence R²→Ψᵀ R²→J*→0 exact (λ∘Φ kills im Ψ, so λ∘Φ∈ker Ψᵀ=im Φᵀ); hence J**=ker Ψ=J via evaluation, and J*=coker Ψᵀ is reflexive by the transposed argument. Zero ring: all modules 0. ℤ/2 over ℤ: dual 0, not reflexive, so the theorem is not a generic shortcut | headline sound |
| Canonical retraction p(r)=r−ι(ev r) (§2.44) | ℚ, γ=1, δ=s=t=0: r=u, z=1; ℤ/4, s=1 | p(1)=0, p(u)=u, p(u·1)=u≠u·p(1)=0; p(u)=u−1 over ℤ/4; R=ι(A)⊕J as A-modules since R is A-free on vⁿ, uvⁿ, so J is A-projective and M⊗J→M⊗R is split injective for every M | correct |
| B(e,n) parity (§2.171) | fixture P, (1,0) | B(false,0)=Ψ: Ψ(1,0)=(v,u), second coordinate u; B(true,0)=Φ: Φ(1,0)=(0,−u), second coordinate −u | matches Checks |
| d(true,0)=L_Φ (§2.32) | resolution of D versus J | P_D(z)=z₀incl−z₁ε with ε(c)=−a, ε(d)=b kills Φ(α,β): c(aα+bβ)+a(−cα+dβ)=Fβ=0 and −d(aα+bβ)+b(−cα+dβ)=−Fα=0; fixture P: ε(u)=0, ε(v)=u | consistent with ker P_D=im Φ; the phase "true" resolves D |
| Positive Hom exactness (§2.387) | N=R⊗_A M, M arbitrary | Hom_R(R²,N)=N² and precomposition by Φ is multiplication by Φᵀ, exact by the transposed universal exactness | correct, degree 0 excluded as stated |
| Finite comparison Qₙ⊗_A N≅Qₙ⊗_Â N (§§2.250, 2.295) | p finitely generated; p not finitely generated | Qₙ is an A/pⁿ-module since ι(pⁿ)⊆mⁿ; Qₙ⊗_A Â=Qₙ⊗_{A/pⁿ}(Â/pⁿÂ) and Â/pⁿÂ=A/pⁿ needs p finitely generated (`AdicCompletion.pow_smul_top_eq_ker_eval`) | the finite-generation hypothesis is exactly right |
| Independence of retraction (§2.359) | N a retract of Fin(r)→Â and of Fin(r′)→Â | R̂⊗N↪R̂⊗F=R̂^r↪∏Qₙ^r since R̂⊂∏Qₙ; two lifts agreeing on all Pₙ agree | correct |
| Transported action (§2.373) | a∈A, x∈L | E is A-linear, so E(a·x)=ι̂(a)·E(x), hence ι̂(a)⋆x=a·x | correct |
| Completed coefficients at finite level (§2.122) | a∈Â | π_{R,n}(ĩ(a))=λₙ(π_{A,n}(a)) is `AdicCompletion.evalₐ_liftRingHom` (Algebra.lean:386) applied to the family A→R/mⁿ | correct, name exists at the pin |
| Quadratic form first variation (§2.1) | ε²=0, μ=−2δu+γv, ν=γu−2v | (2x+γy)μ+(γx+2δy)ν=(γ²−4δ)(xu+yv); mixed terms 2γxv−2γxv and −2γδyu+2γδyu cancel | correct |
| Tricanonical numbers (Conventions) | g=2 | rank 3(2g−2)+1−g=5, degree 6, Hilbert polynomial (g−1)(6T−1)=6T−1, value 5 at T=1 | correct |
| Expansion/contraction (§2.473) | (0,3)→(0,4); nodal extra section | M̄₀,₄=ℙ¹ with three boundary points at the three 2+2 partitions; a section through a node expands to a bridge | correct, stable range needed and stated |
| Marked collision (§4.8 Check; F03) | B=ℙ¹, S=ℙ¹×B, D₁={0}×B, D₂=diagonal, m=a₁=a₂=2 | ω_{S/B}=O(−2,0), 2D₁+2D₂=O(4,2), product O(0,2); coefficient m−a₁−a₂=−2; b_*O(−2E)=I_p²; direct images O_B(2) and O_B(2)(−2[0])=O_B of degrees 2 and 0 | Check correct; transport is a declared gap |
| Genus-zero weights (§4.8) | constant family, disjoint constant marks | fibre degree −2m+Σa_i: <0 gives 0; =0 gives rank 1; 2m+1 gives rank 2 | correct |
| Surface control (F05 Check) | S=C₂×ℙ¹, D=C₂×{pt}, m=2 | h¹(ω_S²(D))=h⁰(ω_{C₂}²)·h¹(O_{ℙ¹}(−3))=3·2=6>1; S not general type | excluded by the contract hypotheses |
| Hodge determinant grades (§5.13) | g≥2; g=0; smooth g=1 | d(O)=det f_*O⊗det(R¹f_*O)^{-1}=λ, grade χ(O)=1−g; d(ω)=λ, grade χ(ω)=g−1; g=0: grades −1 and +1; g=1: both 0 | correct |
| Pairing interchange (R01) | ℙ¹, O(1); stable g=2, ω | graded permutation (−1)^{χ(L)²}: +1 and −1; Deligne/EF (−1)^{deg L}: −1 and +1 | R01 |
| Noether formula (§§5.16, 5.19, Worked example) | Lefschetz pencil of bidegree (2,3) on ℙ¹×ℙ¹ | g=2, 12 base points, K²=8−12=−4, χ(O)=1, K_{S/B}²=−4+8=4, deg λ=χ(O)−(g−1)(g(B)−1)=2, e(S)=16=2(2−2g)+δ gives δ=20; 12·2=4+20 | Mumford's relation holds, boundary sign + |
| Noether defect section orders (§5.17 Check) | xy=π^m on a trait | O(−Δ) section order −m, O(Δ) order +m | correct |
| Torsion freeness (§5.4) | g=2 | Mumford Lemma 5.14 proves torsion freeness of equivariant Pic for all g≥2 by Teichmüller contractibility and Dehn twists; the open part has Pic(M₂)=ℤ/10 generated by λ, consistent with the surjection from the free group on λ,δ₁ with δ₀=10λ−2δ₁ | correct |
| Abelian part of a stable Jacobian (§6.16) | one-nodal irreducible g=2; two elliptic components; rational two-nodal | (r,a)=(1,1),(0,2),(2,0); Hodge rank stays 2 | correct |
| Hodge positivity (§§6.20–6.22) | constant positive-dimensional family; relative Frobenius of degree p; d=0 | λ constant, top degree 0, not big; deg λ_Y=p·deg λ_X; a point has positive degree [k(X):k] | maximal variation needed and stated |
| Lift torsor (§7.7) | T=ℙ¹_ℂ, constant genus-2 curve; T=Spec k̄ | L₀⊗f*O(n) pairwise non-isomorphic with one relative class, difference O(m−n); Pic(k̄)=0 gives a singleton fibre with automorphisms k̄× | correct |
| Leray obstruction (§7.6) | f_*G_m=G_m | 0→Pic(T)→Pic(C_T)→Pic_{C/T}(T)→H²(T,G_m)→H²(C_T,G_m) is the low-degree exact sequence | correct |

**Seeded sample, fifteen targets.** Each read in full at its locator:

| Target | Locator read | Outcome |
|---|---|---|
| 2.32 | knudsen2012 lines 410–524 (§3, pp. 11–13); `LinearMap.comp_apply` Defs.lean:495, `Module.Dual.eval_apply` Dual/Defs.lean:83, `TensorProduct.map_tmul` Map.lean:59, `map_comp` Map.lean:104 | consistent (phase "true" resolves D); all four line numbers correct |
| 2.44 | knudsen2012 lines 483–524, Proposition 3.1 p. 12, Corollary 3.2 pp. 12–13 | sound; six Checks recomputed above |
| 2.122 | knudsen2 lines 1032–1089 (Appendix, PDF 34–36 = printed 194–196); `AdicCompletion.evalₐ_liftRingHom` Algebra.lean:386 | consistent; declaration exists |
| 2.140 | same Appendix pages; `AlgHom.ext`, `Ideal.Quotient.mk_surjective` | an identity law, true; statement repeated twice (R06) |
| 2.142 | knudsen2012 pp. 11–12 | sound (row above) |
| 2.171 | knudsen2012 §3; `Matrix.mulVecLin_apply` ToLin.lean:291 | sound; third Check restates API (R04) |
| 2.250 | knudsen2 Propositions 6–7 pp. 194–195; `LinearMap.lTensor_tmul` | sound; p finitely generated correctly required |
| 2.295 | `IsLimit.hom_ext` IsLimit.lean:232, `IsLimit.lift_self` IsLimit.lean:95; knudsen2 Proposition 6 | sound; Checks copy API (R04) |
| 2.359 | same | sound |
| 2.373 | same; `IsScalarTower.algebraMap_smul` | sound |
| 2.387 | knudsen2012 §3; `ModuleCat.homLinearEquiv` ModuleCat/Basic.lean:407, `HomologicalComplex.Hom.isoOfComponents` HomologicalComplex.lean:498 | sound; both line numbers correct |
| 2.473 | knudsen2 lines 563–596, Lemma 2.5 PDF 18 = printed 178, Corollary 2.6 and Theorem 2.7 PDF 19 = printed 179 | sound |
| 5.4 | mumford1977 lines 2166–2241, Lemma 5.14 at printed p. 102, proof pp. 103–105 (physical 65–68) | sound; hypothesis g≥2 is Mumford's |
| 6.7 | yuan-author-http lines 1445–1479, Lemma 3.4 pp. 43–44 | sound; duplicated citation phrase (R06) |
| 6.15 | blr-relative-picard-LwkQQl (uncertified, cited by locator only); yuan Lemma 3.4 | consistent with the parts readable; see Not verifiable |

No locator flagged unverified by the author remained beyond the two settled uncertified works.

**Pinned declarations opened.** `TensorProduct.piScalarRight` Pi.lean:163, `piScalarRightHom_tmul` :139, `piScalarRight_symm_single` :175; `AdicCompletion.transitionMap_comp_eval_apply` Basic.lean:414; `AdicCompletion.liftRingHom` and `evalₐ_liftRingHom` Algebra.lean:358, 386; `LinearEquiv.isScalarTower` TransferInstance.lean:95; `TauCeti.AlgebraicGeometry.LineBundleClass.inv_mk` Class.lean:104 and the CommGroup instance :142; `TauCeti.AlgebraicGeometry.FamilyOfCurves` Family.lean:56; the eleven Mathlib line numbers listed in the sample table. All as cited.

**Cross-roadmap citations resolved (every supplier, this round).** On main: StableReduction (layers under "The build, in layers"), SchemeAndStackFoundations §§0.3, 0.8, 0.9, 0.11, 0.17–0.21, 0.30, 1.1, 1.2, 1.9, 1.18–1.23, 2.1, 2.2, 2.6, 2.18–2.22, 3.3–3.7, 4.1, 4.4–4.6, 4.10, 4.14, 4.15 (with `stableCurveDirectImage_nef` line 5826 and `determinantQuotient_ample` line 5851), 4.18, 5.1, 5.8, 5.10; PadicMeasuresIwasawaAlgebras §5.1 (line 3172); StablePeriodicCurved Layer 2 (line 223); AlgebraicVectorBundles L0A–L0C (lines 215–254); ModularCurves §§0E, 1C, 1D, 2D, 2E, 4A, 4B, 9E; JacobianChallenge and AlgebraicCurves (layer headings differ in style but exist). At open heads: ModularCurvesPartII §§2.1–2.3, 2.11 `polygonCountStack`; AlgebraicModuliForArithmeticGeometry §§1.1–1.7, 2.1–2.2, 3.1–3.5 (`ModuliDescent.polarizedDescentComparison` at its line 1716, general base, actual cocycle), 5.1–5.4, 7.2, 7.3, 7.6, 8.1–8.3; NeronModelsAndSemistableAbelianVarieties §4.1 `NormalizationExactSequence`, §4.13; AbelianSchemesAndArithmeticModuli §§A2.5, A3.5–A3.8, A6.18; JacobianChallengePartII §§0.1–0.4, 1.1–1.4, 1.3a, 4.4, 6.1–6.3; PELModuli §§M5.1–M5.3, M6.9–M6.10; ShimuraCompactifications §§C4.1, C4.10, C5.13–C5.18; ComplexComparisonPartII §§C3.2d.1–C3.2d.4; DeformationAndDerivedPatchingAlgebra §3.3 (its line 612 states the fibre-injection criterion as cited). The resolver's single lead, `ModuliDescent.polarizedDescentComparison`, is a roadmap target name, not a library declaration, and resolves as above. Every supplier is earlier in the merge order (StableReductionPartII is line 176 of the merge order; its latest supplier ShimuraCompactifications is line 175, ComplexComparisonPartII line 42, AlgebraicModuliForArithmeticGeometry line 35). Ownership by object: no roadmap on main or at an open head states a Deligne pairing, the Mumford–Noether isomorphism, compactified Torelli or the Knudsen pointed-node ideal (service grep and local grep; ComplexCurveModuli on main is analytic and does not own Teichmüller contractibility); the seven Lean names occur in no other `Suggested.lean`.

**Dependency check.** Command run as given; output:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Gaps.** 28 declared, each precise enough to test (hypotheses and conclusion in one sentence), each with a named earlier supplier and section that exists; the minimality repairs of F04 hold (polarized descent, generic nefness, nodal normalization are imports). gap:stack-topology-boundary was checked against ComplexCurveModuli on main, which does not provide Teichmüller contractibility or the mapping-class presentation. The acceptance, once R01 is repaired, would be conditional on all 28.

## Not verifiable

- `blr-relative-picard-LwkQQl` (Néron Models §§8.1, 8.4, 9.2–9.4) and `mc6-fc1990` (Faltings–Chai IV §5, V Theorem 2.3): settled uncertified; cited by locator, not read, not requested.
- The board package SchemeAndStackFoundationsPartII (index: #420, head 9022ef2): the GitHub contents lookup returns 404 and the roadmap service has no roadmap of that name; its local board folder holds only `reports`. Ownership of the perfect-pushforward, Cohen–Macaulay duality, Deligne-pairing and Chow gaps against that package could not be checked.
- Deligne 1987 §6.2: the OCR (mc5-deligne1987 line 1685) truncates the sentence giving the symmetry sign; the value (−1)^deg(L) is taken from Eriksson–Freixas Proposition 6.1(2), which attributes it to Deligne.
- Layers 0 and 1 and the untouched bulk of Layer 2 were not reread in full; the round-1 table and the repair ledger carry computed rows for them, which were spot-checked (Conventions, §§2.0, 2.1, 2.44, 2.45, 2.123).

## Source issues

- **Gap** in mc5-erikssonfreixas2024 at Proposition 6.1(2), printed p. 311: the source says the symmetry isomorphism of the determinant-defined pairing (6.3) has sign (−1)^κ and refers to Deligne for the proof; it should say how that isomorphism is built, since the graded permutation of the determinant factors has sign (−1)^{χ(L_i)χ(L_j)}, differing by (−1)^{χ(O_X)}; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "73beb1cf7099222071aaf4e9aae9c92f90576fdc", "job": "REV-PKG-StableReductionPartII~2", "model": "fable", "worker": "chris-i"} -->
