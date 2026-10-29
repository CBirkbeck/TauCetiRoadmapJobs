<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6483970003 -->
Red team round 2 pass b (claude) of 80ca364

Verdict: needs_changes

1. **F01** (P2) Nongenericity of the division minimal model restricted to G₂ has no owner

   Location: `packages/ExceptionalThetaCorrespondencesForG2/README.md:979`, "ΘD(τ) is finite length, is nongeneric, and is either zero or irreducible"; `README.md:1189`, "generic representations cannot occur in the division pair".

   Claim: every Θ_D(τ) is nongeneric, that is, Π_D has no nonzero G₂-Whittaker functional. §5.1's route (README.md:981) and §6.7 (through its Needs on §5.1) use it, and the step C₁=0 of §5.1 needs it to apply §1.10 to the summands of C₁. No target, supplier section or gap states it: §0.4 indexes characters of N by nonzero-discriminant cubics only, and §4.6 treats only étale E. The generic character of V=N·U_β restricts to N as the character of the cube of a linear form, which is a degenerate cubic.

   Witness: Sav line 282 (Example 5.5(1): fiber {0}, coefficient ℂ for the cubic 6λ³) and lines 287–288 ("Π has no Whittaker vectors" from that example); README.md:220 excludes discriminant-zero cubics; README.md:919 covers "E embedded in J" only.

   Repair: add to §4.6: "For the degenerate character ψ_{x³} of N attached to the cube of a linear form, to which every generic character of the maximal unipotent V=N·U_β of G₂ restricts, (Π_D)_{N,ψ_{x³}} is one-dimensional, the compact functions on the single element 0 of D with characteristic polynomial 6λ³, and the root group U_β of its stabilizer acts trivially on it; hence (Π_D)_{V,ψ_V}=0 for every generic ψ_V and every Θ_D(τ) is nongeneric. (Sav, Example 5.5(1) and the remark following it, p. 399 (Sav lines 282, 287–288).)" Check: "A division algebra has no nonzero nilpotent, so the fiber over 6λ³ is {0}; for M₃(F) it is the six-dimensional nilpotent cone and the split minimal representation has the nonzero Whittaker coefficient of §5.5." Cite §4.6 for nongenericity in §5.1's route and in §6.7's generic case instead of §5.1. Tested: Θ_D(1)=πdeg[1] is nongeneric with W_E(πdeg[1])≠0 for cubic fields E; the split model's coefficient c-Ind_{U⋊C₂}ψ_U≠0 is separated by the fiber dimension 6 versus 0.

2. **F02** (P2) §3.12 detects πdeg[1] by an unowned K-type input, and §5.1 closes Θ_D(1)=πdeg[1] by an unowned coefficient count

   Location: `packages/ExceptionalThetaCorrespondencesForG2/README.md:823`, "detected by its minimal K-type in the reflection representation of the reductive quotient of the special maximal compact subgroup of E₆^D"; `README.md:981`, "comparing cubic coefficient dimensions through §4.6 (Sav lines 314–317)".

   Claim: (a) the branching of the minimal K-type of Π_D under Γ×G₂(𝔽_q) and the identification of the minimal K-type of πdeg[1] with the unipotent representation φ_{1,3″} are available; (b) dim W_E(πdeg[1])=dim W_E(Θ_D(1)) for every étale E is available from §4.6. Neither is a target, a supplier statement or a manifest source: [HMS] is in no manifest, §4.6 gives dim W_E(Θ_D(1))=dim 1^{PE×}=1 for a cubic field E and 0 otherwise but nothing about W_E(πdeg[1]), and the Levi-module identification in §3.12 names no exponent, so the normalisation has no witness.

   Witness: Sav line 296 ("Recall from [HMS] … the reflection representation π_min decomposes as"), line 303 ("It is the minimal K-type of π′_I"), lines 313–315 ((6.3) "results of [HMS] combined with calculations in the Grothendieck group"); README.md:919 (§4.6, étale E only).

   Repair: (a) replace the K-type sentence by: "Write Θ_D(1)=X⊕C₁ with X its noncuspidal and C₁ its cuspidal Bernstein part. The identifications r_Q(Π_D)≅|det|^{1/2}⊗st and r_P(Π_D)≅|det|^{1/2}⊗1 as GL₂-modules with trivial PD×-action, equal to r_Q(πdeg[1]) and r_P(πdeg[1]) (§§1.3, 1.5; Sav, Cor. 5.2 and proof, lines 259–270), give r_B(X) one-dimensional; Jacquet functors are exact and faithful on Borel-supported blocks, so X is irreducible, embeds in I_Q(1/2,st) whose socle is πgen[1]⊕πdeg[1], and r_P(X)=|det|^{1/2}⊗1 excludes πgen[1], whose r_P surjects onto |det|^{1/2}⊗st; thus X≅πdeg[1] and C₁ has zero Jacquet modules." Check: "On diag(ϖ,1) the twist |det|^{1/2} is q^{−1/2}; r_B(πdeg[1]) is the single character (1,|·|) in P-Levi coordinates, while r_B(πgen[1]) and r_B(JQ(1/2,st)) contain the characters of |det|^{1/2}⊗st and |det|^{−1/2}⊗st." Add §1.5 to §3.12's Needs. (b) replace the Sav lines 314–317 citation in §5.1 by: "W_E(Θ_D(1)) is one-dimensional for every cubic field E and zero for non-field E (§4.6 with §2.5); W_E(πdeg[1])≠0 for every cubic field E since πdeg[1] is a quotient of I_E(1/2) through R_D(E) (§§4.2–4.3) and §4.5 gives Hom_{G₂}(I_E(1/2),πdeg[1])≅W_E(πdeg[1]∨), with dim W_E(π∨)=dim W_E(π) for unitary π because π∨≅π̄ and ψ̄_E is M-conjugate to ψ_E (the central −1 of M acts by −1 on N/Z); hence W_E(C₁)=0 for every étale E and §1.10 with §4.6's nongenericity forces C₁=0." Add §4.2, §4.3, §4.5, §1.10 to §5.1's Needs. Tested: E=F³ gives 0=0+0; E a cubic field gives 1=1+0; a supercuspidal summand σ of C₁ would need an étale E with W_E(σ)≠0, impossible on both sides.

3. **F03** (P2) The embedding of cubic fields in D is attributed to a supplier section that does not state it

   Location: `packages/ExceptionalThetaCorrespondencesForG2/README.md:69`, "ClassFieldTheory Layer 5 supplies the local invariant (a degree-n extension splits a central division algebra of degree n)"; `README.md:993`, "E splits D, so embeds in D as a maximal subfield".

   Claim: every cubic extension E/F embeds F-linearly in the cubic division algebra D, supplied by ClassFieldTheory Layer 5. The fact is also used silently at README.md:831 ("for every cubic field E⊂D"), 882 (RD(E)≠0 needs E⊂D), 925 and 979 ("some cubic field E embedded in D"). ClassFieldTheory Layer 5 is the cohomological Brauer group with its invariant and has no central-simple-algebra, splitting-field or maximal-subfield statement; SemisimpleAlgebras Layer 6 owns maximal subfields but states only that a maximal subfield splits D, not that a degree-n splitting field embeds; ClassicalArithmeticCompletion uses "the splitting/embedding criterion" inside a proof route without owning it.

   Witness: ClassFieldTheory README (main) lines 920–1220 contain neither "simple", "division algebra", "subfield" nor "split"; RepresentationTheory/SemisimpleAlgebras README (main) lines 309–315 ("a maximal subfield L of a central division algebra D … splits D"); ClassicalArithmeticCompletion README (main) line 15864.

   Repair: in the ClassFieldTheory contract replace the parenthesis by "(restriction to a degree-n extension multiplies the invariant by n, so a degree-n extension kills a class of order n)". Add to §2.2 the target sentence: "For a central division F-algebra D of degree n and a field extension E/F of degree n, E embeds F-linearly in D as a maximal subfield exactly when E splits D; over the characteristic-zero local F every degree-n extension splits D by the invariant restriction formula of ClassFieldTheory Layer 5, read on central simple algebras through the Brauer-group and maximal-subfield theory of RepresentationTheory/SemisimpleAlgebras Layer 6; hence every cubic field embeds in the cubic division algebra D and every quadratic field in the quaternion division algebra." Cite SemisimpleAlgebras Layer 6 in the supplier contracts and in the Needs of §§2.2, 3.12, 4.3, 5.1, 5.2. Check: "F³ and F×K do not embed in D (no idempotents other than 0, 1); the unramified cubic and every totally ramified cubic embed; for n=2 every quadratic field splits and embeds in M₂(F) as well, so the criterion needs the degree hypothesis on E rather than division; a degree-6 extension kills the invariant of a cubic D but has no F-linear embedding in the 9-dimensional D." Tested: for E=F×K the restriction formula gives [E:F]=3 and kills the invariant formally, but E does not embed, so the target must carry the field hypothesis.

4. **F04** (P3) One-dimensional representations of D× are asserted to factor through the reduced norm without an owner

   Location: `packages/ExceptionalThetaCorrespondencesForG2/README.md:993`, "The one-dimensional representations of PD× are χ∘Nrd with χ³=1, since Nrd(a)=a³ on F×".

   Claim: every character of D× factors through Nrd, that is [D×,D×]=SL₁(D) (Nakayama–Matsushima for a local division algebra). No target or supplier proves it, and the gap sentence excludes dimension one. The consequence χ³=1 is correct once the factorization is known.

   Witness: LT line 355 states "The one dimensional representations of D∗ factor through the norm" without proof; README.md:87 restricts the gap to "dimension greater than one".

   Repair: widen gap:prime-degree-torus-distinction (README.md:87 and `design/plan.json`) to "every irreducible smooth complex representation τ of D× trivial on F×, including the one-dimensional ones, which factor through the reduced norm", keeping §5.2's class-field argument as this roadmap's own proof for the characters; or add "every one-dimensional smooth representation of D× factors through the reduced norm" to that gap's needs. Tested: for χ∘Nrd with χ unramified of order 3 the kernel is the valuation-3ℤ subgroup, as the §5.2 Check computes; a character nontrivial on SL₁(D) is what the theorem excludes.

5. **F05** (P3) References entry for GG omits the §6 locators the text cites

   Location: `packages/ExceptionalThetaCorrespondencesForG2/README.md:1729`, "§8 Propositions 8.1, 8.3, 8.4 pp. 27–28; §9 Theorem 9.1 and its proof, including §9.5, pp. 33–37; Lemma 9.4 pp. 34–36".

   Claim: the References list records every GG locator used.

   Witness: README.md:1122 cites "GG, Propositions 6.5, 6.8 and 6.11, pp. 22–23 (GG lines 745–799)"; `sources.toml` now carries "§6 Propositions 6.5, 6.8, 6.11 pp. 22–23"; the README entry does not.

   Repair: prepend "§6 Propositions 6.5, 6.8, 6.11 pp. 22–23; " to the GG References entry. The Sav entry "§§5–6, pp. 398–400" is a coarser form of the manifest's locator and needs no change.

Scope: the whole `packages/ExceptionalThetaCorrespondencesForG2/README.md` (1737 lines, 97 numbered targets in Layers 0–10, Conventions, supplier contracts, Examples, Dependencies, Worked examples, References) and the whole `packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean` (39 lines: one module docstring, an empty namespace, no declaration) were read line by line. The diff `3f76749..80ca364` (README, `design/plan.json`, `sources.toml`, the repair report) was read in full and every repaired passage was checked against the sources and the suppliers as they are now. Lean: nothing to elaborate, no build run.

## Round-1 findings at this head

| Earlier finding | Status | Witness at 80ca364 |
|---|---|---|
| a.F01 (P2) null-subspace theorems absent from Suggested.lean | settled (repair report: disputed, not a headline) | The reason holds: §0.2 is a Layer 0 input; the Summary's end results are the Howe theorems, dichotomy, tables, trichotomy and global theorems, none statable. Not re-raised. |
| a.F02 (P1) §4.3 used a Layer 5 result | repaired | New §3.12 (README.md:821–833) proves Θ_D(1)=πdeg[1]⊕C₁ with C₁ supercuspidal and Θ_D(τ) supercuspidal for τ≠1 from Sav Prop. 5.1, Cor. 5.2 (Sav lines 234–270, read: Π_{N_i}=Π_{U_i}, Π_{U_i}=(π′_I)_{U_i}) and §6 (Sav lines 303–318). §4.3 (README.md:882–884) now reads "RD(E) restricted to G₂ is isomorphic to πdeg[1]⊕C_E … This uses no statement of Layer 5"; its Needs are §3.12, §4.1, §4.2, §1.3. §5.1 Needs §3.12, §4.8, §4.6. §3.12 Needs §2.2, §2.4, §0.3, §1.3 only: no edge back to Layer 4 or 5. The repair introduced two new unowned inputs: S01 and S02 below. |
| a.F03 (P1) AL.4 does not supply the spin representation | repaired | README.md:104: "take r to be the degree-eight spin representation of Spin₇ constructed by RepresentationTheory/SpinRepresentations Layer 4 (the exterior algebra of a three-dimensional isotropic summand, of dimension 1+3+3+1=8)". SpinRepresentations README (main) line 665 is "Layer 4: the spin and half-spin representations" with "The Clifford module S = ⋀·P.W". §8.9 Needs and the Layer 8 Dependencies now name it. Witness recomputed: at t=1 det(1−T r(t))=(1−T)⁸ versus 1−T for the trivial r. |
| a.F04 (P1) torus distinction unowned | repaired | README.md:87 declares gap:prime-degree-torus-distinction (SmoothRepresentationsOfLocalGroupsPartII SRU.3) for τ of dimension greater than one; `design/plan.json` `gaps` carries the same slug, supplier and section (12 gaps on both sides, slugs compared). LT lines 309–330 read: Theorem 1.4.2 is for π attached to an admissible pair (E,θ), ℓ odd prime ≠ p, central character 1, and the four-case formula; q^{(ℓ−1)(ℓ−2)m/2}=q^m=2 at ℓ=3, q=2, m=1. The one-dimensional case is treated in §5.2 (README.md:993); see S03 and S04 for two inputs that case still lacks. |
| a.F05 (P3) odd-Weil Check false | repaired | README.md:1122 now separates ω⁻ (trivial χ: F̂=F×²∋1, split SO₃ lift St) from ω⁻χ (F̂=a_χF×²∌1, split lift 0, anisotropic lift χ∘Nrd). GG lines 745–747 (Prop. 6.5(iii): F̂(ω±χ)=a_χF×²), 762–772 (Prop. 6.8: θ⁽³⁾≠0 iff 1∈F̂, table ω⁻₁↦St), 791–799 (Prop. 6.11: θ′≠0 iff 1∉F̂, table ω⁻χ↦χ∘N) confirm every value. §8.5 (README.md:1389) now states that ω⁻χ's anisotropic lift is one-dimensional with Jacquet–Langlands antecedent St⊗χ and that ω⁻₁'s anisotropic lift is 0 (GG 6.11(i), since 1∈F̂(ω⁻₁)). Consistent with the conservation relation m⁺+m⁻=8 for Mp₂: ω⁻₁ has m⁺=1, m⁻=7. |
| a.F06 (P3) §1.8 and §10.1 lack discriminating Checks | repaired | README.md:463–464: unipotent-radical invariants 0 for the three cuspidal unipotent types and 1 for the trivial type; functions supported on K map isomorphically onto σ under evaluation at 1; K-fixed space 0, K⁺-fixed space ⊇σ. README.md:1598–1599: 27+79+27=133 versus 15+36+15=66 (D₆); 133=14+21+7·14 with the 14-dimensional kernel of contraction on ∧²F⁶ (−1∈Sp₆ acts by +1, so it descends to PGSp₆); frame products E₁∘E₁=E₁, E₁∘E₂=0, N(diag(1,2,3))=6, N² gives 36 and fails N(2·1)=8 (gives 64). All recomputed and correct. |
| b.F01 (P2) I₃(st_χ×1) irreducibility unowned | repaired | README.md:505: "For σ a unitary discrete series of PGL₂ … I₃(σ×1)=I₁₃(0,σ⊗1) is irreducible"; route at README.md:507 (L(2s,ω_σ)=L(2s,1) pole at 0 kills the GL₂-block reflection, the irreducible PGL₂ principal series π(1,1) kills the GL₁-block reflection, R trivial); Check at README.md:514 (parameter 2·Sp₂⊕3·1, centralizer Sp₂×SO₃ connected). Recomputed: W(M₁₃)=(ℤ/2)² (sign changes constant on the GL₂ block and on the GL₁ block; no block exchange), the GL₂-block rank-one group is the Siegel parabolic of M₁≅GSp₄ whose dual radical is ∧²⊕std, so μ(0)=0 by the pole of L(2s,1); the SO₇ centralizer of S₂⊗ℂ²⊕1⊗ℂ³ is Sp(ℂ²)×SO(3) (det forces SO₃), connected, and its preimage in Spin₇ maps onto it, so S_split is trivial. §8.2 (README.md:1353) cites §1.12. gap:rank-one-plancherel (README.md:85 and plan.json) now covers Levi maximal parabolics and the commuting-algebra theorem with R(σ)=W(σ)/⟨reflections with vanishing Plancherel scalar⟩, which is Silberger's statement. §1.11's route (README.md:496) names induction in stages. |
| b.F02 (P3) "Metaplectic MP.3" | repaired | README.md:1126: "imported from MetaplecticAutomorphicForms §3.39". The MetaplecticAutomorphicForms README at its open head lists "### 3.39 Minimal orthogonal theta lift" (its line 1093) and "### 3.38a Restricted SO₇ oscillator and cuspidal injectivity" (line 1079). No "MP." string remains in the README. |
| b.F03 (P3) M₁ coordinate unpinned | repaired | README.md:316: "M₁≅GSp₄ via its action on ⟨x12,x13,x14,x15⟩. In this coordinate a Levi element acting by t on e₁, by h of similitude ν on ⟨e₂,…,e₅⟩ and by ν/t on e₆ has GSp₄ coordinate (t/ν)h, of similitude t²/ν". Check README.md:332: radical determinant t⁴ν⁻²·t²ν⁻¹=t⁶ν⁻³=(t²/ν)³; the ⟨x26,…,x56⟩ coordinate t⁻¹h has similitude ν/t² and modulus q³ at similitude ϖ. Recomputed: Hom(W,e₁)≅W^∨⊗e₁ has determinant t⁴·det(h)⁻¹=t⁴ν⁻², the center Hom(e₆,e₁) has weight t/(ν/t)=t²/ν; similitude of (t/ν)h is (t/ν)²ν=t²/ν. Correct. |
| b.F04 (P3) E₆⋊C₂ component count | repaired | README.md:585: "the E₆ outer extension E₆⋊C₂ has two components (one added by the involution)". |

No repair introduced a false statement; two repairs (a.F02, a.F04) rely on inputs that are not owned, reported below as S01–S04. The repair report's own adversarial table was recomputed where it touches the new text (§3.12, §4.3, §5.2, §1.12, §0.9, §6.1, §8.5, §1.8, §10.1); every value agrees.

## Headline theorems and the acceptance file

| README headline (Summary) | Statable at the pins? | Disposition |
|---|---|---|
| Finite-length big lifts, irreducible nonzero small lifts, injectivity for PD××G₂, H₃×G₂, G₂×PGSp₆ (§§5.1, 5.9, 7.8, 8.3) | No: no smooth admissible representation category, normalized induction, Jacquet functor, exceptional group or minimal representation at Tau Ceti a91d3aa (`IsSmoothDiscrete`/`SmoothDiscreteTopRep` give discrete actions only) | Named in the module docstring |
| Division-versus-PGSp₆ dichotomy (§6.7) | No, same carriers | Named |
| Tempered and nontempered lift tables (§§8.1, 8.2, 8.4, 8.7) and the discrete-series trichotomy (§8.8) | No | Named |
| Spin-pole/Shalika equivalence (§8.9) | No (ramified spin factor, F₄×G₂⊂E₈ model) | Named |
| Quaternion relative models (§§9.3–9.6) | No (octonion group actions, relative L²) | Named |
| Global period nonvanishing and cuspidality (§§10.4–10.6), real matching (§10.7) | No (adelic exceptional kernels, real Harish-Chandra modules) | Named |

The file states nothing and its docstring names each missing carrier; the empty file is the correct acceptance test. Padding: none (0 declarations). `#check @name` comparison: nothing to compare. Imports: the single line `import Mathlib`.

## Suggested.lean inventory

| Declaration | Section, variables, instances | Computation | Result |
|---|---|---|---|
| none (39 lines read) | empty namespace `TauCetiRoadmap.ExceptionalThetaCorrespondencesForG2`; no `variable`, no `instance`, no `set_option`, no `lemma`, no `#eval` | 0 theorems, 0 definitions, 0 sorry'd data, 1 import | nothing to elaborate; consistent with the README's "Suggested.lean records the missing carriers" |

## Adversarial ledger

Context unless stated: F nonarchimedean of characteristic zero, q≥2, complex smooth representations, normalized induction, fixed nontrivial ψ. "Compatible" means the instances computed do not refute the statement. Rows marked ★ are new or changed at this head and were recomputed from the sources.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions | q=2, χ one-dimensional, i-scaling of Θ | |ϖ|=1/2; regular action χ(a)/χ(b); r(Fr) scales N by 1/2, r_LP by 2; Θ(if,φ)=iΘ, Θ(f,iφ)=−iΘ | compatible |
| 0.1 Aut(O) | id; conjugation; diag(2,1/2,1); F[ε] | id(xy)=xy; conj(u₁u₂)=−v₃≠conj(u₁)conj(u₂)=v₃; 2·(1/2)=1; D=id sends 1↦1+ε | compatible |
| 0.2 null subspaces | W=0, ⟨u₁⟩, ⟨u₁,v₂⟩, F·1, F·e | dims 0,1,2; u₁v₁=e≠0; tr(1)=2, tr(e)=1, N(e)=0 | compatible |
| 0.3 P,Q radicals | diag(ϖ,1) | dims 4+1, 2+1+2; δ_P=q⁻³, δ_Q=q⁻⁵; roots 3α+β, 3α+2β not increasable | compatible |
| 0.4 cubic characters | xy(x−y), x³, 0 | discriminants 1, 0, 0; (1−ψ(n))v=0 on the trivial module | compatible; see S01 for the degenerate character x³ |
| 0.5 stabilizers | F×F, quadratic K | pointwise dims 8, 8; components 2; 2·(1/2)=1 | compatible |
| 0.6 dual inclusions | SL₃, SO(V,b), principal SL₂ | 7=1+3+3; 8=1+7; invariants 1 vs 0; centralizer orders 6 vs 1; cζc⁻¹=ζ² | compatible |
| 0.7 parameters/WD | q=3, N=E₁₂; S₃ with a=(12), b=(123) | Ad(r(Fr))N=N/3, r_LP gives 3N; (ab)⁻¹=(23)≠a⁻¹b⁻¹=(13) | compatible |
| 0.8 component groups | principal SL₂ in SL₃, Spin₇; SO(V,b) | raw 3, 2, 6; split 1, 1, 6 | compatible |
| 0.9 Jordan model ★ | z scalar; diag(1,2,3); (t,h,ν/t) | z²z⁻²=1; dim 15≠27; Pf=6, 1; radical determinant t⁴ν⁻²·t²ν⁻¹=(t²/ν)³; other coordinate gives q³ at similitude ϖ | compatible; coordinate now pinned |
| 0.10 chamber | s=(1,2,3), (3,2,−1) | reflection (6,−3,−2); form 50=50; nine walls 1,2,1;5,4,3;9,8,7; coroot values 3,1,1 | compatible |
| 1.1–1.5 P/Q series | selfdual det 1, S₃-dihedral, χ=1, quadratic, cubic | reducibility sets {±1/2}, {±1}, {±3/2,±1/2}, {±1/2}; lengths 3, 2; Q-exponent 1 | compatible with GS Props 3.1–3.2 as corrected |
| 1.6–1.7 Borel, normal forms | three distinct quadratics; (2,1), (1,0) | 2 summands, 1 generic; opposite exponent −3/2; 1>0>0 false | compatible |
| 1.8 depth zero ★ | σ cuspidal unipotent, σ=1 | unipotent invariants 0 vs 1; K-fixed 0 vs 1; evaluation at 1 recovers σ | compatible |
| 1.9 labels | S₃; principal | dims 1,2,1 with 1+4+1=6; invariants 1 vs 0 | compatible |
| 1.10 cubic models | π=1; π infinite-dimensional nongeneric | coefficient 0 by (1−ψ(n))v=0; c_O=dim W_E≥1 | compatible |
| 1.11 P₂/P₁₃ ★ | selfdual supercuspidal τ, ω=1, s=1/2 | lengths 4 vs 2 (GS Props 10.1–10.2, lines 1176–1212 read) | compatible |
| 1.12 Siegel ★ | τ selfdual DS; τ=st_χ×1, χ²=1; τ=χ×χ⁻¹×1 | 2 summands vs 1; W(M₁₃)=(ℤ/2)², both reflections in W′ (L(2s,1) pole; π(1,1) irreducible), R=1; SO₇ centralizer Sp₂×SO₃ connected; Borel case irreducible (no χᵢ/χⱼ=|·|^{±1}) | compatible; GS Thm 15.2(ii) now has an owner |
| 1.13 P₁ / SK | τρ vs generic partner | genericity 0 vs 1; same Plancherel scalar; points ±1/2 | compatible |
| 2.1 Freudenthal data | x=2 scalar; dims 1,3,9,15 | x#=4, (x#)#=16=N(x)x, x∘x#=8; T(1,1)=3, T(4,3)=36; 14, 28, 78, 133 | compatible |
| 2.2 dual pairs ★ | M₃⁺, H₃(M₂), D vs Dop | partner dims 8, 21; ambient 78, 133; E₆⋊C₂ has 2 components; (xy+yx)/2 symmetric | compatible |
| 2.3 triality | E=F³; diag(ϖ,1)³ | dim 9; kernel order 2; common class ϖ∉F×² | compatible |
| 2.4 minimal models | split spherical; zero module; division D | fixed dims 1 vs 0; no nilpotent in D vs E₁₂²=0 | compatible; division Jacquet exponents unnamed, see S02 |
| 2.5 big/small theta | C₃, χ of order 3, H=1 | Hom(χ,χ)=1, Hom(χ,χ∨)=0 | compatible |
| 2.6 outer extension | T, −T, 2T; diag(2,3,5) | eigenvalues 1, −1, 2; squares 1, 1, 4; t↦diag(1/5,1/3,1/2) | compatible |
| 3.1–3.2 gradings, orbit kernels | five Levis; ⟨u₁,v₂⟩, ⟨u₁⟩, 0 | 66, 38, 78, 66, 48; spans 2, 1, 0 | compatible |
| 3.3–3.8 filtrations | det=ϖ; (ϖ,1),(1,ϖ); (zI,z⁻¹I) | q⁻³ᐟ²≠q⁻¹ᐟ²; |z|, |z|³; q⁻¹ᐟ², q⁻¹; q⁴, q⁻³; z²z⁻²=1 | compatible |
| 3.9–3.11 supports | s=1, s=0; seven Levi types | 2³−1=7; indicators (1,1),(0,0) only | compatible |
| 3.12 division model ★ | τ=1; τ≠1; split model | Π_{N_i}=Π_{U_i} (Sav lines 234–258); Θ(τ≠1) Jacquet modules 0; r_Q(πdeg[1])↠|det|^{1/2}st≠0; split G₂-P module has 2 regular GL₂ pieces | compatible; summand detection and twists unowned (S02) |
| 4.1–4.2 triality series | s=±1/2, det=ϖ; E field / non-field | q^{∓1/2}; lengths 3 vs 2; RD(non-field)=0 | compatible |
| 4.3 Ext ★ | π tempered; π other support; C_E summands | multiplicity dim 1^{PE×}=1; Ext¹(⊕A_i,π)=∏Ext¹(A_i,π)=0 by compact-center projectivity; GS lines 635–643 state the same decomposition | compatible; the field hypothesis on E needs S03 |
| 4.4–4.5 Mackey, open orbit | F³, F×K, field; s=1/2 | m_E=3,1,0; P twist 1/2, Q twist 3/2; four boundary terms 0 | compatible |
| 4.6 cubic coefficients | F³ in D; E⊂D | empty vs nonempty embedding set | compatible; degenerate character missing (S01) |
| 4.7–4.9 period chain, uniqueness, existence | d=1; E=F³ | 1→2→1 impossible; 2>1; RD(F³)=0 forces H | compatible |
| 5.1 division Howe ★ | τ=1; τ≠1 | Θ(1)⊇πdeg[1] with genericity 0; W_E(Θ(1))=1 for E a field, 0 otherwise | route incomplete (S01, S02) |
| 5.2 nonvanishing ★ | p=2,3; χ unramified cubic; E′ totally ramified | gcd(3,2)=1, gcd(3,3)=3; q^m=2 at q=2,m=1; ker χ=valuation 3ℤ=N(E×); N(ϖ_{E′}) has valuation 1 | compatible; embedding of E (S03) and the Nrd factorization (S04) unowned |
| 5.3–5.5 opposite algebra, signs, fibers | (xy)⁻¹=y⁻¹x⁻¹; orbit sizes 2, 1; eigenvalue ±1 | homomorphism to the opposite group; restriction lengths 2 vs 1; dims 1 vs 0 | compatible |
| 5.6–5.9 precursor, minus lift, tables, Howe | p=2 vs odd; St_PGL₃; two quotients | selfdual supercuspidal count 0 for p odd; outputs πgen[1], πsc[1] with indicators 1, 0; cosocle length ≤1 | compatible |
| 6.1 restricted oscillator ★ | ω⁻₁; ω⁻χ; non-selfdual σ | F̂=F×²∋1→St; a_χF×²∌1→0 and χ∘N (GG lines 745–799); (σ∨)∨=σ | compatible |
| 6.2–6.6 comparisons, finiteness, fibers | χ one-dimensional; F⁶∖0; n=2; trivial G₂ input | χ⁻¹ smooth dual; 1 orbit vs 2; lengths 2 or 3; coefficient 0 | compatible |
| 6.7 dichotomy | d=1 | 1=1+1 contradiction | compatible; generic exclusion from PD× needs S01 |
| 7.1–7.8 periods, tempered Howe | two genuine signs; s=−1/2; endpoints 1 | (−1)(−1)=1; −1/2<1/2; all intermediate dims 1; cosocle 1 | compatible |
| 8.1–8.4 tables | Q/P exponents 1, 0; selfdual with 1; τ=St_GL₂ | J₂, J₁₃; signs 1 vs 2; socle πgen[1]⊕πdeg[1] not a single δ_Q | compatible |
| 8.5–8.8 πρ family, trichotomy ★ | ω⁻₁; ω⁻χ; H₃ branch | anisotropic lift 0 (1∈F̂) vs χ∘Nrd one-dimensional, antecedent St⊗χ; DS indicator 0 on the H lift | compatible |
| 8.9 spin pole | α∨(ϖ), q=2 | sim=ϖ², det₅₆=ϖ⁵⁶; |det₅₆|^{3/28}=2⁻⁶=|sim|³; δ^{1/2}=2⁻⁸; exponent −1; orders −1 vs +1 | compatible, conditional on the two spin gaps |
| 8.10 depth-zero example | q=7 | 43=49−7+1; exponents 0,1,42,36,7,6,37 distinct, sum of (1,−7,6)=0 | compatible |
| 9.1–9.6 quaternion models | M₂(F), division D, Hamilton; ranks 0,1,2; (3,2,0) | SL₂ noncompact, compact, SU₂; −1 negates D⊥; ranks <3; interlacing (2,2), SU₂ weight 0 | compatible |
| 10.1 Albert pair ★ | split; totally definite; diag(1,2,3) | ranks 7 vs 3; 27+79+27=133 vs 15+36+15=66; 14+21+98=133; N=6, N²=36, N(2·1)=8≠64 | compatible |
| 10.2–10.7 global | r=3,d=8; f=0, φ=0; three constant terms; λ=0 | poles 1,5,9; Θ=0; (0,0,0); ρ≠0 | compatible |
| gaps (12) | each needs sentence | all have suppliers and sections; slugs equal in README and plan.json; rank-one-plancherel is two statements of Silberger's theory with one Plancherel normalization | no finding |

## Verified sound

- **Declarations read:** 0 of 0 in `Suggested.lean` (39 lines; docstring, empty namespace). No `set_option`, `lemma`, `#eval`, `True` placeholder, sorry'd data or non-`Mathlib` import. Nothing to elaborate, so no `#check` comparison was made and no Lean command was run.
- **Targets read:** 97 of 97 (Layers 0–10, including the new §3.12), with Conventions, all supplier contracts, Examples, Dependencies, Downstream consumers, Worked examples and References.
- **Round-1 findings re-verified:** 10 of 10 (table above); 9 repaired, 1 settled by the repair report's reason.
- **Locators verified in the cached texts:** 16 line anchors read against the statement they support: Sav lines 225–231 (Conjecture 4.1), 234–258 (Prop. 5.1 and proof), 259–270 (Cor. 5.2 and proof), 277–292 (Prop. 5.4, Examples 5.5, (5.6)), 294–318 (§6, (6.1)–(6.3)); GS lines 480–518 (§3.4(2)–(5), §3.5, Lemma 3.4), 626–643 (Prop. 5.3 and proof), 805–853 (Cor. 6.8, Prop. 7.1, Thm 7.2), 1140–1162 (M₁₃, M₂, δ_{P₂}), 1176–1232 (Props 10.1–10.3), 2008–2030 (Thm 15.2); GG lines 740–799 (Props 6.5, 6.7, 6.8, 6.9, 6.11); LT lines 296–358 (Theorem 1.4.2 and its hypotheses, the one-dimensional remark); HKT line 911 (page 22 marker for A.1). Printed pages match the page markers in every case (Sav 398/399/400 at lines 234–262/264–299/302–318).
- **Sibling and supplier citations resolved at main or the named head:** 11: RepresentationTheory/SpinRepresentations Layer 4 (main, line 665, spin module S=⋀·P.W); ClassFieldTheory Layer 5 (main, lines 920–1220, cohomological Brauer group and invariant), Layer 8 (lines 1433–1505, `localAbelianExistence` for finite extensions of ℚ_p, open finite-index norm subgroups, `[Kˣ:N]=[L:K]`), Layer 9 (line 1505); RepresentationTheory/SemisimpleAlgebras Layer 6 (main, lines 305–318); ClassicalArithmeticCompletion line 15864 (main; uses, does not own, the embedding criterion); MetaplecticAutomorphicForms §§3.34–3.40 and 3.38a at its open head (lines 1027–1101); SmoothRepresentationsOfLocalGroupsPartII SRU.0–SRU.4 as gap owners (declared, not findings). The merge-order gate printed `depcheck: 186 roadmaps, 1224 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. The citation resolver reported "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Gaps:** 12 slugs in the README and 12 in `design/plan.json`, identical slugs, suppliers and sections; each `needs` sentence carries its hypotheses (characteristic zero, complex coefficients, admissibility or temperedness where used, the Fourier and modulus normalizations); none asks for something Mathlib, Tau Ceti or an earlier roadmap provides (checked: SmoothRepresentationsOfLocalGroupsPartII's design has no Whittaker-uniqueness, Plancherel, R-group, Schwartz-Ext, character-expansion, torus-distinction or isotypic-commutation statement; AutomorphicLFunctionsAndLocalFactorsPartII D.6 has no Shahidi F₄ or Bump–Ginzburg–Vo content; ReductiveGroups Layer 3 has no scheme-theoretic centralizer).
- **Checks tested by computation:** 61 Check bullets (the 15 new or changed ones at this head and 46 re-tests recorded in the ledger); all confirmed. In particular the GSp₄ coordinate of §0.9 (t⁶ν⁻³=(t²/ν)³), the §1.12 Weyl-group and centralizer computations (W(M₁₃)=(ℤ/2)², Sp₂×SO₃ connected, Spin₇ preimage surjective), the §6.1/§8.5 Whittaker supports (F×², a_χF×²) and lifts (St, 0, χ∘Nrd), the §1.8 invariant dimensions (0 versus 1), the §10.1 dimension counts (133=27+79+27=14+21+98, 66=15+36+15) and norm homogeneity (8 versus 64).
- **Policy:** `git diff --stat origin/main...HEAD` lists only files under `packages/ExceptionalThetaCorrespondencesForG2/` (README, Suggested.lean, design/plan.json, metadata.toml, four reports, sources.toml). No pull-request number, process word, `lemma` declaration, `set_option`, machine path or computational algorithm in the README or the Lean file; every target carries a source locator; `sources.toml` has 17 entries, no local path, GS05 and HPS waived, Var uncertified, as the manifest records.
- **Ownership:** searched by object (null subspaces, exceptional dual pairs, minimal representations, Freudenthal construction, Albert algebra, division-model decomposition, torus distinction, maximal subfields and splitting fields) on main, the board packages and the open heads through the roadmap service. No other roadmap owns the exceptional constructions; the only overlap found is the unowned embedding criterion of S03, which no roadmap states. LocalLanglandsCorrespondenceForG2 (board package, later in the order) is named only as a consumer. Open pull requests whose files the brief does not give were not individually audited beyond the service's grep.

## Not verifiable

- [HMS] (Huang–Magaard–Savin), cited by Sav lines 276, 296 and 306 for the reflection-representation decomposition (6.1) and the coefficient computations behind (6.2)–(6.3), is in no manifest; the K-type facts of S02 were therefore checked only as unowned, not as false.
- GS05 and HPS are waived and Var is uncertified: cited by locator only; the minimal-model characterization (§2.4), the real infinitesimal-character correspondence (§10.7) and the residue-characteristic-2 wavefront input (gap) were not certified from text.
- The division minimal representation's Jacquet modules along the E₆^D maximal parabolics (Steinberg and trivial Levi modules with their exponents) are asserted in Sav's proof of Cor. 5.2 without a computation; the exact twists could not be confirmed from any cached text (see S02 and the first source issue).
- HS and GrS extractions have damaged mathematical fonts; their locators were not re-read in this pass (pass b of round 1 checked them by page position).
- The Lean file declares nothing, so no binder, universe or coercion check was possible.

## Source issues

- **Gap** in Sav at Corollary 5.2 proof, printed p. 399 (Sav lines 265–270): the source says both Jacquet modules of Π and of π′_I are Steinberg and trivial Levi modules up to unramified twists and that the corollary follows; it should match the two unramified twists explicitly before asserting equality; affects the proof.
- **Misprint** in Sav at Corollary 5.2 proof, printed p. 399 (Sav line 266): the source says the second Jacquet module of π′_I is along U₁ as an L₁-module; it should be along U₂ as an L₂-module; affects nothing.
- **Gap** in Sav at §6, printed p. 400 (Sav lines 303–305): the source says the K-type decomposition and Corollary 5.2 immediately imply that π′_I is a direct summand of Θ(1); it should separate the cuspidal part by the Bernstein decomposition and identify the noncuspidal part through its one-dimensional Borel Jacquet module; affects the proof.
- **Gap** in Sav at (6.3), printed p. 400 (Sav lines 313–315): the source says the equality of cubic-coefficient dimensions follows from [HMS] with Grothendieck-group calculations; it should state the needed input, that π′_I has a nonzero ψ_E-coefficient for every cubic field E; affects the proof.
- **Gap** in GS at Proposition 7.1(ii), printed p. 23 (GS line 833): the source says Θ(τ) is nongeneric for τ≠1 citing [Sa]; it should cite the degenerate-cubic fiber computation (Sav Example 5.5(1)), which is the only nongenericity argument in [Sa] and applies to every τ; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "80ca364d60582ddd87e737b6ed31373d6c4b7c37", "job": "RT-ExceptionalThetaCorrespondencesForG2~2b", "model": "fable", "worker": "chris-x9"} -->
