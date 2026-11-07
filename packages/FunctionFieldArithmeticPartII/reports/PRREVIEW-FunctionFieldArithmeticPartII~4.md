# Review of FunctionFieldArithmeticPartII (pull request #1831 at 8ff956e)

**Verdict:** accepted

Incremental re-review of the 112 changed lines since 0cf660d (56 insertions, 56 deletions, README only). No finding remains. The change is exactly the repair the previous review asked for: the four Stacks citation keys that the manifest did not record are replaced by their manifest ids, and nothing else in the folder moved. The gate passes, the dependency check reports no problem, `Suggested.lean` is byte-identical to the file the previous review elaborated and probed and elaborates again with `sorry` as its only warning, and the two sampled targets that fall in the changed lines land on their locators and recompute.

## Previous findings

- R01 — repaired: `[NormalizationThree-codex-rtOQ9t](…/tag/01JO) line 1383` (26 occurrences), `[FramedFppfCover-codex-rtOQ9t](…/tag/021M) line 837` (6), `[AffineRootPointGroupoid-rtOQ9t](…/tag/022Y) line 966` (16), `[Stacks-finite-root-projections-codex-7e92bd](…/tag/01YW) line 46` (8), References lines 9575, 9576, 9580, 9581; `STACKS-01JO|021M|022Y|01YW` occur 0 times.

## Verified sound

**The diff is a pure key rename.** The 56 removed and 56 added lines of `scratch/changes.md` pair up one to one, and applying the four substitutions `STACKS-01JO → NormalizationThree-codex-rtOQ9t`, `STACKS-021M → FramedFppfCover-codex-rtOQ9t`, `STACKS-022Y → AffineRootPointGroupoid-rtOQ9t`, `STACKS-01YW → Stacks-finite-root-projections-codex-7e92bd` to each removed line reproduces its added line exactly (0 mismatches; 26 + 6 + 16 + 8 = 56 substitutions). URLs, `line N` locators, locator text, Checks, `*Needs:*` lines, target numbering and the References entries' bibliographic text are unchanged. No mathematical statement, hypothesis, supplier citation or Lean name changed, so there is no changed statement to re-elaborate and nothing that cites the changed passages is affected beyond the key itself.

**Keys against the manifest.** The 34 distinct citation keys of the README (every `[key](url) line N` citation and every References entry) are all ids of `packages/FunctionFieldArithmeticPartII/sources.toml` (39 ids); the set difference README − manifest is empty. Each work has one key.

**Gate, dependency check, build, folder.** The worker's gate at 8ff956e: every check 0, build OK. Run here: `depcheck: 239 roadmaps, 2427 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean TauCetiRoadmap/FunctionFieldArithmeticPartII/Suggested.lean`: three `declaration uses sorry` warnings (lines 89, 97, 107), nothing else; `git diff --stat 0cf660dd..HEAD` touches README.md only, so the six elaborated signatures of `scratch/signatures.md` are those the previous review compared with the README and probed (none closes under one tactic). `git diff --stat origin/main...HEAD` outside the folder prints nothing; the folder holds README.md, Suggested.lean and metadata.toml only; the worktree is clean.

**The four renamed locators, re-opened at this head.** `NormalizationThree-codex-rtOQ9t` line 1383 is the start of Section 17 "Fibre products of schemes" (tag 01JO), with Definition 17.1 (01JP) at line 1387 and Lemma 17.2 (01JQ, affine fibre products are affine, Spec(A⊗_R B)) at line 1410; `FramedFppfCover-codex-rtOQ9t` line 837 is Definition 7.1 (021M, fppf covering: flat, locally of finite presentation, jointly surjective); `AffineRootPointGroupoid-rtOQ9t` line 966 opens Section 10 "Actions of group schemes" (022Y), Definition 10.1 (022Z) at line 975, Definition 10.2 (07S1) at line 1008 and Lemma 10.3 (07S2) at line 1012, matching the README's "Definitions 39.10.1–2 and Lemma 39.10.3"; `Stacks-finite-root-projections-codex-7e92bd` line 46 is Lemma 2.1 (01YW, limits of affine schemes with affine transitions are Spec of the colimit of rings) and line 51 Lemma 2.2 (01YX).

**Seeded sample.** Of the 15 sampled targets, two have their locator in the changed lines: §1.54 (README line 1289, hunk at 1286) and §3.22 (line 3387, hunk at 3384). Both were checked in full:

- §1.54 "The normalization change on schemes" (line 1267). Statement: for an arbitrary A-algebra map φ:B→C and a framed root p=(u,y) with u a unit and u·yⁿ = f, the scheme map Spec D(φp) → Spec D_p is Spec of the normalization-change algebra map D_p = B[T]/(Tⁿ−u) → C[T]/(Tⁿ−φ(u)); identity, two-map and three-map functoriality; the direct square is Cartesian. Hypotheses as stated (any n ∈ ℕ including 0, no flatness or reducedness). The locator supports the Cartesian claim: D(φp) = C ⊗_B D_p, and Lemma 17.2 (line 1410) identifies Spec(C ⊗_B D_p) with the fibre product Spec C ×_{Spec B} Spec D_p. The functor laws are `Spec.map_id` and `Spec.map_comp` as the Needs line says. Values in the table below.
- §3.22 "Power functors for every positive divisibility pair" (line 3361). Statement: for positive n | N, the functor from the N-root chart action groupoid to the n-root one, objects precomposed with B_n → B_N (t_n ↦ t_N^{N/n}), label ζ ∈ μ_N(B) ↦ ζ^{N/n} ∈ μ_n(B); identity at n | n and composition over n | N | K. The locator (Section 10, Definitions 10.1–10.2, Lemma 10.3) is the background definition of a group-scheme action and its action groupoid; the content is the elementary calculation the proof route names. `mem_rootsOfUnity` is at `Mathlib/RingTheory/RootsOfUnity/Basic.lean:63` (ζ ∈ rootsOfUnity k M ↔ ζ^k = 1) and `Nat.div_mul_div` at `Mathlib/Data/Nat/GCD/Basic.lean:262` ((k/m)·(m/n) = k/n for n ∣ m ∣ k), exactly the two-step composition law. Values in the table below.

The other 13 sampled targets (§§1.45, 1.106, 2.4, 3.5, 3.99, 3.124, 3.160, 6.4, 7.9, 7.20, 8.1, 9.2, 10.22) cite AGV08, TV17 or YZ19 at lines the diff does not touch; their locator lines (1079, 2343, 2572, 2957, 5007, 5431, 6060, 7476, 7853, 8103, 8291, 8618, 9370) are unchanged between 0cf660d and this head, and §§6.4 and 9.2 were in the previous review's sample. They fall outside the changed passages and were not re-reviewed.

**Cross-roadmap citations and ownership.** No citation changed; the worker's resolver finds every cross-roadmap citation on main or at an open head (`scratch/citations.md`: none missing) and `scratch/overlaps.md` lists no other open pull request changing this roadmap, no dropped id and no id defined only by an open revision. The one Lean-name lead (`TauCeti.AlgHom.convInv_apply`) is the same lead the previous review resolved inside `namespace TauCeti` in `Algebra/AlgebraicGroup/FunctorOfPoints.lean`; the line citing it (README 6017) is not in the diff. The previous review's ownership search (root Picard stack, infinite root stack, quadratic character sheaf, root symmetric power, `rootChart`) stands, as no object was added.

**Declared gaps.** The eight slugs are untouched by the diff; the previous review verified each in `plan.json` and the README.

**Adversarial table.** Rows marked r3 are carried forward from the previous report (head 0cf660d) for statements the diff leaves untouched; the last two rows are computed this round for the two sampled targets in the changed lines. ‡ marks a sampled target.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| ‡§1.54 normalization change on schemes (this round) | φ = id; ℤ/4 → ℤ/2 → ℤ/2, p=(1,2), f=0, n=2; f=1, n=0; general Cartesian square | D_p = B[T]/(Tⁿ−u) → C[T]/(Tⁿ−φ(u)) is C ⊗_B D_p, so the square is Spec of a pushout (Lemma 17.2 at line 1410); φ=id gives Spec.map id = 𝟙; u=1, y=2: 1·2² = 4 = 0 = f, the section y=2 ≠ 0 with y² = 0 maps to 0 in ℤ/2 (killed), while 3·T = T·3 keeps the projection; n=0, f=1: T⁰−u = 1−u and u·y⁰ = u = 1, so D_p = B[T], a polynomial ring with no T=1 relation; composition: Spec(ψ∘φ)-map = Spec(φ-map) ∘ Spec(ψ-map) by contravariance | holds | none |
| ‡§3.22 power functors (this round) | 2 ∣ 6 universal point; ℤ/4, f=0, 4→2, label 3; 2→2 at root 2 over ℤ/4; 12→6→2 | t_6 ↦ t_6³ since 6/2 = 3, and (t_6³)² = t_6⁶ = f; (ζ^{N/n})ⁿ = ζ^N = 1 so the label lies in μ_n; ζ r = r′ gives ζ^{N/n} r^{N/n} = r′^{N/n}; 3·0 = 0 and 3^{4/2} = 9 = 1 in ℤ/4; 2² = 0 = f and the 2→2 functor is t ↦ t¹; (ζ²)³ = ζ⁶ = ζ^{12/2} and (12/6)(6/2) = 2·3 = 6 = 12/2 (`Nat.div_mul_div`); composition of labels (ζη)^{N/n} = ζ^{N/n}η^{N/n} by commutativity | holds | none |
| `rootChartComparison_injective_iff` (§1.92) [r3] | basis t^i⊗t^j; ℤ, n=2, f=2; 𝔽₂, n=2, f=0; n=1; A=0 | Θ(t^i⊗t^j)=e_i⊗t^{i+j}, = f·(e_i⊗t^{i+j−n}) when i+j≥n: diagonal with entries 1 or f; ℤ,f=2: kernel 0; 𝔽₂,f=0: t⊗t↦0; n=1: Θ=id; A=0: both sides true | holds | none |
| `rootChartComparison_surjective_iff` (§1.93) [r3] | ℤ, n=2, f=2; ℤ/4, n=2, f=3; n=1; A=0 | image at the wrapping position is f·A: e_1⊗1 ∉ image for f=2 over ℤ; 3·3=1 in ℤ/4 so e_1⊗1=3·Θ(t⊗t); n=1 bijective; A=0: IsUnit 0 true | holds | none |
| `rootChartCoaction_eq_includeRight_iff` (§2.3) [r3] | b=Σa_i t^i; 𝔽₂, f=0, b=t; ℤ/4, f=0, b=2t; A=0 | Σa_i e_i⊗t^i = Σa_i e_0⊗t^i iff a_i=0 for 0<i<n; e_1⊗t≠e_0⊗t; 2(e_1⊗t)≠2(e_0⊗t) in ℤ/4; A=0 both sides true | holds | none |
| §1.33 pure-tensor formula [r3] | b=x, c=1; b=1 | Θ(x⊗1)=δ(x)=e_1⊗x; Θ(1⊗c)=1⊗c | holds | none |
| §1.7 Check n=3 over 𝔽₇, f=1 [r3] | ζ=2, ζ⁻¹=4 | 2³=8=1, 4³=64=1; evaluation at ζ gives 2t, at ζ⁻¹ gives 4t≠2t | holds | none |
| §3.1/§3.28/§3.35/§3.43 transition [r3] | n=m=2, f=0 over 𝔽₂; m=1; A=0 | j(t_2)=t_4², (t_4²)²=0; B_{nm}=B_n[U]/(U^m−t_n) free of rank m≥1, faithfully flat; m=1 identity | holds | none |
| §3.39/§3.67, §3.45/§3.77 [r3] | parents' bullets | κ_N∘j_{n,N}=κ_n, v_n^n=f, v_n=v_N^{N/n}; injectivity only in §3.67 and §3.77 | one owner each | none |
| §3.12 torsor towers, roots of 2 [r3] | ℚ, P_n=Spec ℚ[z]/(zⁿ−2); trivial tower | X^n−2 Eisenstein of degree n>d has no root in a residue field of degree d: no fppf trivialization; P=G when P_n=G_n | holds | none |
| §3.42 isomorphism detection [r3] | ℝ trivial tower; degree-2 set | degree-2 automorphisms {±1}, lim μ_n(ℝ) trivial; isomorphism sets μ_n(k)-torsors of size ≤n | holds | none |
| §3.75 cone [r3] | index 3; ℤ/1 | π_3=Spec(κ_3); over ℤ/1 every B(n)=0 | holds | none |
| §3.87, §3.108, §3.119 unity-root Hopf laws [r3] | i=1,2; ℤ→𝔽₂, ℤ→ℤ/1 | Δ(h_i)=h_i⊗h_i; S(h_2)=h_2⁵≠h_2, S(h_1)=h_1; ε(h_i)=1 | holds | none |
| §3.142 cofinality intertwining [r3] | definition of δ_D | T∘δ_D=T∘T⁻¹∘δ_C∘E=δ_C∘E | holds | none |
| §3.158 finite-level coinvariance [r3] | 𝔽₂, d_1=2; ℤ/4, c=(0,2); A=0 | equal iff c_1t=0 iff c_1=0; 2t≠0 in (ℤ/4)[t]/t² | holds | none |
| §3.169 base-changed coinvariance [r3] | b∈B | δ_B(1⊗b)=1⊗(1⊗b); E is B-linear | holds | none |
| §3.182/§3.190/§3.191 infinite gerbe [r3] | ℝ; ℚ, class [2]; char p; char 2 | K_n(ℝ)=1 or {±1}; [2]_n≠1 for n≥2; Hom(ℚ/ℤ,ℤ/p^r)=0; (e_{1/2}−1)²=0, e_{1/2}−1≠0 | holds | none |
| Worked example, factorial restriction [r3] | 720→5 via 120 | 720/5=144=6·24 | holds | none |
| §4.6 square action over 𝔽₅ [r3] | γ=1, u=2 | γ′=4, α′=2, γ′⁻¹α′²=16=1 | holds | none |
| §4.7 pointless conic over ℝ [r3] | x²+y²+z²=0, R=∅ | Pic(C)→Pic(C_ℂ)=ℤ has image 2ℤ | holds | none |
| §5.10 two-pullback equivalence [r3] | R=∅; k[ε]/ε², α=ε; k̄ | A_R terminal; α=ε↦0 after reduction; automorphisms (u,v), v_x²=u | holds | none |
| §5.15 coordinate map [r3] | f=1,s=1; f=g=0; signs | u=t; st≠0, (st)²=0; (−1,−1)·st=st | holds | none |
| §5.22 kernel coordinates [r3] | three factors | ((ζη)⁻¹,ζ,η)↦(ζ,(ζη)⁻¹,η) | holds | none |
| §5.23 fibre count and nilpotents [r3] | d=2, D=x+y; D=2·0 | 2 points; 1 point, s³=0 so reduced Bμ₂ | holds | none |
| §6.4 modified-unit kernel [r3] | odd κ_x | |ker p|=2^{#R}; residue nonsquare ∉ p(H) | holds | none |
| §6.11 stabilizer A_R [r3] | 𝔽₅, R={0}; 𝔽₃, degree 2 | A_R≅C₄, (4,2) of order 4; (q^d−1)/(q−1)≡d mod 2 | holds | none |
| §6.12 sign [r3] | x∉R degree 2, a_x=π_x⁻¹; diag(f) | E=−x, O_X(x) degree 2; E(diag f)=div f degree 0 | holds | none |
| §7.1/§7.13 Koszul sign [r3] | d=2, dim V=1,2; ℤ/2 | transposition acts by −1; invariants rank C(2,2)=1; over ℤ/2 invariants whole line, ∧²=0 | holds | none |
| §7.4 Checks [r3] | 𝔽₅, E=ℚ₃; J unipotent | 4≡1 mod 3, 4³≡1 mod 9; J mod 3 order 3, mod 9 order 9 | holds | none |
| §7.7 Check, t↦t² [r3] | odd char, 𝒰=𝔾_m | stalk dims 2 on 𝒰, 1 at 0 on both sides | holds | none |
| §7.8 tameness [r3] | χ(τ)²=1, p odd | wild inertia pro-p → μ₂ trivial | holds | none |
| §7.18/§7.22 sign line on [ℙ¹/μ₂] [r3] | R={0,∞} | sign part of H*(ℙ¹) is 0; L_x^{μ₂}=0 | holds | none |
| §7.27 exterior cohomology [r3] | dim H¹=2, d=0..3 | C(2,d)=1,2,1,0 | holds | none |
| §8.1 vanishing [r3] | d≥ρ+max(2g−1,1) | deg L(−R)>2g−2 so H¹=0; ranks d−g+1, d−ρ−g+1 | holds | none |
| §8.4 ranks and threshold [r3] | g=1,ρ=1,d=2; d=2g−2+ρ | ranks (1,2,1); L(−R)=ω has H¹=k | holds | none |
| §8.7/§8.9 weighted quotient [r3] | (a,ρ)=(1,1),(2,1); g=1,R=∅,d=1 | x↦x² ramified at 0; rank 2^a=4; Q_b=P⁰_T | holds | none |
| §8.10 descent line [r3] | constant F; Frob ζ_3; 𝔽₃[ε]/ε² | q_*q^*E=E; ζ_3 kept; no flatness needed | holds | none |
| §9.2/§9.7 tensor lines [r3] | D=0; rational x; degree-2 x; −[x] | ℚ̄_ℓ; L_x; L_{x₁}⊗L_{x₂} with 2-cycle; dual λ⁻¹≠λ for order 3 | holds | none |
| §9.6 admissible divisors [r3] | degree-2 P, d=−5, B=3 | 4[P]: 3≥3; 3[P]: 1<3 | holds | none |
| §10.9 norm [r3] | t²=a, c+dt; u=−1 | det c²−ad²; Nm(−1)=1, res=−1 | holds | none |
| §10.14 Checks [r3] | s²=t over 𝔽₃ | t=1 split, t=2 inert; disc 5=2 nonsquare | holds | none |
| §10.22 split/inert [r3] | permutation on two points | e₁−e₂ eigenvalue +1 / −1 | holds | none |
| §10.28 and worked example [r3] | ℙ¹→ℙ¹, t↦t², 𝔽₅ | root units 8; norms 4; (1,1,−1) not a norm | holds | none |
| Worked example, Kummer classes [r3] | n=3, a=2; λ↦3λ | ratio 4 not a cube; [3/2]=[3][1/2] | holds | none |

## Not verifiable

- B24 (Bresciani 2024) is settled as uncertified and cited by page alone; no citation of it is in the diff. Not read.
- Ownership against open pull requests was re-checked only through `scratch/overlaps.md` and `scratch/citations.md` this round (no object or citation changed); the previous review's `roadmaps grep` search is not repeated.

## Source issues

- none
