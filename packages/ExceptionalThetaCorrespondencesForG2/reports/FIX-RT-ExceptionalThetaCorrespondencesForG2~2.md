# Repair report: red-team round 2 of ExceptionalThetaCorrespondencesForG2

Files changed: `packages/ExceptionalThetaCorrespondencesForG2/README.md`, `packages/ExceptionalThetaCorrespondencesForG2/design/plan.json` (one new entry in `gaps`), `packages/ExceptionalThetaCorrespondencesForG2/sources.toml` (Sav and LT locators and `cited_for`). `Suggested.lean` and `metadata.toml` are unchanged.

## RT-ExceptionalThetaCorrespondencesForG2~2a/F01 (P1) — applied

Verified: with the conventions' normalized Jacquet functors the small and ambient modules differ by a half-modulus ratio (G₂ radical weights 1⁴2¹, E₆^D radical weights 1²⁰2¹ on diag(t,1,t⁻¹), from Sav lines 157–179 and (3.1)–(3.3)). Changes: Conventions now except the unnormalized coinvariants V_R of §§3.1 and 3.12 and write r_P(V)=δ_P^(−1/2)⊗V_N. §3.1 says the natural projections are unnormalized and gives the twist (δ_𝒫|_M/δ_P)^(1/2), with a Check computing |t|⁸ (P) and |t|¹⁶ (Q). §3.12 states the comparison on unnormalized coinvariants together with both normalized formulas.

## RT-ExceptionalThetaCorrespondencesForG2~2a/F02 (P1) — applied

Verified: §1.13 needs supercuspidal GSp₄ data, and every constituent of the GSp₄ Siegel induction of |det|^(1/2)τ has a nonzero Siegel Jacquet module. Old: "…induction in stages through the GSp₄ Siegel series and the P₁ series of §1.13." New: the I₁₃ calculation (intertwining operators through the M₁ and M₃ maximal parabolics, four constituents, unique generic δ₁₃(τ) at 1/2, the commuting algebra at 0) is proved here, and §1.13 is not used. Added a Check showing why §1.13's hypothesis fails.

## RT-ExceptionalThetaCorrespondencesForG2~2a/F03, RT-ExceptionalThetaCorrespondencesForG2~2b/F04 (P1) — applied

Both are right: Nrd(a)=a³ only tests whether a character that already factors through Nrd is trivial on the centre. LT lines 355–356 assert the factorization without proof. No roadmap or pin supplies [D×,D×]=SL₁(D): I searched the roadmap index for Nakayama–Matsushima, SL₁(D), commutator and "factor through the reduced norm", and the only hits were AdelicAlgebraicGroups' algebraic SL₁(D), which is not this statement. Changes: a new supplier gap `gap:local-division-characters` (SmoothRepresentationsOfLocalGroupsPartII, SRU.3), added to the README contracts and to `plan.json` with the same `needs` sentence. §5.2 now reads "By the local-division-characters contract every one-dimensional smooth representation of D× is uniquely χ∘Nrd; it descends to PD× exactly when χ³=1". §5.2's Needs and the Layer 5 Dependencies cite the gap, and the torus-distinction gap's last sentence points to it.

## RT-ExceptionalThetaCorrespondencesForG2~2a/F04 (P3) — applied

The old Check only restated §3.11. It is replaced by three Checks. (i) For a unitary nonselfdual supercuspidal τ, JQ(1,τ) lifts through I₂(1,τ⊗τ), with exponents (1,1); every quotient is J₂, so both indicators are 0. (ii) For St_G₂, a nontempered σ would make St_G₂ the Langlands quotient of a positive-exponent standard module (§3.10), which is impossible, so both indicators are 1 (σ=St_H by §8.4). (iii) At the boundary s=0 the strict inequality fails.

## RT-ExceptionalThetaCorrespondencesForG2~2b/F01 (P2) — applied

Verified against Sav lines 277–288 (Proposition 5.4, Example 5.5(1), and the remark that Π has no Whittaker vectors). The README has P Heisenberg with Levi root α, so V=N·U_α, not N·U_β as the review wrote. §4.6 now has a target: ψ_V restricts to the degenerate character ψ_(x³), U_α fixes it, the coefficient (Π_D)_(N,ψ_(x³)) is the line of functions at 0, and U_α acts trivially on it. Hence (Π_D)_(V,ψ_V)=0 and every Θ_D(τ) is nongeneric. Two Checks: a fiber of dimension 0 for D against 6 for M₃(F), and the U_α-invariance computation. §5.1's route and §6.7 (statement and Needs) cite §4.6.

## RT-ExceptionalThetaCorrespondencesForG2~2b/F02 (P2) — applied

(a) In §3.12 the K-type detection (an [HMS] input that is in no manifest) is replaced by a route in the review's spirit. The route shows that PD× acts trivially on the Jacquet modules: an unramified character is trivial on a compact group. It splits Θ_D(1)=X⊕C₁ into Bernstein parts. X lies in the Borel block with a one-dimensional r_B, so X is irreducible. X then embeds in both I_P(1/2,1) and I_Q(1/2,st); the only constituent of I_P(1/2,1) (§1.3) that lies in the socle of I_Q(1/2,st) (§1.5) is πdeg[1]. This replaces the review's r_P argument about πgen[1] with one that uses the constituent list of §1.3. The exact twists are stated as part of the target. (b) In §5.1 the count citing "Sav lines 314–317" is replaced by the review's argument: W_E(πdeg[1])≥1 via §§4.2, 4.3 and 4.5, using conjugation and −1∈M; this forces W_E(C₁)=0 and then C₁=0 by §1.10 and §4.6. Needs and Dependencies are updated, and a Check is added.

## RT-ExceptionalThetaCorrespondencesForG2~2b/F03 (P2) — applied differently

Verified: ClassFieldTheory Layer 5 is cohomological, with no CSA or embedding statement. At the Tau Ceti pin, `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg` gives only "a degree-deg subfield splits", and the converse is absent; I searched `TauCeti/Algebra/CentralSimple/*.lean` for every `IsSplittingField` theorem. No roadmap states the criterion. It is therefore a target in §2.2. It is stated generally (any field F, a degree-n division algebra D, a degree-n field extension E), and its short module-theoretic proof lands on the pinned Tau Ceti CSA API. The local splitting step goes through QuadraticFormInvariants §7B (the CSA/H² comparison) and the ClassFieldTheory Layers 5–6 identity inv_E∘res=[E:F]·inv_F. The review named SemisimpleAlgebras Layer 6, which states no such converse; the Tau Ceti pin already covers that layer's maximal-subfield results. The CFT contract parenthesis is corrected. Four Checks added: F³ and F×K, the invariants 3·(1/3), 2·(1/3) and 6·(1/3), and the n=2 case. §2.2 is added to the Needs of §§4.3, 5.1 and 5.2 (§3.12 already had it) and to the Layer 2/4/5 Dependencies.

## RT-ExceptionalThetaCorrespondencesForG2~2b/F05 (P3) — applied

Prepended "§6 Propositions 6.5, 6.8, 6.11 pp. 22–23;" to the GG References entry, matching `sources.toml`.

## Checks run

- **Elaboration**: I ran `lake env lean packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean` from the content checkout. Exit 0, no output. The file declares nothing. Its one change this round is a `module` line before `import Mathlib`, which removes the Lean warning that `Mathlib` is designed for the module system. The gate's import rule still accepts the header.
- **#check comparison**: `Suggested.lean` declares no names, so there was nothing to `#check`. No headline theorem became statable: the new §2.2 criterion is statable at the pins, but it is a Layer 2 input, not a headline.
- **Dependency check**: `depcheck: 186 roadmaps, 1224 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citation resolver**: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The resolver did not check Tau Ceti names. I checked the four new ones by hand at the pin: `TauCeti.Algebra.IsSplittingField` (Splitting.lean:120), `TauCeti.Algebra.isSplittingField_of_finrank_eq_deg` and `TauCeti.Algebra.finrank_le_deg` (Subfield.lean:331, 318), and `TauCeti.Algebra.exists_isSplittingField_finrank_eq_deg` (MaximalSubfield.lean:135), all under `namespace TauCeti` / `namespace Algebra`.
- **Gaps**: 13 slugs in the README and 13 in `plan.json`; I compared the `needs` sentences character by character and all are identical.

## Adversarial pass on new or changed statements

| Statement | Instances | Computed values | Result |
|---|---|---|---|
| §3.1/§3.12 modulus twist | diag(t,1,t⁻¹), diag(t,t,t⁻²) in SL₃⊂G₂⊂E₆^D | G₂: 4·1+1·2=6, 2·1+1·2+2·3=10; ambient: 20+2=22, 18+18+6=42; zero-weight dims 36=dim gl₂(D), 20=4+8+8; twists \|t\|⁸, \|t\|¹⁶; at q=2, t=ϖ: 2⁻⁸, 2⁻¹⁶ | consistent with δ_P=\|det\|³, δ_Q=\|det\|⁵ (det=t²) |
| §3.12 PD× trivial | unramified χ on compact PD× | image is a compact subgroup of ℝ_{>0}, so {1} | holds |
| §3.12 X≅πdeg[1] | constituents of I_P(1/2,1): πdeg[1], JQ(1/2,st), JQ(1,π(1,1)); socle of I_Q(1/2,st): πgen[1], πdeg[1] | intersection {πdeg[1]}; with only the I_Q embedding, 2 candidates | holds |
| §4.6 nongenericity | D vs M₃(F); ψ_V on U_β, U_α | nilpotent fiber dimension 0 vs 6; U_α conjugation keeps the U_β-coordinate; trivial action against nontrivial ψ_α gives 0 | holds for D only |
| §5.1 count | E=F³, cubic field, F×K | 0=0+0, 1=1+0, 0=0+0; −1∈GL₂ on Sym³⊗det⁻¹: (−1)³·1=−1 | C₁=0 |
| §2.2 criterion | F³, F×K; quadratic, cubic, sextic E for inv 1/3; n=2 | non-field: no embedding; 2/3≠0; 0 and 0; 6·(1/3)=0 but 6>3; quadratic fields embed in both ℍ-type D and M₂(F) | field and degree hypotheses both needed |
| §2.2 proof | E⊗D≅Mₙ(E) | simple module: F-dim n·n=n²=dim D, so free of rank 1 over D; E→Dᵒᵖ, then apply to Dᵒᵖ | holds |
| gap local-division-characters | χ unramified of order 3, deg 3 | χ(Nrd a)=χ(a)³=1 on F× | consistent with §5.2's Check |
| §1.11 route | τ selfdual, ωτ=1, s=1/2 | GSp₄ Siegel constituents have nonzero Siegel Jacquet modules | §1.13 not applicable; removed |
| §3.11 Checks | JQ(1,τ), St_G₂, s=0 | exponents (1,1)>0; 0>0 false | (0,0), (1,1), boundary excluded |

## Gate failures

- Warning that `Suggested.lean` imports `Mathlib` without being a module: I added `module` as the first line, before `import Mathlib`. Nothing else changed. After the change the file elaborates with exit 0 and no warnings, and the gate's import scan reports no hit.

## Notes for the maintainer

- Ownership: the embedding criterion is owned here because no roadmap on main, among the board packages, or at the open heads found by `roadmaps grep` states the converse direction, and Tau Ceti lacks it at the pin. If a CSA roadmap later states it, this target should become an import.
- The new gap `local-division-characters` asks SmoothRepresentationsOfLocalGroupsPartII, SRU.3, for the Nakayama–Matsushima statement about characters of D×.
- No names that other roadmaps cite were changed. A new consumed supplier is added: QuadraticFormInvariants §7B (on main).
- Ownership against open pull requests was checked through the roadmap index grep only.
