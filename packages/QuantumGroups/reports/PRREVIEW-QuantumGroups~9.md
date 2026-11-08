# Review of QuantumGroups (pull request #1705 at c5e5bfa)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `c5e5bfaeb0a88f11e5dd81f1e628e8eafe2abd9b`. This is a full review: 276 lines changed since `36f8753`, the head review ~7 read. No file of the pull request was changed. Both of review ~7's blocking findings are repaired, and no finding blocks. Four P3 findings remain:

- R01: the open-revision conflict, carried from review ~7.
- R02: one misnamed map in §0.1.
- R03: two owned targets have no source locator.
- R04: one supplier row claims something its supplier doesn't state.

The worker's gate passes every check. The dependency check reports no problem. `Suggested.lean` elaborates with exactly 13 `sorry` warnings and nothing else.

Locations are in `TauCetiRoadmap/QuantumGroups/` unless another roadmap is named. Other roadmaps are read on main (`94294cd`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

**Status of review ~7's findings (head `36f8753`).**

| ~7 | Passage at this head | Status |
| --- | --- | --- |
| R01 (P2) §0.1 restates HilbertModules H1–H3 | `README.md:166`–`:179` now reads "Consume HilbertModules H1 … Consume HilbertModules H2 … Consume HilbertModules H3". §0.1 keeps only the leg identifications (`:181`–`:199`), with their own API (`:203`–`:204`) and Checks (`:208`–`:210`). The supplier row is at `:87`, the scope at `:20`–`:21`, and the docstring at `Suggested.lean:30`–`:36`. The citations are repointed at `:518`, `:546`, `:577`, `:885` and `:939` | Repaired, as the repair proposed. One wording slip in the kept part is R02 below |
| R02 (P2) §0.4 restates CStarAlgebras C1.7, C1.8, C5.1 and C5.2 | §0.4 is gone, and no "§0.4" remains in either file. §1.1 cites C5.2 (`:338`), C1.7 (`:346`, `:363`), C1.CommutativeMultiplierMorphisms (`:351`, `:384`) and C5.1 (`:362`). The supplier row is at `:88` and the scope at `:21`–`:28`. §1.1 now owns only `C₀(X,C₀(Y))≅C₀(X×Y)`, which C5.2 states only for compact spaces (`CStarAlgebras/README.md:1150`–`:1152`) | Repaired |
| R03 (P3) #1649 conflicts, and the description names a non-existent Q9 | The title and description are unchanged ("construct the ribbon category RepUqg", "Add Q9"). #1649 is still open, now at `ab56b1d` | Not repaired; carried as R01 |
| R04 (P3) two locators overreach | 1. `:318` and `:1656` now read "pp.54–55, for the unitary Temperley–Lieb category at d≥2 and d=2cos(π/m), m≥4, and p.52 for the sign τ; the case m=3 rests on Subfactors §3.3 and Penneys Example 4.6.14". 2. The Landsman reference was deleted along with the restated Hilbert-module material | Repaired |

## R01 (P3) — Two open revisions of this folder disagree on who owns Layer 0, and the description describes a head that does not exist

**Location:** the pull request's title ("construct the ribbon category RepUqg") and description ("Add Q9 to build `RepUqg`"). Also `README.md:25`–`:28`: "Layer 0 owns the free-module coaction legs built on these, elementary C*-categories with standard conjugates and the unitary Temperley–Lieb category".

**Claim:** this pull request is the only open revision of QuantumGroups, and the ownership it sets for Layer 0 is settled.

**Witness:** #1649 is open at `ab56b1d` and conflicts with this head (overlaps.md). Its README `:34`–`:35` and `:44` say that this general theory, and the unitary Temperley–Lieb category, are "owned later in the build" by CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras. §§0.2–0.3 here construct both. This head has no Q9.

**Repair:** in the description, state which revision prevails and the Layer 0 ownership it carries. Then retitle and redescribe the pull request to match the head: Layers 0–8, and the 13 `Suggested.lean` headlines. No file of the folder changes.

- Option one: this pull request supersedes #1649, which is closed.
- Option two: #1649 merges first and this one is rebased onto it.

QuantumGroups is on main, earlier than CategoricalOperatorAlgebras #888 (merge order 226) and TemperleyLiebOperatorAlgebras #867 (242). If §§0.2–0.3 stay here, those two pull requests must cite QuantumGroups §§0.2–0.3 rather than own the same objects:

- `CategoricalOperatorAlgebras/README.md:43` at #888: "have their single home here; QuantumGroups consumes CA1a and CA2a".
- `TemperleyLiebOperatorAlgebras/README.md:137` at #867: "QuantumGroups consumes Layers 1–3".

Tested: with this head's README, the dependency check prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. Citing #888 or #867 instead would make both edges upward, as review ~8 found for #1649.

Carried from review ~7 R03 (review ~6 R06). No repair report was available to this review.

## R02 (P3) — §0.1 conjugates `T_12` by a "unitary" that the flip induces, but no module map has that formula

**Location:** `README.md:194`–`:196`: "`T_13` is the conjugate of `T_12` by the unitary of `H⊗(A⊗min A)` that the flip of CStarAlgebras C5.1 induces on the coefficients". The same appears at `:486`: "U_13 is its conjugate by the flip of the last two legs".

**Claim:** the flip σ of `A⊗min A` induces a unitary in `L_(A⊗A)(H⊗(A⊗min A))`, and conjugating by it gives `T_13`.

**Witness:** take H=ℂ, A=C(C₂), u the sign character and `W(ξ⊗x)=ξ⊗σ(x)`. Then `W((1⊗1)(u⊗1))=1⊗u`, but `W(1⊗1)(u⊗1)=u⊗1`. So W is σ-semilinear, not right (A⊗A)-linear, and no adjointable unitary has this formula.

**Repair:** at `:194`–`:196`, write: "`T_13` is the leg `T_(ι₂)` along `ι₂(a)=1⊗a`. By the composition law it equals `(T_12)_σ` for the flip automorphism σ, since `ι₂=σ∘ι₁`." If the conjugation is kept, call W "the σ-semilinear isometry `ξ⊗x↦ξ⊗σ(x)`", not a unitary. At `:486`, write "U_13 is the leg `U_(ι₂)` of §0.1".

Tested: for `T=u∈L_A(A)=A`, `T_12=u⊗1` and `(T_12)_σ=σ(u⊗1)=1⊗u=T_(ι₂)`. This agrees with Check `:209` (`U_12U_13=(u⊗1)(1⊗u)=u⊗u`).

## R03 (P3) — §0.1 and §1.1 state owned theorems with no source locator

**Location:**

- §0.1 (`README.md:181`–`:199`): its *Needs:* line (`:212`) names only suppliers.
- §1.1 (`:335`–`:385`): its *Needs:* line (`:400`) ends "the identification `C₀(X,C₀(Y))≅C₀(X×Y)` is proved above."

**Claim:** every target this roadmap owns carries a locator.

**Witness:** neither section cites a source. The Landsman locators that covered §0.1 were deleted with the restated material. The manifest records `kustermansvaes`, Definition 2.1, cited for 1.1, but the README never cites it.

**Repair:**

- In §1.1's *Needs:*, add: "Kustermans–Vaes, *Locally compact quantum groups* (Ann. Sci. ÉNS 33, 2000), Definition 2.1, p.853, for the bi-C*-algebra axioms that `(C₀(G),Δ)` satisfies, and 'Notations and conventions', p.840, for strict extensions to multiplier algebras."
- In §0.1's *Needs:*, cite the same p.840 for leg numbering.
- Add the work to the References with its Numdam link.

The group-specific verifications stay the README's own derivations.

Tested: `kustermansvaes` lines 743–746 (printed p.853) define a bi-C*-algebra as a nondegenerate `Δ:A→M(A⊗A)` whose strict extensions satisfy `(Δ⊗ι)Δ=(ι⊗Δ)Δ`. Lines 174–200 (printed p.840) give the unique strict extension and the leg map `A⊗C→M(A⊗B⊗C)`.

## R04 (P3) — The HilbertModules row credits H2 with "the Hilbert-module category", which H2 does not state

**Location:** `README.md:87`: "…`L_A(H⊗A)≅𝓜(ℂ, K(H)⊗min A)` for arbitrary H, and the Hilbert-module category (§§0.1, 0.2, 2.1–2.3, 4.2)".

**Claim:** HilbertModules H2 supplies the Hilbert-module category.

**Witness:** H2 (`HilbertModules/README.md:179`–`:260` on main) states `L_A(E,F)`, composition, adjoints, `‖T*T‖=‖T‖²`, `θ_(x,y)`, `K_A` and the multiplier identifications, but no category. §0.2 builds the category itself (`README.md:221`–`:222`: "Construct the finite Hilbert category and Hilbert-module category").

**Repair:** replace "and the Hilbert-module category" with "with composition, adjoints and `‖T*T‖=‖T‖²`, from which §0.2 builds the Hilbert-module C*-category". §0.2's own *Needs:* line (`:262`) already reads this way.

## Verified sound

**Scope, gate and build.**

- The head is `c5e5bfaeb0a88f11e5dd81f1e628e8eafe2abd9b` and the worktree is clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.
- `STATUS.md`, `PROGRESS.md` and `metadata.toml` are identical to main's.
- The worker's gate passes every check, 0 failures, `OK`.
- `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0. It prints exactly 13 `declaration uses sorry` warnings (lines 109, 140, 150, 158, 225, 243, 253, 260, 268, 280, 301, 324, 335) and nothing else.
- Neither file has a `set_option`, `lemma`, `#eval`, admitted `example`, LaTeX delimiter, pull-request number or process word. "lemma" occurs only in mathematical prose.
- Since `36f8753` the Lean file changed only in its module docstring.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

**Signatures and the padding probe.**

- A scratch file with `#check @name` for all 26 declarations elaborated once. Every type matches the worker's signature file and its README statement. The one dropped-binder lead, `[StarModule ℂ A]` on `AlgebraicHaar`, is unused by its fields (`positive` uses only `StarRing`), and every theorem that needs it carries it.
- A scratch copy with each `sorry` replaced by `first | rfl | infer_instance | simp | simp_all | trivial` gives 13 errors, one per theorem (probe lines 122, 144, 153, 162, 238, 248, 254, 263, 272, 293, 306, 330, 339). Nothing closes in one tactic.
- Each definition occurs in a headline statement. No API lemma, Check mirror or small computation is declared.

**Headline coverage.**

| Headline (README) | At this head |
| --- | --- |
| §3.1 Schur orthogonality | `schur_orthogonality` |
| §4.1 compact type, modular automorphism, Kac equivalence | `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive` |
| §§8.1–8.4 coproduct, PBW, domain, centre, finite semisimplicity, classification and existence of ladders, local-finiteness criterion and semisimplicity | nine theorems, `Suggested.lean:225`–`:340` |
| Layers 0–2 and 5–7, §§3.2–3.4, Layer 4 completions, §§8.5–8.7 | Named in the docstring (`:28`–`:62`) with the missing carrier. The pins have no minimal C*-tensor product (no match under `Mathlib/Analysis/CStarAlgebra` or Tau Ceti `Analysis`), no Hilbert-module operator algebra, and no monoidal category of modules over a noncommutative Hopf algebra (`Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean` is for commutative rings only) |

**Adversarial pass (computed).** Throughout: q = 1/2 unless stated, `[n]=[n]_q`, and `F̃=diag(2,1/2)` for the SU_(1/2)(2) fundamental matrix `u=[[a,−qc*],[c,a*]]`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 unitary `(H⊗A)⊗_φB≅H⊗B` | H=ℂ, A=B=C(C₂), φ=id, a=a′=u, b=b′=1 | `⟨1,1⟩·1*φ(u)*φ(u)·1 = u*u = 1` on both sides | pass | none |
| §0.1 legs along φ | φ=ε, T=1[s]; φ=ι₁, T=1[s] | `T_ε=ε(1[s])=0` while ‖T‖=1 (not isometric); `T_12=1[s]⊗1` has norm 1 (isometric) | pass | none |
| §0.1 `T_13` via the flip | A=C(C₂), x=1, c=u⊗1 | `W(xc)=1⊗u` vs `W(x)c=u⊗1` | fail as worded | R02 |
| §0.1 Check :209 | sign character u | `Δ(u)=u⊗u=(u⊗1)(1⊗u)`; ι₂ twice gives `1⊗u²=1` | pass | none |
| §0.2 C*-identity | T=diag(2,1) | `‖T†T‖=4=‖T‖²`; Hilbert–Schmidt `√17≠5` | pass | none |
| §0.2 rescaled cup | (2R, R̄/2) on ℂ² | squared norms 8 and 1/2; left trace `4·Tr` ≠ right trace `Tr/4`; the norm product `√8·√(1/2)=2` is still minimal, as NT Thm 2.2.17 allows ("up to scalar factors") | pass | none |
| §0.2 τ = −ε | SU(2) fundamental | cup `e₀⊗e₁−e₁⊗e₀`, `R̄=−R`: τ=1, ε=−1; J on ℂ²: `J²(z₁,z₂)=(−z₁,−z₂)` | pass | none |
| §0.3 cup and projection | d=5/2 | `‖∪‖²=d`; `tr_2(p)=d⁻²τ_2(∪∪†)/d = d/d³ = 4/25`; `tr_2(1−p)=21/25` | pass | none |
| §0.3 truncated fusion | m=3; m=4 (d=√2) | m=3: `1⊗1` has upper index `min(2,0)=0`, so `0`; m=4: `1⊗1=0⊕2`, `1⊗2=1`, `2⊗2=0`, `[4]=d³−2d=0` | pass | none |
| §0.3 sign comparison | δ=−d | `(−e)²=−de=d(−e)`; `(−e_i)(−e_(i±1))(−e_i)=−e_i`; normalised trace `−1/d` on both sides | pass | none |
| §1.1 `C₀(X,C₀(Y))≅C₀(X×Y)` | ℝ; ℤ; X=∅ | `e^(−x²−y²)↔F(x)=e^(−x²)e^(−y²)`, `‖F(x)‖=e^(−x²)→0`; `e^(−(x−y)²)`: `‖F(x)‖=1`, `H(t,t)=1`, in neither; `1[m+n=0]` in neither; ∅: `0=0` | pass | none |
| §1.1 coproduct | S₃; ℤ; ℝ | `(12)(23)=(123)`, `(23)(12)=(132)`: Δf=1, 0; `Δ1[0](N,−N)=1`; `Δe^(−x²)` has sup 1 at (g,0) and value 1 on g=−h | pass | none |
| §1.1 inverse maps | a=1[1], b=1[−1] on ℤ | `d(a⊗b)=0`, `r₊=1[1]=aS(b)`, `r₋=1[−1]=S(a)b`; `r₊Δf=f(0)·1` | pass | R03 locator |
| §1.2 cancellation, Haar | monoid {1,0}; C(C₂); ℤ | span dimension 3 < 4; h(1[e])=1/2 vs evaluation 1; `W(λ₁⊗1)W*(δ₁⊗δ₂)=δ₂⊗δ₃=(λ₁⊗λ₁)(δ₁⊗δ₂)` | pass | none |
| §2.1 tensor convention | `U_13V_23` | `Σ_(j′,k′) u_(ij′)δ_(kk′)δ_(j′j)v_(k′l) = u_ij v_kl`; sign tensor square `(−1)²=1` vs direct-sum value −2 | pass | none |
| §2.2 unitarisation | U(s)=[[1,2],[0,−1]] | `U²=I`; `U*U=[[1,2],[2,5]]`; `T=[[1,1],[1,3]]`, det 2; `TU=[[1,1],[1,−1]]`, `U*TU=T` | pass | none |
| `schur_orthogonality` | SU_(1/2)(2) | `h(a*a)=(F̃⁻¹)₁₁/Tr=(1/2)/(5/2)=1/5`; `h(c*c)=2/(5/2)=4/5=1/(1+q²)`; `h(aa*)=F̃₁₁/Tr=4/5`; `h(u₁₂*u₁₂)=q²h(cc*)=1/5=(F̃⁻¹)₁₁/Tr`; NT 1.4.2 (`nt` 450) gives `F̃=ρᵗ` | pass | none |
| `schur_orthogonality` | ι empty | H=0, so ⊥=⊤ and there is no `IsSimpleOrder`: vacuous, no 0/0 | pass | none |
| `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] with x*=x primitive | h=id spans; `h((a+bu)*(a+bu))=|a|²+|b|²`; zero ring: span=⊤ but h(1)=0≠1, excluded by `Nontrivial`; ℂ[x]: invariance forces x=0, and unitary comodules `exp(xN)` need N*=−N nilpotent, so N=0 and span=ℂ: both sides false | pass | none |
| `haar_modular_automorphism` | SU_(1/2)(2); ℂ[S₃] | θ(a)=4a: `h(a*θ(a))=4/5=h(aa*)`; θ⁻¹ gives 1/20; ℂ[S₃]: θ=id; uniqueness by faithfulness (NT Thm 1.7.3, `nt` 977–978) | pass | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2) | both sides true; `h(a*a)=1/5≠4/5=h(aa*)` and `S²(c)=c/4≠c`, both false (NT Prop 1.7.7, `nt` 1036–1048) | pass | none |
| §5.1 relations ⇔ unitarity | general real q | `u*u=[[a*a+c*c, c*a*−qa*c*],[ac−qca, aa*+q²cc*]]`, `uu*=[[aa*+q²c*c, ac*−qc*a],…]`; at q=1/2 with a=0, c=1: `1/4≠1`; `S²(c)=S(−c/2)=c/4` | pass | none |
| §5.2 cup and bounds | F=[[0,1],[−2,0]] | `FF̄=−2I`; `E=−2e₀⊗e₁+e₁⊗e₀`, `‖E‖²=5=Tr F*F ≥ n|c|=4` (AM–GM); `J(e₀)=−√2e₁`, squared norm 2; `F↦VFVᵗ` gives `u′=(VFVᵗ)ū′(VFVᵗ)⁻¹` | pass | none |
| §6.1 reconstruction | Rep(S₃) | `1+1+4=6` coefficients vs 4 diagonal; hypotheses equal Malacarne Thm 4.1 (`malacarne` 285–291) | pass | none |
| §7.1 Haar and coamenability | q=1/2; q=±1; q=−1 model | `h(c*c)=(1−q²)/(1−q⁴)=4/5`, `h((c*c)²)=(3/4)/(63/64)=16/21`; endpoints `∫t=1/2`, `∫t²=1/3`; `⟨ξ₂,aξ₂⟩=√3/4`; `ac=√(t(1−t))zw σ₃σ₁=−ca` | pass | none |
| §7.2 dimensions and loops | n=2, d=5/2; F_q | Hilbert 1, 2, 3, 4; intrinsic 1, 5/2, 21/4, 85/8; β=25/4; δ=−5/2; `F_q=[[0,1],[−q⁻¹,0]]`: c=−q⁻¹, `‖E‖²/|c|=q+q⁻¹`; n=3: ε(χ)=3∉[−2,2] | pass | none |
| `quantumInteger` | q=1/2; q=1 | [2]=5/2, [−2]=−5/2, [0]=0; q=1: `0/0=0` vs the Laurent value 2 | pass | none |
| `quantumSL2Comul_exists` | generic; q=±1; q=0 | `[ΔE,ΔF]=[E,F]⊗K⁻¹+K⊗[E,F]` since `KF⊗EK⁻¹=FK⊗K⁻¹E`; this equals `Δ((K−K⁻¹)/(q−q⁻¹))`; q=0 gives `U_0=ℂ[K^±1]` with Δ existing, so `hq` is unused (a note, not a finding) | pass | none |
| `quantumSL2PBW_exists` | a=b=1 | `KF=q⁻²FK=4FK`, matching `q^(−2ab)=4`; Virelizier Prop 2.4 (`virelizier` 358–359) proves spanning only, under "not a root of unity", the same hypothesis | pass | none |
| `quantumSL2_center` | L_m^ε | `EF+(q⁻¹K+qK⁻¹)/(q−q⁻¹)² = FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)²` (the Lean `quantumSL2Casimir`); scalars 10/9, 17/9, 65/18 and their negatives, all distinct; on L₁⁺, `FE+toral = diag(0,1)+diag(17/9,8/9) = (17/9)I` | pass | none |
| `quantumSL2_finite_semisimple` | §8.3 route | r=1: `EF=FE+[1](K−K⁻¹)/(q−q⁻¹)`; at r=m+1, `X_(m+1)=(q^(−m)K−q^mK⁻¹)/(q−q⁻¹)=0` forces `K²=q^(2m)`; L₀⁻⊕L₁⁺ has Casimir blocks −10/9 and 17/9 | pass | none |
| `quantumSL2_simple_classification` | L₁⁻; L₂⁺ | L₁⁻: K=diag(−1/2,−2), E=[[0,−1],[0,0]], F=[[0,0],[1,0]], `EF−FE=diag(−1,1)=(K−K⁻¹)/(−3/2)`; L₂⁺: `[j+1][m−j]−[j][m−j+1]` gives 5/2, 0, −5/2, which is `[2−2j]`; `KE/EK=q²` | pass | none |
| `quantumSL2_exists_ladderAction` | m=0, ε=−1; m=1, ε=1 | ℂ with K=−1, E=F=0; `Ke₀=(1/2)e₀`, `Ee₀=0` | pass | none |
| `quantumSL2_locallyFinite_iff` | L₀⁻; ⊕_ℕL₀⁺; Verma M(1); 0 | true/true; true/true; weights `4^j` are signed weights, but F is not nilpotent: false/false; zero module true/true | pass | none |
| `quantumSL2_locallyFinite_semisimple` | M(1); L₀⁻ | M(1) excluded by `hV`; L₀⁻ simple | pass | none |
| §8.2 vs Virelizier Ex 3.3 | n=2, i=1 | `(q²−q⁻²)(q²−1)/((q−q⁻¹)(q²−1)) = q+q⁻¹ = 5/2 = [1][2]` with `Fv_i=v_(i+1)` (`virelizier` 554) | pass | none |
| §8.5 Clebsch–Gordan, binomials, pivot | m=n=j=1; r=2; L₁⁺, L₀⁻ | α₁=−q=−1/2, `ΔE(v₀⊗w₁−½v₁⊗w₀)=(½−½)v₀⊗w₀`; middle coefficient `q[2]=1+q²=5/4`; `tr(K⁻¹)=5/2` and −1; `S²=Ad(K⁻¹)` (`virelizier` 358) | pass | none |
| §8.6 compact form | m=1 | `h₁/h₀=q=1/2`; `E*=KF=2F` on L₁⁺; orthonormal entries `√2=q^(−1/2)` and `1/√2=q^(1/2)`; `[E,F]=diag(1,−1)`; `(KE)*=KFK=q²K²F=(q²EK)*` | pass | none |
| §8.7 classical specialisation | v=1, m=1, 2 | `[E,F]=H=diag(1,−1)`, `[H,E]=2E`; m=2: F 1,2,0; E 0,2,1; `[E,F]=diag(2,0,−2)` | pass | none |
| HilbertModules row `:87` | H2 text | `HilbertModules/README.md:179`–`:260` has no category | fail as worded | R04 |

**Pinned declarations opened (file:line at the pins).**

- Mathlib:
  - `norm_map_star_mul_le` and `norm_map_mul_star_le` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:113`, `:126`); `PositiveLinearMap.GNS` (`:147`); `gnsStarAlgHom` (`:246`).
  - `orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean`).
  - `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean:269`).
  - `gelfandStarTransform_naturality` (`Analysis/CStarAlgebra/GelfandDuality.lean`) and `compContinuousMap` (`:319`).
  - `homeoEval` (`Topology/ContinuousMap/Ideals.lean:422`).
  - `NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean`).
  - `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`); `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`).
  - `antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean:57`).
  - `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean:159`).
  - `ModuleCat.restrictScalars` (`Algebra/Category/ModuleCat/ChangeOfRings.lean:85`).
  - `ObjectProperty.FullSubcategory` (`CategoryTheory/ObjectProperty/FullSubcategory.lean:39`).
  - `SkewPolynomial` (`Algebra/SkewPolynomial/Basic.lean:93`).
  - `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean:72`); `DoubleCentralizer` (`…/Multiplier.lean:67`); `CStarMatrix` (`…/CStarMatrix.lean:44`).
  - `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:67`); `WithConv` (`Algebra/WithConv.lean`).
- Tau Ceti:
  - `coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`).
  - `map_antipode_mul_coefficientMatrix` (`:173`, `S(u)·u=1`).
  - `matrixComodule` (`…/FromMatrix.lean:166`).
  - `IsCompletelyReducible` (`Comodule/LinearlyReductive.lean:104`).
  - `fixedSubcomodule` (`Comodule/Fixed.lean:57`).
  - `convolutionAction` (`Comodule/Convolution.lean:49`).
  - `Comodule/Finite/{Monoidal,RightRigid,Rigid,TensorProduct}.lean`.
  - `TauCeti.HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean:88`, `:97`).
  - `FDRep.ofShrink` and `ofShrinkEquiv` (`RepresentationTheory/FDRep.lean:248`, `:254`).
  - The pin has no quantum integer, U_q, Hopf *-structure or spatial tensor product. `KnotTheory/Jimbo` is an R-matrix representation, not U_q.
- External: the AlgebraicAnalysis file at the pinned commit (`README.md:1708`) declares `rightMul_assoc_of_ring` and `oreLift`, for an ordinary derivation (σ=id) over a noncommutative `[Ring B]`, as `README.md:1709`–`:1712` says.

**Cross-roadmap citations resolved.** Main is at `94294cd`. Since `ad30d94` only AmenableGroups' `STATUS.md` and `PROGRESS.md` changed among the suppliers.

- HilbertModules:
  - H1 (`:126`–`:177`): completion, Hilbert sums, `H⊗A`.
  - H2 (`:179`–`:260`): `L_A`, `θ`, `K_A`, `L_A(E)≅M(K_A(E))` with the strict topology, `K_A(H⊗A)≅K(H)⊗min A` for arbitrary H.
  - H3 (`:262`–`:323`): interior tensor products, induced maps, associators, both unitors with the nondegeneracy hypothesis.
- CStarAlgebras: C1.7 (`:468`–`:495`); C1.CommutativeMultiplierMorphisms (`:497`–`:521`); C5.1 (`:1112`–`:1141`: flip, associativity, functoriality with norm bounds); C5.2 (`:1143`–`:1167`); QuantumGroups is named as a consumer at `:1957`.
- Subfactors: §3.1 `:676`, §3.2 `:697` with `markovTrace_nonneg_iff` at `:729`, §3.3 `:774`. Its §2.4 (`:490`–`:512`) is the concrete bimodule case and does not duplicate the abstract theory.
- VonNeumannAlgebras: Layer 0 `:275`, Layer 1 `:392`, Layer 3 `:905`, Layer 4 with V4.Core `:972` and V4.PositivePredual `:1059`, V10.ModularTheory `:2364`, V10.KMS `:2459` with the convention `σ_t(x)=Δ^(it)xΔ^(−it)` at `:2462`, Layer 11 `:2785` (full left Hilbert algebras `:2794`), V13b.SpatialNorm `:3744`.
- TemperleyLieb: Layer 4 presentation theorem `:554`; Layer 6 negligibles and Goodman–Wenzl `:713`–`:725`; Layer 7 Karoubi envelope `:767`.
- OperatorAlgebraDynamics: D1 `:148`; D2 `:221`, with Reiter P₁/P₂ at `:258`–`:262`.
- FreeProbability: F1 `:127`; F3 `:255`, with `2sqrt3` vs 4 and non-injectivity at `:305`–`:308`; F6 `:532`.
- AmenableGroups: Layers 1 `:98`, 5 `:289`, 7 `:415`.
- PivotalSpherical: Layers 0–2 `:257`–`:351`; Layer 7 `:477`, with `RigidCategory (FDRep k G)` at `:238` and `leftTrace`/`rightTrace` at `:61`.
- RepresentationTheory: CompactGroups `su2Irrep` `:190`; LieHighestWeight `IsSl2Triple` `:5`.
- Downstream:
  - QuantumEnvelopingAlgebras cites "Q8 item 1" (`:510`) and the coproduct `Δ(Eᵢ)=Eᵢ⊗1+Kᵢ⊗Eᵢ` (`:88`), matching §8.1.
  - HopfologicalAlgebra cites "Q8 item 5: `FiniteHopfModuleCat k H`" (`:165`, `:319`–`:337`) in the universe of k (`:72`), matching §8.5.
  - Both resolve through the crosswalk at `README.md:155`–`:160`.
  - No roadmap on main or at an open head cites a QuantumGroups id that this head drops (§0.4 and §0.5 are cited nowhere).

**Ownership.**

- §§0.2–0.3 are also claimed by CategoricalOperatorAlgebras #888 (CA1a/CA2a, `README.md:43`, `:1956` at its head) and by TemperleyLiebOperatorAlgebras #867 (Layers 1–3, `README.md:137`, `:1777`–`:1787`). Both are later in the merge order (226, 242). QuantumGroups is on main, so it is the earlier owner. The notions stay here, the move is recorded, and #888 and #867 must cite §§0.2–0.3. #1649 takes the opposite line (R01).
- No roadmap on main owns abstract standard solutions.
- `C₀(X,C₀(Y))≅C₀(X×Y)` is owned only here (and in #1649, the same folder). Mathlib has no `C₀` curry.
- NoncompactQuantumSymmetry #1015, OperatorAlgebraDynamics #1137, CompactQuantumMetricSpaces #1155 and HilbertModules #1149 overlap no target here. #1149 drops no H1–H3 id (overlaps.md).
- Other open pull requests were searched with `roadmaps grep` by object.

**Seeded sample** (statement, theorem number, page, hypotheses).

1. §0.1: no literature locator (R03). The mathematics was checked: the inner-product identity and the onto argument (table), and the H2/H3 inputs on main.
2. §0.2:
   - Longo–Roberts: §2 at p.4 (`longoroberts` 121–136, C*-category and conjugates); Lemma 3.3 at p.10 (389, uniqueness up to a unitary); Thm 3.8 at p.15 (621); Thm 3.11 at p.17 (681, minimality of the norm product); Appendix at p.48 (2000).
   - NT: Defs 2.2.10 and 2.2.12 at p.32 (`nt` 1427, 1446); Thm 2.2.14 at p.33 (1501); Thm 2.2.17 at p.35 (1596); §2.5 `R̄=−τR` at p.52 (2431); Def 2.7.1 and the remark `d(U)≥1` at p.70 (3236–3241). The equality case is the README's own additivity argument.
3. §0.3: NT pp.54–55 (`nt` 2490–2495: d≥2 or d=2cos(π/k), k≥4, the case `‖R‖>1` assumed at 2432); Penneys Prop 4.5.3 at printed p.158 (`penneys` 745), Facts 4.5.5 at p.159 (758), Ex 4.6.12 at p.163 (941), Ex 4.6.14 at p.164 (1000–1009). With n=2 ([3]=0 at d=1), Ex 4.6.14 covers m=3.
4. §1.1: no literature locator (R03). Kustermans–Vaes Def 2.1 at p.853 (`kustermansvaes` 743–746) and p.840 (174–200) fit. The extracted text has no explicit C₀(G) example.
5. §1.2: Timmermann Thm 5.1.6 is not verifiable (below). The Cesàro and domination route is standard, and the Checks were computed.
6. §2.1: Timmermann Def 5.1.4 and §5.3 are not verifiable. The convention agrees with Tau Ceti's `tensorCombine` and `coefficientMatrix`.
7. §4.1: NT Thm 1.6.6 at p.18 (`nt` 810–820, generated by unitary coefficients); Thm 1.7.3 at p.22 (977–978); Prop 1.7.7 at p.23 (1036–1048). Timmermann Prop 2.2.4 and Thm 3.2.12 are not verifiable.
8. §5.1: BMT §2 at pp.12–14 (`bmt` 592–624, `0<|q|<1`, `U=[[α,−qγ*],[γ,α*]]`). Timmermann Ch. 6 is not verifiable.
9. §5.2: Banica Prop 1 and Lemma 1 at p.2 (`banica` 54–66: E=Σ F_ji e_i⊗e_j, `(E*⊗1)(1⊗E)=c`); Malacarne Lemma 2.1 at p.3 (`malacarne` 183).
10. §6.1: Malacarne Thm 4.1 at p.5 (`malacarne` 285–291): essentially small, with conjugates, closed under sums and subobjects, unitary fibre functor. Same hypotheses.
11. §7.2: Banica Thm 1 at p.2 (`banica` 42–46) and Prop 2 (75), with β=c⁻²‖E(1)‖⁴ (72). The n≥2 range is from the abstract (9).
12. §8.2: Virelizier Ex 3.3 at p.11 (`virelizier` 552–555), Prop 3.7 and Cor 3.8 at p.12 (585–594).
13. §8.5: Virelizier Lemma 2.3 at p.6 (265–290), Prop 4.1 at pp.13–14 (644–660).
14. §8.6: Virelizier §2.3 at p.8 (348–357). The pairing values are the README's own computation, checked in the table.
15. §8.7: Virelizier Ex 3.3 after rescaling (checked in the table).

Also located: BMT Thm 2.2 at p.6 (`bmt` 257), Thm 2.8 at p.10 (461), Cor 2.9 at p.11 (478), Thm 2.12 at p.13 (614), Cor 2.13 at p.14 (645), Thm 3.6 at pp.18–19 (858–865); Virelizier Thm 3.13 and Cor 3.14 at p.13 (625, 635).

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008, DOI 10.4171/043): every locator at `README.md:462`, `:518`, `:546`, `:569`, `:637`, `:683`, `:730`, `:769`, `:838`, `:980`, `:1219`, `:1601`, `:1657`–`:1664`, `:1669` and `Suggested.lean:137`. The manifest settles it as `uncertified` (paywalled), so it is cited by locator only. The mathematics of §§3.1, 4.1 and 5.1 was checked against `nt` and `bmt` instead.
- The general theorems are certified only by the computed instances above and the located inputs.
- Ownership against open pull requests not reachable by `roadmaps grep` was not checked.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type fusion holds for every n ∈ ℕ with F F̄ real; it should require n ≥ 2, as its abstract does, since n = 1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the q-numbers `(t)_q`, t ∈ ℤ, lie in the unit group; it should exclude t = 0, where `(0)_q = 0`; affects nothing.
- **Misprint** in bmt at the proof of Theorem 2.12, printed p.13: the source writes the Haar state as (1−q²) times the unweighted sum of diagonal entries `⟨φ(a)e_(n,0),e_(n,0)⟩`, so h(1) diverges; it should carry the weight q^(2n); affects nothing (the faithfulness step holds for any positive weights).
