# Review of RankZeroOneBSDPartII (pull request #1732 at 249b5e4)

**Verdict:** accepted

Incremental re-review of the 2 changed lines since c42ad8a (one sentence added to the first paragraph of `## Scope and ownership`, `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:7`), with the previous report's two findings accounted for, the gate, the elaboration and the dependency check re-run, and the citations the changed sentence makes re-resolved at the suppliers' current heads. No finding remains.

## Previous findings

- R01 — repaired: `packages/RankZeroOneBSDPartII/design/plan.json` now carries four top-level `gaps` (eisenstein-local-dictionary, complementary-heegner-twists, quadratic-analytic-factorization, cgls-ordinary-control); the `rational-three-isogeny-count` entry is gone, and the pull request's README states exactly those four gaps (lines 67, 73, 81, 107) with Part III's items 1–7 cited as targets at line 113.
- R02 — repaired: README line 7 now says "There is no separate RankZeroOneBSD roadmap: the base direction, the forward Gross–Zagier–Kolyvagin theory, is owned by the suppliers just named, and this roadmap is complete in itself."

Neither repair introduced a new problem: the added sentence names no new supplier, no pull-request number and no process word, and the plan edit changed nothing else (the three remaining gap entries' suppliers and sections are unchanged and match the README's contracts).

## Verified sound

**The changed passage.** The sentence's three claims were checked. (i) No base roadmap: `TauCetiRoadmap/` on main (a0ad405) and `Completed/` contain no `RankZeroOneBSD` folder; `roadmaps list` over the 442 open pull requests shows only `RankZeroOneBSDPartII` (#1732) and `CMRankZeroConverse` (#1744); `roadmaps grep 'RankZeroOneBSD[^P]'` returns only consumer-list mentions in other roadmaps (NeronModelsAndSemistableAbelianVarieties 4450, ArithmeticGaloisDuality 7385, ModularSymbolsPadicLFunctions 2694, EllipticCurveModularity 88, AutomorphicFormsOnReductiveGroups 1320, MetaplecticAutomorphicForms 7, 3421, 3429, 3465) and this README's own line 7; `board/packages` has no `RankZeroOneBSD`; `ORDER.txt` lists only `RankZeroOneBSDPartII` (line 355). (ii) The forward theory is owned by the named suppliers: ArithmeticStatisticsPartVI at its open head, "Heegner logarithm and low rank" (line 2412: Heegner point, height formula, rank one and finite Sha over K, and the low-analytic-rank implication over ℚ for every curve with modular comparison data) and "Elliptic p-parity" (line 2466: p∞-Selmer corank even iff w(E)=+1); HeegnerPointEulerSystems at its open head, §8b.2 (line 2076, anticyclotomic main-conjecture comparison, rational CGLS variant for odd p) and §8b.10 (line 2162, Eisenstein anticyclotomic theorem interface with φ|G_p ≠ 1, ω and no (Sel)). (iii) The scope boundaries still resolve: CMRankZeroConverse Layers 0–6 are its headings at lines 159–530 with §0.1 at 161; RankOneConverse PC.0–PC.6 are the headings of `packages/RankOneConverse/design/README.md` at lines 50–515 (a design package, cited only as a boundary and never in a `*Needs:*` line; the resolver's "found nowhere" lead at citations line 7 is therefore not a missing object).

**Gate, elaboration, direction.** The worker's gate at this head: every check passed, `build=0`. My own run of the gate at this head: every check OK (exit 0). `lake env lean TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean` exits 0 with no output (the file declares nothing, so `sorry` does not even occur). The outside-folder diff `origin/main...HEAD` is empty; the worktree is clean. The dependency check with `--movable` printed

```text
depcheck: 204 roadmaps, 1662 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at line 355, after ArithmeticStatisticsPartVI (130), HeegnerPointEulerSystems (351), RankOneConverse (352) and CMRankZeroConverse (354).

**Unchanged material.** The README outside line 7 and `Suggested.lean` are byte-identical to the head c42ad8a that the previous report reviewed in full (2 changed lines, 1 insertion and 1 deletion, confirmed from the diff); its sample of 15 seeded targets against the cached CGLS, BKLOS and PS author copies, its 17 pinned declarations, its 16 resolved supplier roadmaps, its headline/padding analysis (no declaration, every headline named in the docstring with its missing carrier) and its shape check stand, and are not repeated here. The board's package copy `packages/RankZeroOneBSDPartII/README.md:113` still carries the superseded `gap:rational-three-isogeny-count` contract sentence; since the plan no longer lists that slug it counts as undeclared, the pull request's README does not state it, and the intake reads gaps from the plan, this has no effect and is noted only as checked.

**Declared gaps.** The four gaps in the plan and the README have the same slugs, named suppliers and sections; each `needs` sentence is unchanged from the previous report's check (precise, one obligation each, nothing already provided).

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-RankZeroOneBSDPartII~3, "Adversarial table"), with their values; the last row is new.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, exclusion at p=3 (r3) | η unramified quadratic; alternatives 1, ω; rational kernel point | η(Frob)=−1, η\|I=1; ω\|I nontrivial so ωη≠1,ω; product η·ωη=ω; φ=1 rejected | symmetric: ψ=ωφ⁻¹∉{1,ω} ⇔ φ∉{ω,1} | none |
| Conventions, contragredient (r3) | Λ=ℤ₃⟦T⟧, γ↦γ⁻¹ | γ⁻¹−1=−T/(1+T), order 1 at T=0; 3 unit in Λ[1/3], T not | as stated | none |
| Conventions, heights (r3) | h_(O)(P)=1, h_(O)(2P)=4 | h_x=2, 8; B_x(P,P)=(8−2−2)/2=2=h_x(P); half polar form of h_(O) would give 1 | agrees with GZAH §0.1 | none |
| Conventions, masses at 3 (r3) | signed squarefree d | P(3∤d)=(2/3)/(8/9)=3/4; classes 1,2: 3/8 each; 3,6: 1/8 each; total 1 | as stated | none |
| 0.1 bundle (r3) | p=2; multiplicative p; φ=1; dual | each rejected; dual ψ=ωφ⁻¹ passes iff φ does | matches CGLS Thm E | none |
| 0.2 dim Sel_p=corank+2s (r3) | S=(ℚ₃/ℤ₃)^c⊕M⊕M, (c,s)=(0,0),(1,0),(1,1),(0,1) | dims 0,1,3,2; coranks 0,1,1,0; ℤ/9 admits only the zero alternating pairing | r∈{0,1} ⇒ s=0 | none |
| 0.2 Sel_p≅Sel_{p∞}[p] (r3) | E(ℚ)[p]=0 vs ≠0 | kernel is E(ℚ)[p∞]/p; zero iff E(ℚ)[p]=0; E(ℚ_p)[p]≠0 forces φ\|G_p or ψ\|G_p=1 | exclusion supplies the hypothesis | none |
| 1.1 signs (r3) | r=1: w(E)=−1; r=0: w(E)=+1; level primes split | w(E/K)=−1 ⇒ w(E^K)=+1 resp. −1; twist order 1−r = 0 resp. 1 | branches match (d),(d′) | none |
| 1.1 discriminants (r3) | 2 split; infinitude | D≡1 (mod 8) ⇒ odd; infinitely many ⇒ D<−4, u_K=1 | as stated | none |
| 1.2 corank sum (r3) | r=0,1 | 0+1=1, 1+0=1; K_v=ℚ_p ⇒ E(K)[p]⊂E(ℚ_p)[p]=0 | (Sel) and E(K)[p]=0 | none |
| 2.1 torsion length (r3) | R=Λ_{P₀}: X=R; X=R⊕R/P₀ | coinvariant dims 1, 2; torsion lengths 0, 1 | corank one forces M_{P₀}=0 | none |
| 2.1 Tor term (r3) | k=R/P₀R | Tor₁^R(k,k)=k, dimension 1 | cokernel terms retained | none |
| 2.2 trace factor (r3) | split p, full trace over Gal(K[1]/K) | Tr((1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1])/u_K=(1−α⁻¹)²P_K; u_K=1 | agrees with CGLS (4.4) | none |
| 2.2 units (r3) | nineteen-a3 twist, a₃=2: X²−2X+3 mod 9 | roots 5, 6; α⁻¹≡2; (1−α⁻¹)²≡1; α²(β−1)²≡4 | both units | none |
| 2.3 equality at P₀ (r3) | S=R=ℚ₃⟦T⟧, κ=T | tower class ≠0, bottom =0, char(S/Rκ)²=(T²) | ord_{P₀}char X_tors=0 needed | none |
| 2.3 Check N=20, D=−71 (r3) | residues | −71≡1 (8), ≡4=2² (5), ≡1 (3); (20,71)=1; μ=0 | coefficient as in ECN §2.8 | none |
| 3.1 subtraction (r3) | r=0,1 | 1−1=0, 1−0=1 | analytic rank r | none |
| 3.2 / 3.3 (r3) | r=0,1; (corank,s)=(0,0),(1,0),(0,1) | ranks 0,1; finite Sha has corank 0; dimension 2 excluded | forward theorem used only after the converse | none |
| 4.1 admissible classes (r3) | good ordinary, φ\|G₃=1; φ\|G₃=η | classes 1,2,3,6 → only 2 resp. only 1 admissible; 3,6 additive | one unit class each time | none |
| 4.1 negative control (r3) | v₃(j)<0 | A₃=∅ | matches §5.3 | none |
| 4.2 strata (r3) | c₃∈{1,3}; c_∞∈{1,1/3}; bad ℓ≠3 and 2 set to 1 | global ratios {1,1/3} or {3,1} | T₀ and one of T_{±1} inhabited | none |
| 4.2 Check d=−31, 137 (r3) | residues | −31≡2 (3), ≡1 (8), ≡7≡8² (19); 137≡2 (3), ≡1 (8), ≡4=2² (19) | both prescriptions realised | none |
| 4.3 bounds (r3) | even variable mean ≤1; odd: q+3(1−q)≤4/3 | P(0)≥1/2; q≥5/6 | matches BKLOS §9.2 | none |
| 4.3 product rule (r3) | B⊆Σ⊆all; N(Σ;X)=0 | r_X(B\|Σ)·r_X(Σ\|all)=r_X(B\|all), both 0 when N(Σ;X)=0 | identity holds at every cutoff | none |
| 4.3 liminf product (r3) | μ(Σ₀)=1/8, μ(Σ₁)=1/4; r_X alternating 1/2, 1 | (1/2)(1/8)=1/16, (5/6)(1/4)=5/24 | `le_liminf_mul` hypotheses hold | none |
| 5.1 invariants (r3) | (0,1,1,1,0) | b=(4,2,1,0); Δ=−19, c₄=−32, c₆=8, j=32768/19; c₄³−c₆²=1728Δ | as stated | none |
| 5.1 reduction mod 3 (r3) | x=0,1,2 | solutions 2,2,1; 6 points; a₃=−2 | ordinary | none |
| 5.1 tangent at (0,0) (r3) | partials | F_x=−1, F_y=1; tangent y=x; residual x³ | flex of order 3 | none |
| 5.1 native twist (r3) | t=0, n=−2 | t²−4n=8; Δ=−19·8⁶; squareclass 2 | as stated | none |
| 5.2 density (r3) | d≡2 (3) | 3/8=37.5 % < 41.67 %=5/12 | conversion ceiling | none |
| 5.3 model (r3) | (1,0,3,0,0) | Δ=−2160=−2⁴·3³·5; c₄=−71; c₆=−1837; j=357911/2160; v₃(j)=−3 | elliptic; nonidentity flex | none |
| 5.3 global (r3) | every twist | same j, v₃(j)=−3<0 | A₃(W,ι)=∅ | none |
| 5.3 local twists (r3) | d=1,3,2,6,1/3 | (v₃Δ,v₃c₄)=(3,0),(9,2),(3,0),(9,2),(−3,−2); 3v(c₄)−v(j)=v(Δ) | never a unit | none |
| Part III contract (r3, formerly R01) | F=ℚ, d=−31, 137, 18; ι and dual; m=−1,0,1 | H=31, 137, 2; means 4/3, 2, 4; dual 4, 2, 4/3 | supplier targets cover the instance | plan entry deleted (done) |
| Scope line 7, "no separate RankZeroOneBSD roadmap; base direction owned by the suppliers named" (new) | main folders (2 roots), 442 open heads, board packages, ORDER.txt; the four named supplier sections | base-roadmap folders found: 0, 0, 0, 0; consumer-only mentions: 9 across 6 roadmaps; supplier headings resolved at lines 2412, 2466 (ASP VI), 2076, 2162 (HPES); boundaries at CMRZC 159–530, ROC design 50–515 | true as written | none |

**Ownership against open pull requests** was checked through the indexed heads (`roadmaps list`/`grep`, index of 2026-11-04) for the one object the changed sentence names, the base roadmap; the previous report's object searches for the converse theorems and the two diagnostic curves stand.

## Not verifiable

- None. The changed sentence cites no source text; the suppliers it names were read at their open heads (ArithmeticStatisticsPartVI via `roadmaps show --pr 1176`, HeegnerPointEulerSystems at the sibling checkout) and in the board's design package (RankOneConverse).

## Source issues

- none (no source locator is touched by the change; the two CGLS gaps recorded in the previous report at Corollary 5.2.3 and Remark 5.2.4, printed p. 575, stand as recorded there).
