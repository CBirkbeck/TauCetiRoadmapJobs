# Review of CategoricalOperatorAlgebras (pull request #888 at acb81cf)

**Verdict:** needs changes

Incremental re-review of the 30 changed lines since `79cccda` (the scope passage on QuantumGroups, TemperleyLiebOperatorAlgebras and Subfactors, the CA1a and CA2a consumer sentences, and the Downstream consumers list), plus everything that cites or depends on them. `Suggested.lean` is unchanged.

## R01 (P2) — Two open owners of the C*-category and unitary-duality objects of CA1a and CA2a

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 54–59 ("C*-categories, their finite additive and Karoubi completion … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a") and lines 1631–1633 (Downstream: "QuantumGroups consumes CA1a and CA2a").

Claim: these objects have one owner, this roadmap, and QuantumGroups consumes them from here.

Witness: true on main (`TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a" for exactly the list at lines 1631–1633; lines 61, 253, 260 and 420 use "CA2a's chosen conjugates", "CA2a's balanced unitary dual functor", "CA2a's signed variant"). False at both open revisions of QuantumGroups: #1705 (head `a938955c`, `TauCetiRoadmap/QuantumGroups/README.md` lines 21–23, "Layer 0 owns … elementary C*-categories with standard conjugates and positive Temperley–Lieb completions") builds in §0.2 (lines 194–242) the dagger on a native complex-linear category, C*-categories with `‖f†f‖=‖f‖²`, finite linking algebras, the additive and dagger Karoubi completion, the finite Hilbert and Hilbert-module categories, C*-tensor categories with unitary associators, standard conjugate solutions, the intrinsic dimension with `d(X)≥1`, the dagger-compatible dual functor and the signed self-duality `bar(r)r=εφ_X`, and its §0.3 builds the positive Temperley–Lieb completions; #1649 (head `968db790`, lines 21–23 and §0.3 at line 236) does the same. Neither open revision mentions CategoricalOperatorAlgebras anywhere (grep over README.md and Suggested.lean: no hit). So at those heads the objects of CA1a and CA2a are planned twice, and the consumer claim at lines 1631–1633 does not hold. The `roadmaps grep` for "unitary dual functor" over main and the 466 open heads hits only this roadmap, TemperleyLiebOperatorAlgebras (as a consumer: #867 lines 106–107, 323–328, 1372) and the two QuantumGroups revisions.

Repair: one owner. The owner main already names is this roadmap (QuantumGroups line 42; TemperleyLiebOperatorAlgebras #867 lines 106–107 and 323–328 likewise), and a revision of a roadmap on main is never a dependency, so this README cannot cite #1705's §0.2 in place of CA1a and CA2a. The duplication is therefore settled on the QuantumGroups side: #1705 and #1649 replace their §0.2 (and the C*-category and standard-conjugate part of §0.3) with citations of CA1a and CA2a, as main's QuantumGroups does, and cite Subfactors 3.3 for the positive Temperley–Lieb quotients and their C*-tower (main, `TauCetiRoadmap/Subfactors/README.md` lines 774–831), which this README's line 60–61 already does. In this folder nothing changes except that the author says, in the pull request's merge-order paragraph, that #1705 and #1649 are rebased to consume CA1a and CA2a before either merges; the README's text at lines 54–59 and 1631–1633 stays as it is. This finding is not repairable by an edit of the folder alone and is recorded so the board routes it to the QuantumGroups revisions.

## R02 (P3) — Four definitions have no discriminating Check, and one Check holds for the wrong object

Carried from the previous report (its R01); unchanged at this head.

Location: `README.md` lines 1473–1475 ("the Hilb-valued transpose is `F^t=−⊗(ℂ^k)‾`: for `c=ℂ^m`, `d=ℂ^n` both … are Hilbert–Schmidt spaces of dimension `mnk`"); line 379 (the spherical faithful state ψ on `End(1)`, no Check in the list at lines 386–404); lines 832–835 (`J_X` and Cuntz–Pimsner covariance, no Check in CA7's list); line 617 (internal Stinespring, no Check in CA4's list).

Claim: each definition's Checks discriminate it from a plausible wrong one.

Witness: in `Hilb` every `ℂ^k` is unitarily its own conjugate, so the count `mnk` is the same for the wrong candidates `F^t=−⊗ℂ^k` and `F^t=F`; the Check excludes nothing. The other three definitions have no Check at all.

Repair, with values. (i) Replace the transpose Check by one where the conjugate is visible: in the W*-category of normal `ℂ²`-modules (pairs `(c₁,c₂)` of Hilbert spaces) let `F(c₁,c₂)=(0,c₁)`; then `⟨F(c),d⟩=HS(c₁,d₂)` and `F^t(d₁,d₂)=(d₂,0)` gives `⟨c,F^t(d)⟩=HS(c₁,d₂)` of dimension `dim c₁·dim d₂`, while `F^t=F` gives `HS(c₂,d₁)` of dimension `dim c₂·dim d₁`. (ii) ψ: for `End†(Hilb_fd⊕Hilb_fd)` with grading character `t>0` (the pair-groupoid Check at lines 400–403) the spherical faithful states are the one-parameter family with unit-summand weights in ratio `t` (or `1/t`, by CA2a's orientation); the equal-weight state is spherical only at `t=1`. (iii) `J_X`: for `X=ℂⁿ` over `B=ℂ` with the unital left action `J_X=ℂ`, `O_X=O_n` (OperatorAlgebraDynamics D6), the first map of the six-term sequence is `1−n` on `K₀(ℂ)=ℤ`, so `K₀(O_n)=ℤ/(n−1)`, `K₁=0`; for `X=ℂ` over ℂ, `O_X=C(S¹)` with `K₀=K₁=ℤ`; for the zero left action `J_X=0` and `O_X=T_X`. (iv) Stinespring: for `C=Hilb_fd`, `A=M₂(ℂ)` and θ the normalized trace into `B(ℂ)=ℂ`, the minimal dilation space has dimension 4, not 2, since the trace is not a vector state of `M₂(ℂ)`.

## R03 (P3) — README headings deviate from the upstream shape

Carried from the previous report (its R02); unchanged at this head.

Location: `README.md` line 10 (`## Scope, conventions and dependencies`, one section for scope and conventions), lines 156–1627 (layers headed `## CA1.` … `## CA10.`, each ending with `**Checks.**` and `*Needs:*` rather than `### Examples` and `### Dependencies`), line 1638 (`## Sources and API evidence` for `## References`).

Claim: the README has the shape of the roadmaps on main.

Witness: the shape list, and `TauCetiRoadmap/Subfactors/README.md` on main (`## Scope and ownership` line 25, `## Conventions` line 90, `## Layer 1:` line 306, `### Examples` line 376, `### Dependencies` line 381, `## References` line 1730).

Repair: split line 10 into `## Scope and ownership` and `## Conventions`; rename each `**Checks.**` list `### Examples` and each `*Needs:*` line `### Dependencies` (the dependency check reads the `*Needs:*` lines, so keep that line inside the section); rename line 1638 `## References`. Content unchanged.

## Previous findings

- R01 — not repaired: lines 1473–1475 still read "both `⟨c,F^t(d)⟩` and `⟨F(c),d⟩` are Hilbert–Schmidt spaces of dimension `mnk`"; ψ (379), `J_X` (832) and Stinespring (617) still have no Check. Raised again as R02.
- R02 — not repaired: line 10 `## Scope, conventions and dependencies`, line 156 `## CA1.`, line 1638 `## Sources and API evidence`; no `### Examples` or `### Dependencies` heading in the file. Raised again as R03.

The previous report's verdict was `accepted` while it listed these two P3 findings; an acceptance lists no finding, so they are treated here as open findings of that report.

## Verified sound

Gate and build. The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `set_option=0`, `sorry-data=0`, `prnum=0`, `round-labels=0`). `git diff --stat origin/main...HEAD` outside the folder is empty. `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` finishes in 37 s with no diagnostic; the file is byte-identical to the one the previous report read (one module docstring naming the ten headlines and their missing carriers, the namespace and its `end`), so there is no `sorry`, no one-tactic probe, no `#check` comparison and no fully qualified name to clash with a sibling file. Dependency check with `--movable` and the content checkout: `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Merge order: Subfactors at position 204 (and merged to main on 2026-11-05), this roadmap at 226, TemperleyLiebOperatorAlgebras at 242; QuantumGroups is on main and not in the order. Every supplier edge points downward and both named consumers are later. Declared gaps: none (no `design/plan.json`).

The changed passages, resolved at the current heads.

- Scope lines 60–61, "the positive Temperley–Lieb quotients and their C*-inductive limit are Subfactors 3.3": Subfactors on main (`TauCetiRoadmap/Subfactors/README.md`, merged at `a0e94cf7`) §3.3 lines 774–831 builds the path models `π_n`, `Q_n=TL_n/R_n` with faithful trace weights `[t+1]`, the C*-norms from the faithful-trace lemma, and the C*-inductive limit `B_δ` through CStarAlgebras C5 with faithful τ. The passage is exact. Subfactors' scope (lines 72–75) assigns Q-systems, module categories, pivotal module C*-categories and planar-to-C* completions here and the unitary Temperley–Lieb category to TemperleyLiebOperatorAlgebras; its Downstream list (1722–1726) names this roadmap for Layers 1, 2, 5–8, 9. One-way.
- Scope lines 61–63, CA1a lines 164–165, CA2a lines 313–314 and Downstream lines 1634–1636, "TemperleyLiebOperatorAlgebras Layer 3 … consumes CA1a (3.2–3.3) and CA2a (3.3)": at #867's head `7cf3feef`, Layer 3 is "The unitary Temperley–Lieb category" (line 1272), §3.2 "Hom positivity and the Hilbert-space norms" ends `*Needs:* … CategoricalOperatorAlgebras CA1a` (line 1335) and states "the Hom norms make UTL_δ a C*-category in the sense of CA1a" (1322); §3.3 "C*-tensor structure and unitary duality" instantiates "CA1a's C*-category and CA2a's dagger tensor and unitary-duality interfaces" (1339) and ends `*Needs:* … CategoricalOperatorAlgebras CA1a, CA2a` (1372); its supplier contract (323–328) lists exactly the CA1a and CA2a items this README's Downstream line names and says "Nothing from CA1b, CA2b or CA3–CA10 is used"; its scope (106–107) says these objects "belong to CategoricalOperatorAlgebras CA1a and CA2a; Layer 3 instantiates them"; its Downstream (1788) says Subfactors and this roadmap build the Temperley–Lieb material they need in Subfactors Layer 3. The old citation "A6" is gone from this README (grep: no hit). One-way, downward.
- Scope lines 63–64, "builds the unshaded positive TL factor planar algebra it needs in CA8 directly from Subfactors 3.2 and 6.1": CA8 lines 962–972 construct `TL(δ)` for `δ∈{2cos(π/n):n≥4}∪[2,∞)` and identify its even part with Subfactors 6.1's shaded example (6.1 at line 1089; its Check at line 1121, `dim P_(n,+)=catalan n`, agrees with `P[2n]` spanned by matchings of `2n` points); positivity comes from 3.2 (line 697, Jones's positivity theorem and `jonesLoopParameters={2cos(π/m):m≥3}∪[2,∞)`). CA8's modulus set drops `m=3` (`δ=1`) because the ground-algebra construction at line 975 needs `δ>1`; this is the Hartglass–Penneys hypothesis and was already recorded in the previous report's CA8 rows.
- Scope lines 54–59 and Downstream lines 1631–1633 (QuantumGroups): on main, `TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a" for "Finite Hilbert dagger category, unitary rigid tensor categories, chosen conjugates, signed self-duality, standard solutions and intrinsic dimension", the list at lines 1631–1633 word for word, and lines 61, 253, 260 and 420 consume CA2a's chosen conjugates, balanced unitary dual functor and signed self-duality. Against main the passage is correct; against the open revisions it is R01.

Policy scan of the 21 added lines: no process words, no pull-request number, no LaTeX delimiter, no machine path, no backticked Lean name of this roadmap's own.

Sources. The diff adds or changes no source locator (every new citation is a cross-roadmap one), so the seeded sample falls outside the changed passages; the roadmap has no `sources.toml`, and the previous report's 16-locator sample over the 14 arXiv texts stands unchanged.

Ownership by object against the open heads (`roadmaps grep -i --readme-only`): "unitary dual functor" occurs in this roadmap, in TemperleyLiebOperatorAlgebras #867 as a consumer, on main's QuantumGroups as a consumer of CA2a, and in QuantumGroups #1705 and #1649 as "§0.2's"/"§0.3's balanced unitary dual functor" (R01). No other open roadmap builds C*-categories, standard solutions or signed self-dualities.

### Adversarial table

Rows for the changed statements, with the values computed on each side; then the previous report's rows for the statements the diff leaves untouched, carried forward unchanged (each is a row of the r3 report; the reference "R01(iii)" inside one of them is that report's R01, this report's R02).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope 60–61: positive TL quotients and C*-inductive limit are Subfactors 3.3 | `δ=1`, `δ=√2`, `δ=2` | Subfactors 3.3 (lines 774–831): `Q_n=ℂ` at `δ=1`; `dim Q_2=2`, `dim Q_3=4<5=dim TL_3` at `δ=√2`; `τ_2(1)=1+3=4=δ²` at `δ=2`; `B_δ` through CStarAlgebras C5 with faithful τ | the cited section builds exactly the named objects | none |
| Scope 61–63 / CA1a 164–165 / CA2a 313–314 / Downstream 1634–1636: TL Layer 3 consumes CA1a (3.2–3.3), CA2a (3.3) | #867 head `7cf3feef` | §3.2 `*Needs:*` CA1a (1335); §3.3 `*Needs:*` CA1a, CA2a (1372); contract 323–328 lists daggers, C*-categories, linking algebras, sums, splittings (CA1a) and dagger tensor, conjugate equations, balanced solutions, unitary dual functors with `(f∨)†=(f†)∨` (CA2a); positions 226 < 242 | resolves, downward, one-way | none |
| Scope 63–64: CA8 builds TL(δ) from Subfactors 3.2 and 6.1 | odd `n`; `n=2,4`; `δ=1` | `P[n]=0` for odd `n`; `dim P[2]=1`, `dim P[4]=2` = `catalan 1, 2` (Subfactors 6.1 Check, line 1121); CA8 modulus set `{2cos(π/n):n≥4}∪[2,∞)` ⊂ Subfactors 3.2's `{2cos(π/m):m≥3}∪[2,∞)`, dropping `δ=1` where CA8's ground algebra needs `δ>1` | consistent | none |
| Scope 54–59 / Downstream 1631–1633: single home here, QuantumGroups consumes | main; #1705 `a938955c`; #1649 `968db790` | main line 42 cites CA1a, CA2a with the same six-item list; #1705 lines 21–23 and §0.2 (194–242) own C*-categories, Karoubi completion, standard conjugates, `d(X)≥1`, signed self-duality `bar(r)r=εφ_X`; #1649 lines 21–23 and §0.3 (236) the same; 0 mentions of this roadmap at either head | two owners at the open heads | R01 |
| Downstream 1631–1633 item list vs main QuantumGroups line 42 | word comparison | "finite-Hilbert dagger category, unitary rigid tensor categories, chosen conjugates, signed self-duality, standard solutions and intrinsic dimension" = line 42's list | agrees | none |
| (r3) CA1a C*-identity Check | `f=diag(2,1)`, operator vs Hilbert–Schmidt norm | `‖f†f‖=4=‖f‖²`; `‖f‖₂²=4+1=5`, `‖f†f‖₂=√(16+1)=√17` | HS norm fails | none |
| (r3) CA1a non-self-adjoint idempotent | `e(x,y)=(x+y,0)` | `e†e=[[1,1],[1,1]]`, eigenvalues 0 and 2, `‖e‖=√2`; retract `(x,y)↦x+y` has norm √2; range projection `diag(1,0)` | as stated | none |
| (r3) CA1a `C([0,1])` W* criterion (new) | `B=C([0,1])`; `B=ℂ` | `L_B(B)≅M(B)=B` (H2); `[0,1]` connected ⇒ projections `{0,1}`, their span is ℂ≠`C([0,1])`; for `B=ℂ`, `End(ℂ²)=M₂(ℂ)`, a W*-algebra | not W*; W* | none |
| (r3) CA1a Karoubi vs W*-Cauchy (new) | one object, `End=ℂ` | finite sums `ℂⁿ`, `End=M_n(ℂ)`, idempotent ranges = subspaces ⇒ `Hilb_fd`; countable sum of ℂ = `ℓ²(ℕ)`, infinite-dimensional | completions differ | none |
| (r3) CA1a W* orthogonal sum | columns `(1/n)`, `(1/√n)` | `Σ1/n²=π²/6<∞`; `Σ1/n=∞` | bounded-column criterion | none |
| (r3) CA1a right-module convention | pin `Defs.lean:78` | `inner x (a•y)=a*inner x y` over `Bᵐᵒᵖ`, `a=op b` ⇒ `unop(op b·I)=I·b=⟨x,y⟩b`; self instance `inner x y=y*star x` at `Constructions.lean:79` | README = pin = HilbertModules H1 | none |
| (r3) CA1b nondegeneracy and left unitor | `A=ℂ²` on `X=ℂ` by `(a,b)x=ax`; zero action | `A·X=ℂ` dense, unitor unitary; zero action `⟨a⊗x,a'⊗x'⟩=0` ⇒ `A⊗_A X=0≠ℂ` | hypothesis needed | none |
| (r3) CA1b `ℂⁿ` and its reversal (new) | `n=1,2` | `ℂⁿ⊗_ℂ(ℂⁿ)‾≅M_n(ℂ)`: dim `n²` (1, 4); `(ℂⁿ)‾⊗_(M_n)ℂⁿ≅ℂ`: dim 1; `ℂⁿ∘ℂⁿ` needs ℂ=`M_n`, false for `n≥2`, true for `n=1` | identity 1-cells; "n≥2" correct | none |
| (r3) CA1b conjugate bimodule | `M=M₂(ℂ)`, `J(ξ)=ξ*` | `J(b*ξa*)=aξ*b` | intertwines | none |
| (r3) CA2a FS sign | `J(a,b)=(−b̄,ā)`, `J'(a,b)=(b̄,ā)`, `J(a)=cā` | `J²=−1`, `J'²=+1`, `J²a=|c|²a=a` | `ε=−1` needs dim ≥ 2 | none |
| (r3) CA2a tensor sign law | flip braiding | `(J⊗J)²=J²⊗J²=(−1)(−1)=+1` | multiplicative | none |
| (r3) CA2a `ℝ_(>0)` target | `Hilb(ℤ/2)` | `χ(g)²=1` ⇒ `χ=1`; in `ℂ^×` two characters `±1` | one unitary dual functor | none |
| (r3) CA2a pair groupoid | `End†(Hilb⊕Hilb)` | pair groupoid on 2 objects, homs to `ℝ_(>0)`: `π(1→2)=t`, `π(2→1)=t⁻¹`; balanced `t=1` | one-parameter family | none (R01(ii) asks for the state Check) |
| (r3) CA2b TL Gram matrix | `P_(2,+)`, basis `{1,e}` | `tr(1)=δ²`, `tr(e)=δ`, `tr(e²)=δ²`; det `δ⁴−δ²=δ²(δ²−1)` | positive for `δ>1`, zero at `δ=1` | none |
| (r3) CA2b bipartite example | `u₁—w—u₂` | `1_+=E_(u₁u₁)⊕E_(u₂u₂)` ⇒ `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | nonsimple `1_+` occurs (Penneys Ex. 4.7) | none |
| (r3) CA3 normalisations | `Q=M_n(ℂ)`, `⟨x,y⟩=n⁻¹Tr(x*y)`, `n=2` | `i†i=n⁻¹Tr(1)=1`, `mm†=n²`; `m'=n⁻¹m`: `m'm'†=1`, `i'=ni`: `i'†i'=n²=4`, `i'†m'=i†m`; wrong `m'=n⁻²m`: `m'm'†=n⁻²` | `d_Q=n²` | none |
| (r3) CA3 morphism rescaling | `f:ℂ→M_n`, `d₁=1`, `d₂=n²` | `f'=nf`, `f'(i₁'(1))=n·1=i₂'(1)`; unscaled `1≠n·1` | needs `d₁>0` | none |
| (r3) CA3 balanced projector / splitting | `Q=1`; `Q=M_n`, rows and columns; `M_n=ℂⁿ⊗(ℂⁿ)‾` | `p=id`; range dim 1 in `n²`; `1⊗ev⊗1`, `coev` | as stated | none |
| (r3) CA3 `d_Q=d(X)²` | `N⊂N⋊ℤ/2` | `d(X⊗X̄)=d(X)²=2=[M:N]` | Subfactors 2.5, 5.1 supply the rest | none |
| (r3) CA4 CP Check and GNS normalisation | transpose on `M₂`; `Q=H=a=1` | `(T⊗1)(Σe_ij⊗e_ij)`=flip, eigenvalue −1; `d_a(d_Q/d_H)=1` | as stated | none |
| (r3) CA5 Checks | `N⊆N`; `N⊂N⋊ℤ/2`; `N⊂N⋊ℤ` | trivial bimodule; two invertible summands, `d_Q=2`; `⊕_(n∈ℤ)L²(N)_(α^n)`, index ∞, `N′∩M=ℂ` | discrete ⇏ compact | none |
| (r3) CA6 representability | `V=Hilb(ℤ)`; `V=Hilb(ℤ/2)` | coefficient ℂ at every `n∈ℤ`, infinite support; `Tr_V(ℂ)=ℂ_0⊕ℂ_1` | criterion as stated | none |
| (r3) CA6 pairing axiom Check (new) | `V=Hilb_fd`, `P[0]=ℂ²`, `ψ(a)=(a₁+a₂)/2`, `a=b=(1,0)` | HPT (P2) at `n=0`: pairing = `ψ(r⁻¹(a)·b)=ψ(1,0)=1/2`; standard inner product gives 1 | ψ fixes the box inner product | none |
| (r3) CA6 box dimension Check (new) | `V=C=Hilb_fd`, `Φ=id`, `x=ℂ^k`, `k=2`, `n=3` | `Tr_V=id` (right adjoint of the identity), `P[3]=(ℂ²)^⊗3`, dim `2³=8` (HPT line 1468); `End(x^⊗3)` has dim `2⁶=64` | as stated | none |
| (r3) CA6 real structure | `ε=−1` on ℂ² | `r̄r=−ν≠ν` | none exists | none |
| (r3) CA7 weighted edge | `x=p_vT_εp_w`, `μ=(16,1)` | `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; `a=2`: 4, 4; `a=1/2`: `1/4`, `64` | orientation pinned = HP-I Def. 5.17 | none |
| (r3) CA7 `A(Λ,μ)` Checks | one edge `(16,1)`; one loop `μ=1`; `μ↦3μ`; principal-graph weights | `a_μ(v)=1<16`, `a_μ(w)=16>1`; loop: `v∼v`, `a_μ=1`, `A=∅`, `C*(1,s)=C([−2,2])`, `K₀=ℤ`, `K₁=0`; `a` unchanged, `τ_(3μ)(p_v)=48`; `a_μ(v)=δd_v>d_v` for `δ>1` | all as stated | none |
| (r3) CA7 six-term first map | `J_X=B` | `[ι]−[X]=1−[X]` | as stated; the `O_n` instance is R01(iii) | none |
| (r3) CA8 `N(δ²)` | `δ²=2,(3+√5)/2,3,4` | `3,3,4,5` | integer endpoint excluded | none |
| (r3) CA8 TL(δ) boxes and `A₃` | `P[1..4]`; `δ=√2` | `0`, 1, `0`, Gram `[[δ²,δ],[δ,δ²]]`; `(1,√2,1)`: `√2·1=√2`, `1+1=√2·√2`; `K₀=ℤ³` | consistent with CA2b and Subfactors 7.2 | none |
| (r3) CA8 sharpness witness | `δ²∉ℕ`; `δ²∈ℕ`, `δ>1` | `Tr(1_(k+1))=δ²Tr(e_k)>mTr(e_k)` for `m<δ²`; TL(δ) has depth ≥ 2 for every `δ>1` (`A₃` at `√2`, `A₅` at `√3`, `A_∞` at 2) so `[1₂]≠δ²[1₀]` applies | existential, as HP-II 6.13 | none |
| (r3) CA8 cone and scale | HP-II Theorem C | `K₀(A₀)^+={0}∪{τ_*>0}`, `Σ={0,[1]}∪{0<τ_*<1}`; source writes `K₀(A_k)` in the cone | README pins `A₀` | none |
| (r3) CA9 inner amplification | `n=2` | `τ∘φ_ρ=τ/2`, `(D(τ/2):Dτ)_t=2^(−it)`, `ρ̌(u_t)=2^(−it)u_t`, `ρ̃(u_t)=2^(it)2^(−it)u_t=u_t`, `mod=θ₀`; MT Cor. 3.16(3): rank `r=2=d_ρ` | consistent | none |
| (r3) CA9 sign bridge | MT 695, 716; VNA 3070 | MT `θ_s(λ_t)=e^(−ist)λ_t`, `ρ̌=θ_(log d)∘ρ̃`; README/VNA `θ_s(u_t)=e^(ist)u_t`, `ρ̃=θ_(+log d)∘ρ̌`, `mod=θ_(log(d/r))` | consistent with the supplier | none |
| (r3) CA9 `End_rev` tensor | `u=diag(1,i)`, `v=σ_x` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]` not proportional | reversed tensor distinct | none |
| (r3) CA9 `Hom(id,ρ)` Check (new) | factor M; `M=M₂`, `ρ=Ad(u)` | `ta=at ∀a` ⇒ `t∈Z(M)=ℂ`; `ta=uau*t` ⇒ `u*t∈Z(M)` ⇒ `t∈ℂu`, dim 1, contains the unitary u ⇒ `ρ≅id` | as stated | none |
| (r3) CA9 ultrapower Checks (new in part) | `M_n(ℂ)`; `L(F₂)`; `R` | `M^ω=M`, `M_ω=ℂ`; no property Γ ⇒ `M_ω=ℂ`; property Γ ⇒ `R_ω≠ℂ` (a II₁ factor) | discriminates from "scalar sequences" | none |
| (r3) CA9 amplified corner Check (new) | `(pt,1,ρ)`; `({1,2},1⊗e₁₁,ρ⊗e₁₁)`; `T=1⊗e_(1,pt)`; `(∅,0,0)` | `T(ρ(a)ξ)=ρ(a)ξ⊗e₁=(ρ(a)⊗e₁₁)(ξ⊗e₁)`; `T*T=1_(H₀)`, `TT*=1⊗e₁₁`; `ℓ²(∅)=0` | unitary change of presentation; zero object | none |
| (r3) CA9 `M=ℂ` model Check (new) | `I=pt`, `J={1,2}`, `p=q=1` | Hom `=qB(ℓ²(I),ℓ²(J))p`, dim `rk p·rk q=1·2=2` = the 2×1 block of `M₃(ℂ)`; corners dim 1 and 4 | as stated | none |
| (r3) CA9 transpose Check (new) | `F=−⊗ℂ^k`, `c=ℂ^m`, `d=ℂ^n` | `⟨F(c),d⟩=HS(ℂ^m⊗ℂ^k,ℂ^n)`: dim `mkn`; `⟨c,K̄⊗d⟩=HS(ℂ^m,ℂ^k‾⊗ℂ^n)`: dim `mkn`; `HS(c⊗K,d)≅c̄⊗K̄⊗d≅HS(c,K̄⊗d)` so `F^t=−⊗K̄`, but `−⊗K` gives the same dimension | true; not discriminating | R01(i) |
| (r3) CA9 standardizability | properly infinite M, countable I | `λ(M)⊂pA_Ip` unital, M properly infinite ⇒ p properly infinite in the σ-finite factor `A_I` ⇒ `p∼1` (V5 line 1193) | right-module unitary exists | none |
| (r3) CA9 size tests | uncountable I; `B(ℓ²)` | `ℓ^∞(I)⊂B(ℓ²(I))` has uncountably many orthogonal projections, impossible on a separable space; `L²(B(ℓ²))=HS(ℓ²)` separable, so an uncountable-multiplicity correspondence is not `_ρL²(M)` | as stated | none |
| (r3) CA9 Følner | `K=Irr(C)` | `F·K=Irr(C)`, `|(F·K)△K|_σ=0` | amenable | none |
| (r3) CA9 Theorem D generality | Tomatsu 60–62, 76–80 | `Irr(C)` at most countable is the source's standing assumption; `Z(M)=ℂ` for a factor makes the invariant state automatic | README = source | none |
| (r3) CA10 tube algebra, abelian (new in part) | `Hilb_fd`; `Hilb(ℤ/2)`; `Hilb(ℤ/3)` | ℂ; `i+k=k+j` ⇔ `i=j`: dims `2·2=4` and `3·3=9`, commutative, `Z` has 4 and 9 simples (`|G|²`) | as stated | none |
| (r3) CA10 tube algebra `S₃` (new) | `Hilb(S₃)` | `ik=kj` ⇔ `j=k⁻¹ik`; dim `6·6=36`; simples (class, centralizer irrep): `e`: 1,1,2; transpositions (size 3, centralizer ℤ/2): 3,3; 3-cycles (size 2, centralizer ℤ/3): 2,2,2; `1+1+4+9+9+4+4+4=36`; 8 ≠ 36 ⇒ noncommutative | as stated | none |
| (r3) CA10 `r=±id` on the unit (new) | `u=i·id` | `r̄=(r†)∨`: `(−id)‾(−id)=id=φ`; `ū=(u†)∨=−i·id`, `ū r u⁻¹=(−i)(−i)r=−r`; the induced anchored planar algebras are isomorphic through `H[n]=i^n·id` (for a tangle with `m₁` input-input, `m₂` through, `m₃` output-output strings: `i^(m₂+2m₃)(−1)^(m₁+m₃)=i^(2m₁+m₂)`, and `H[n]∘conj=(−1)^n conj∘H[n]`, `H[0]=1` preserves ψ) | conjugate; same planar algebra | none |
| (r3) CA10 `Hilb_fd` balanced product (new) | `C=Hilb_fd` | `Z(C)=Hilb_fd`, balancing = unit coherences ⇒ `E≃M`; half-braidings with `ℂⁿ=⊕ℂ` forced by the unit axiom ⇒ `Z_C(E)=E` | equivalence, not only fully faithful | none |
| (r3) CA10 tube multiplication typing | `f:(i,j;k)`, `g:(j,h;l)` | composite `i⊗s→i⊗k⊗l→k⊗j⊗l→k⊗l⊗h→s⊗h` in `(i,h;s)`; mismatched middle label gives nothing | well defined | none |

## Not verifiable

- None. The changed lines cite no source text; every cross-roadmap citation they add was resolved at main or at the named open head.

## Source issues

- none
