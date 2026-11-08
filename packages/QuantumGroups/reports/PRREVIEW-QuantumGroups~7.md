# Review of QuantumGroups (pull request #1705 at 36f8753)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `36f8753332e02ce09ab34bd9b11fdb6f84b11da1`. This is a full review: 477 lines changed since `a938955`, the head review ~6 read. No file of the pull request was changed. There are four findings, two of them blocking; both blocking findings arise because two suppliers merged to main after review ~6 (CStarAlgebras on 2026-11-07, HilbertModules on 2026-11-08), so that Layer 0 now restates roadmaps on main. The worker's gate passes every check, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

Locations are in `TauCetiRoadmap/QuantumGroups/` unless another roadmap is named. Other roadmaps are read on main (`ad30d94`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

**Status of review ~6's findings (head `a938955`).**

| ~6 | Passage at this head | Status |
| --- | --- | --- |
| R01 (P2) gate fails on CStarAlgebras | No `CStarAlgebras` in the README; §0.4 (`README.md:323`–`:380`) states the minimal-tensor functoriality, `C₀(X)⊗min B≅C₀(X,B)`, `𝓜(ℂ,C₀(X))=C_b(X)` and the pullback theorem as targets; V13b.SpatialNorm supplies the norm (`:16`–`:18`, `:81`). Depcheck: 0 problems | Repaired by option (b). CStarAlgebras has since merged, so the moved material is now a restatement (R02 below) |
| R02 (P2) §0.3 restates Subfactors | `:286`–`:296`: "Consume Subfactors §3.1 … §3.2 … `markovTrace_nonneg_iff` … §3.3 … `tr_n=d⁻ⁿτ_n`"; supplier row `:80`; scope `:30`–`:34`; the d=1, d=√2, d=1/2 positivity Checks are gone | Repaired. Every cited Subfactors id resolves (`Subfactors/README.md:676`, `:697`, `:729`, `:774`, `:792`, `:801`, `:804`) |
| R03 (P3) four lemma-theorems, docstring gaps | `counit_star`, `antipode_star_antipode_star`, `freeOrthogonalRelation`, `freeOrthogonalCup_invariant`, `suqMatrix`, `SUqRelations`, `suqMatrix_unitary_iff` are gone; no README backtick names them; `Suggested.lean:49`–`:50` names Layer 5's `C(SUq(2))` and `A_o(F)`; `:148`–`:160` state `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive` | Repaired |
| R04 (P3) §4.3 needs §6.3 | `:982`: "*Needs:* §4.2; OperatorAlgebraDynamics D2; AmenableGroups Layers 1,5,7; FreeProbability F3"; `:968`–`:969` "Reconstruction below determines the Hopf *-core; Q4 specifies its chosen completions separately" | Repaired |
| R05 (P3) README/Lean and locators | `:1355`–`:1358` PBW wording; `Suggested.lean:101`–`:105` cites Neshveyev–Tuset Theorem 1.4.2, p. 9; `:167` "Landsman Corollary 3.2.4, pp.59–60"; Proposition 2.2.4 now has no page range | Repaired |
| R06 (P3) #1649 conflicts, description mismatch | The pull request's title and description are unchanged ("construct the ribbon category RepUqg", "Add Q9"); #1649 is open at `cc02cfc` and overlaps.md reports the conflict | Not repaired (R03 below) |
| R07 (P3) "Q8 item k" crosswalk | `:149`–`:153`: "A citation "Q8 item k" denotes §8.k … Q8 item 1 → §8.1 … Q8 item 5 → §8.5, … cited as FiniteHopfModuleCat k H"; `:1532`; "lane" is gone | Repaired |

## R01 (P2) — §0.1 restates HilbertModules H1–H3, which is on main

**Location:** `README.md:157`–`:215`. `:160`–`:164`: "Construct separated completion of positive semidefinite modules … Construct arbitrary Hilbert direct sums … and the free module H⊗A"; `:173`–`:191`: "Define adjointable operators L_A(E,F) … θ_(x,y)z=x⟨y,z⟩ and K_A(E,F) … Identify L_A(E) with the multiplier algebra … `K_A(H⊗A)≅K(H)⊗min A`"; `:193`–`:200`: "construct E⊗_A F … associator coherence, and the right unitor … the left unitor … requires a nondegenerate left action"; Checks `:209`–`:213`; scope `:19`–`:21`.

**Claim:** Layer 0 owns the Hilbert-module operator and tensor interfaces because no citable roadmap states them.

**Witness:** HilbertModules merged to main on 2026-11-08 (`ad30d94` has `TauCetiRoadmap/HilbertModules/`). Its H1 (`HilbertModules/README.md:126`–`:177`) constructs the completion, the Hilbert direct sums by norm convergence of finite sums, `H⊗A`, and the `a_n=p_n/√(n+1)` example (`:164`–`:165`); H2 (`:179`–`:260`) the adjoint pairs with automatic linearity and boundedness, `L_A(E,F)`, `θ_(x,y)`, `K_A(E,F)`, `L_A(E)≅M(K_A(E))` with the strict topology on bounded sets, `K_A(H⊗A)≅K(H)⊗min A` and `L_A(H⊗A)≅M(K(H)⊗min A)` for arbitrary H (`:209`–`:213`), and the `J⊥=0`, `θ_(1,1)` examples (`:255`–`:259`); H3 (`:262`–`:323`) the interior tensor product with Gram positivity, associators, both unitors and the nondegeneracy hypothesis for the left one. Main's own version of this README cites exactly "HilbertModules H1–H3" for these (`QuantumGroups/README.md:41` on main). HilbertModules cites no QuantumGroups section.

**Repair:** replace the constructions of §0.1 by a supplier citation and delete the restatement.
- Add the supplier-table row "HilbertModules H1–H3": H1 for completion, Hilbert direct sums and `H⊗A`; H2 for `L_A`, `K_A`, `L_A(E)≅𝓜(ℂ,K_A(E))` with its strict topology and `K_A(H⊗A)≅K(H)⊗min A`, `L_A(H⊗A)≅𝓜(ℂ,K(H)⊗min A)`; H3 for interior tensor products with associators and unitors.
- Keep in §0.1 only what HilbertModules does not state: the three-leg identifications §2.1 uses (`(H⊗A)⊗_Δ(A⊗min A)≅H⊗(A⊗min A)`, the `U_12`, `U_13` legs), as one short target with its own Checks, or move them into §2.1 and delete §0.1.
- Delete the API bullets `:202`–`:206` and the Checks `:209`–`:213` (they are HilbertModules' own), record the deferral in the scope paragraph `:19`–`:21` and in the docstring `Suggested.lean:30`–`:34` ("constructions of the roadmap or of VonNeumannAlgebras" → HilbertModules), and repoint the citations of §0.1 at `:265`, `:391`, `:534`, `:569`, `:597`, `:628`, `:936`, `:990`.

Tested: the dependency check on a copy of this README with the edge `*Needs:* HilbertModules H1–H3; CStarAlgebras §§1.7–1.8, 5.1–5.2` added prints `depcheck: 229 roadmaps, 2318 edges, 0 problem(s)`; HilbertModules is on main, so the edge is neither upward nor cyclic.

## R02 (P2) — §0.4 restates CStarAlgebras §§1.7, 1.8, 5.1 and 5.2, which are on main

**Location:** `README.md:323`–`:380`. `:331`–`:338`: "Star homomorphisms f:A→C and g:B→D give a star homomorphism f⊗g … the flip … the associator"; `:339`–`:347`: "identify `C₀(X)⊗min B` with `C₀(X,B)` … `C₀(X)⊗min C₀(Y)≅C₀(X×Y)`"; `:349`–`:365`: "Identify Mathlib's multiplier algebra `𝓜(ℂ, C₀(X))` with the bounded continuous functions … strict topology … pullback … nondegenerate … the only extension … strictly continuous … proper"; Checks `:374`–`:378`; scope `:21`–`:23`.

**Claim:** Layer 0 owns the tensor products of star homomorphisms, `C₀(X)⊗min B≅C₀(X,B)` and the commutative multiplier and pullback facts (`:21`–`:23`).

**Witness:** CStarAlgebras merged to main on 2026-11-07. `CStarAlgebras/README.md:468`–`:481` (C1.7) constructs the strict topology by the seminorms `m↦‖ma‖+‖am‖`, the unique strictly continuous extension of a nondegenerate star homomorphism, `M(C₀(X))=C_b(X)` and strict convergence on bounded sets as uniform convergence on compacts; `:497`–`:507` (C1.CommutativeMultiplierMorphisms) the bijection between continuous maps and nondegenerate star homomorphisms `C₀(Y)→C_b(X)` with the compact-support cutoffs, contravariant composition and "lands in C₀(X) exactly when h is proper", with the Check `t↦0` nondegenerate but not proper (`:519`–`:521`) that §0.4 repeats at `:378`; `:1112`–`:1125` (C5.1) functoriality of `⊗min` with norm bounds, associativity and the flip; `:1143`–`:1152` (C5.2) `C₀(X)⊗min A≅C₀(X,A)` and `C(X)⊗min C(Y)≅C(X×Y)` with pullback naturality. `CStarAlgebras/README.md:1957` names QuantumGroups as the consumer of `C1.CommutativeMultiplierMorphisms` and Layer 5, and `:84`–`:90` says QuantumGroups supplies nothing to it. Review ~6 asked for this move only because CStarAlgebras was not on main at the time.

**Repair:** delete the constructions of §0.4 and cite.
- Add the supplier-table row "CStarAlgebras §§1.7–1.8, 5.1–5.2": C1.7 for multipliers, the strict topology and the unique strictly continuous extension; C1.CommutativeMultiplierMorphisms for pullbacks, nondegeneracy, composition and properness; C5.1 for `f⊗g`, the flip and the associator; C5.2 for `C₀(X)⊗min B≅C₀(X,B)` and `C₀(X)⊗min C₀(Y)≅C₀(X×Y)`. Keep VonNeumannAlgebras V13b.SpatialNorm for the norm, as C5.1 itself does.
- In §1.1 write "Specialize CStarAlgebras C1.CommutativeMultiplierMorphisms" for "§0.4's pullback theorem" (`:401`–`:402`, `:406`, `:416`–`:417`, `:437`), and repoint `:452`, `:457`, `:514`, `:522`, `:569`, `:936`, `:1031`, `:1082`, `:1202` and the Dependencies `:393`; update the scope `:21`–`:23`, the Layer 0 Examples `:382`–`:386` and the docstring `Suggested.lean:30`–`:34`.
- The Checks `:374`–`:378` are C1.8's and C5.2's own; nothing of §0.4 remains, so delete the subsection.

Tested: the dependency check above (0 problems with both new edges); CStarAlgebras cites no QuantumGroups section, so no cycle.

## R03 (P3) — #1649 is a conflicting open revision of this folder, and the pull request describes a head that does not exist

**Location:** the pull request's title ("construct the ribbon category RepUqg") and description ("Add Q9 to build `RepUqg` …", "Only the roadmap README changes; no Lean interfaces or implementation files change").

**Claim:** this pull request is the only open revision of QuantumGroups and its description says what it does.

**Witness:** overlaps.md reports that #1649 and #1705 conflict in `README.md` and `Suggested.lean`; #1649 is open at `cc02cfc`, and its README differs from this head in 751 lines (diff of `roadmaps show QuantumGroups --pr 1649` against this README). This head has no Q9 and no ribbon category, and `Suggested.lean` changed by 115 lines since `a938955` alone. Review ~6 R06 asked for the same; nothing changed.

**Repair:** state the order in the description (this pull request supersedes #1649, which is closed; or #1649 merges first and this one is rebased onto it), and retitle and redescribe it to what the head does: Layers 0–8 in house shape with the stated Lean headlines. No file of the folder changes for this finding.

## R04 (P3) — Two locators overreach their sources

**Location and witness:**
1. `README.md:321`–`:322`: "Neshveyev–Tuset §2.5, pp.54–55, for the unitary Temperley–Lieb category and its sign τ", cited for §0.3, which fixes "d≥2 or d=2cos(π/m), m≥3" (`:269`). The source constructs `TL_(d,τ)` only for "d≥2 or d=2cos(π/k) (k≥4)" (`nt` lines 2490–2495, printed p.54) after assuming `‖R‖>1` (`nt` line 2432, p.52). The case m=3 (d=1), which §0.3 includes and whose Check at `:319` uses, is covered by Subfactors §3.3 (the `A_2` path model) and Penneys Example 4.6.14, not by Neshveyev–Tuset.
2. `README.md:1705`: "Construction 3.5.3, pp.66–67". The construction and its proof are on p.66 (`landsman` lines 3086–3112; p.67 begins at line 3113 with §3.6).

**Repair:** 1. Write "Neshveyev–Tuset §2.5, pp.54–55, for the unitary Temperley–Lieb category at d≥2 and d=2cos(π/m), m≥4, and p.52 for the sign τ; the case m=3 rests on Subfactors §3.3 and Penneys Example 4.6.14". 2. Write "Construction 3.5.3, p.66". Tested: the d=1 category has simples 0 and 1 with `1⊗1=0` and `Q_n=ℂ` for every n (one path of each length on `A_2`), which is what `:319` states.

## Verified sound

**Scope, gate and build.**
- Head `36f8753332e02ce09ab34bd9b11fdb6f84b11da1`, worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty; `STATUS.md`, `PROGRESS.md` and `metadata.toml` equal main's.
- The content checkout is at main `ad30d94`; the pins are those of the worktree's `lake-manifest.json`.
- The worker's gate: every check 0, `OK`.
- `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 in 19 s with exactly 13 `declaration uses sorry` warnings (lines 107, 138, 148, 156, 223, 241, 251, 258, 266, 278, 299, 322, 333) and nothing else.
- No `set_option`, `lemma`, admitted `example`, `#eval`, LaTeX delimiter, pull-request number or process word in either file.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 229 roadmaps, 2316 edges, 0 problem(s)
```

**Signatures and padding probe.**
- Every one of the 26 elaborated types in the worker's signature file was compared with its README statement; the two new headlines were re-elaborated with `#check` (`haar_modular_automorphism : … ∃! θ : A ≃ₐ[ℂ] A, ∀ a b, h.functional (a*b) = h.functional (b * θ a)`; `haar_trace_iff_antipode_involutive : (∀ a b, h(ab)=h(ba)) ↔ ∀ a, S(S a) = a`), and both match `README.md:867`–`:872`. No mismatch; the only "dropped binder" lead, `[StarModule ℂ A]` on `AlgebraicHaar`, is unused by its fields, and every theorem that needs it carries it.
- A scratch copy with every `sorry` replaced by `first | rfl | infer_instance | simp | simp_all | aesop` produced 13 errors, one per admitted theorem (probe lines 120, 141, 151, 159, 236, 246, 252, 261, 270, 291, 304, 328, 337): nothing closes in one tactic. The six definitions (`StarCompatibleHopf`, `AlgebraicHaar`, `unitaryCoefficientSet`, `SL2Generator`, `QuantumSL2Relation`, `QuantumSL2`, `quantumSL2Generator`, `quantumSL2KUnit`, `quantumSL2Casimir`, `quantumInteger`, `QuantumSL2LocallyFinite`, `QuantumSL2SignedWeights`) each occur in a headline's statement; no API lemma, Check mirror or small-value computation is declared.

**Headline coverage.**

| Headline | At this head |
| --- | --- |
| §3.1 Schur orthogonality | `schur_orthogonality` |
| §4.1 compact type, modular automorphism, Kac equivalence | `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive` |
| §§8.1–8.4 coproduct, PBW, domain, centre, finite semisimplicity, classification and ladders, local-finiteness criterion and semisimplicity | nine theorems, `Suggested.lean:223`–`:338` |
| Layers 0–2, 4–7, §§3.2–3.4, §§8.5–8.7 | named in the docstring with the missing carrier; no Hilbert-module operator algebra, spatial C*-tensor product, C*-tensor category or Hopf-module monoidal structure exists at the pins (grep of `Analysis/CStarAlgebra` and of Tau Ceti for a spatial or minimal tensor product: none) |

**Adversarial pass (computed).** q = 1/2 unless stated; F̃ = diag(2, 1/2) is the SU_(1/2)(2) fundamental weight matrix, verified by `ū*F̃ū = F̃`: entry (1,1) `2aa* + ½c*c = 2(aa* + ¼c*c) = 2`, entry (2,2) `2q²c*c + ½a*a = ½`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 rank-one maps | over ℂ | `θ_(e₁,e₂)z = e₁⟨e₂,z⟩ = e₁₂`, adjoint `e₂₁`, product `e₁₁`; H=0: both algebras 0 | pass | R01 (HilbertModules H2) |
| §0.1 Hilbert sums | A=K(ℓ²), `a_n=p_n/√(n+1)` | tail `‖Σ_(n≥N) p_n/(n+1)‖ = 1/(N+1) → 0`; `Σ 1/(n+1) = ∞` | pass | R01 (H1 `:165`) |
| §0.1 right vs left module | x=e₁₁, y=e₁₂ | `x*y = e₁₂`, `yx* = 0` | pass | R01 |
| §0.1 interior tensor | A=ℂ², φ(a,b)=a; φ=0 | `A⊗_A ℂ ≅ ℂ`; zero action: all norms 0, no left unitor | pass | R01 (H3) |
| §0.2 C*-identity | T=diag(2,1) | `‖T†T‖ = 4 = ‖T‖²`; Hilbert–Schmidt `√17 ≠ 5` | pass | none |
| §0.2 rescaled cup | (2R, R̄/2) on ℂ² | squared norms 8 and 1/2; zigzag `2·½ = 1` | pass | none |
| §0.2 d≥1 | unit ⊆ X⊗X̄ | `nt` 3240–3241: d(1)=1, d(U)≥1 | pass | none |
| §0.3 cup form | d=5/2 | `‖∪‖² = d`; `tr_2(∪∪†/d) = d⁻²·d/d = 1/d² = 4/25`; `tr_2(1−p) = 21/25`; linear reflection: `⟨i∪,i∪⟩ = i²d = −d` | pass | none |
| §0.3 negligible JW | d=√2 (m=4) | `[3] = d²−1 = 1`, `[4] = d³−2d = 2√2−2√2 = 0`; dims 1, √2, 1 | pass | none |
| §0.3 signed vs positive | δ=−5/2 | `e=−(5/2)p`: `e² = (25/4)p = δe`; `p_ip_(i±1)p_i = d⁻²p_i`, `d⁻² = 4/25` | pass | none |
| §0.3 fusion | m=3 (d=1); d=2 | labels {0,1}, `1⊗1`: upper index `min(2, 2·1−2) = 0` ⇒ 0; d=2: `0⊕2`; `Q_n = ℂ` at d=1 | pass | R04.1 locator |
| §0.4 two-point tensor | X={1,2}, B=M₂ | `‖1[1]⊗e₁₁ + 1[2]⊗e₂₂‖ = max(1,1) = 1 < 2`; X=∅: zero algebra | pass | R02 (C5.2) |
| §0.4 ε⊗id | C(C₂) | `1[(s,s)] ↦ 1[(s,s)](e,·) = 0`, norm 1 ↦ 0 | pass | R02 |
| §0.4 strict limit | `u_n(t) = max(0,1−|t|/n)` | `‖(u_n−1)f‖_∞ → 0` for f∈C₀; `‖u_n−1‖_∞ = 1` | pass | R02 (C1.7) |
| §0.4 multipliers, pullbacks | sin; t↦t²; t↦0 | sin ∉ C₀(ℝ); `f∘(t↦t²) ∈ C₀`; `f(0)·1 ∉ C₀` if f(0)≠0, and `(f∘h)u = u` when f(0)=1 | pass | R02 (C1.8 `:519`–`:521`) |
| §1.1 coproduct order | S₃, f=1[(123)], g=(12), h=(23) | `gh = (123)`, `hg = (132)`: Δf(g,h)=1, Δf(h,g)=0 | pass | none |
| §1.1 noncompact | ℤ, f=1[0] | Δf(N,−N)=1 ∀N, ∉ C₀(ℤ²); `r₊Δf = f(0) = εf` | pass | none |
| §1.2 cancellation | monoid {1,0} | `F(0,1) = F(0,0)`: span dim 3 < 4 | pass | none |
| §1.2 Fell unitary | ℤ | `W(λ₁⊗1)W*(δ₁⊗δ₂) = δ₂⊗δ₃ = (λ₁⊗λ₁)(δ₁⊗δ₂)` | pass | none |
| §2.1 tensor convention | Tau Ceti `tensorCombine` | `((m⊗c)⊗(n⊗d)) ↦ (m⊗n)⊗(c·d)` (`Comodule/TensorProduct.lean:101`–`:102`): `(u⊠v)_((i,k),(j,l)) = u_ij v_kl` | pass | none |
| §2.2 unitarization | C₂, U(s)=[[1,2],[0,−1]] | `U² = I`; `U*U = [[1,2],[2,5]]`, `T = [[1,1],[1,3]]`, det 2; `U*TU = T` | pass | none |
| `schur_orthogonality` | orientation | Tau Ceti `δ(b_j) = Σ_i b_i⊗u_ij` (`Matrix.lean:109`–`:111`); NT 1.4.2 `h(u_kl u_ij*) = δ_ki ρ_jl/dim_q`, `h(u_ij* u_kl) = δ_jl (ρ⁻¹)_ki/dim_q` ⇒ `F̃ = ρᵗ` as the docstring says | pass | none |
| `schur_orthogonality` | SU_(1/2)(2) | `h(a*a) = (F̃⁻¹)₁₁/Tr = (½)/(5/2) = 1/5`; `h(c*c) = 2/(5/2) = 4/5 = 1/(1+q²)`; `h(aa*) = F̃₁₁/Tr = 4/5 = 1 − q²h(c*c)` | pass | none |
| `schur_orthogonality` | H=0 | `⊥ = ⊤` in the subcomodule lattice: no `IsSimpleOrder`, vacuous, no 0/0 | pass | none |
| §3.2 Plancherel | a+c | `1/5 + 4/5 = 1`, mixed term `(F̃⁻¹)₁₂ = 0` | pass | none |
| §3.2 characters | a | `θ(u) = f₁*u*f₁ = F̃uF̃`: `θ(a) = 4a`; `f_z(a) = 2^z`, `f₁*f₁(a) = 4 = f₂(a)`; Vandermonde [[1,1],[1,4]], det 3 | pass | none |
| §3.3 dimensions | F=diag(2,½) | `Tr F = Tr F⁻¹ = 5/2 > 2`; `tr(F e₁₁) = 2`, `tr(F⁻¹e₁₁) = ½` | pass | none |
| §3.4 KMS sign | a | `σ_(−i)(a) = 4a`: `h(aa*) = 4/5 = 4·h(a*a)`; inverse convention 1/20; VNA V10.KMS uses `σ_t(x)=Δ^(it)xΔ^(−it)` (`VonNeumannAlgebras/README.md:2462`) | pass | none |
| §3.4 S² = τ_(−i) | c | `S(c) = −qc`, `S²(c) = q²c = c/4`; `τ_(−i)(u) = FuF⁻¹`: `(FuF⁻¹)₂₁ = ½·c·½ = c/4` | pass | none |
| `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] | h=id spans; `h((a+bu)*(a+bu)) = |a|²+|b|²`; zero ring: span = ⊤ but h(1)=0≠1 (needs `Nontrivial`); ℂ[x]: `(id⊗h)Δx = x + h(x) ≠ h(x)1`, both sides false | pass | none |
| `haar_modular_automorphism` | ℂ[S₃]; SU_(1/2)(2); uniqueness | θ = id on ℂ[S₃]; `θ(a) = 4a`; θ, θ' with the property ⇒ `h(b(θa−θ'a)) = 0 ∀b` ⇒ equal by faithfulness (NT 1.7.3, `nt` 977–978) | pass | none |
| `haar_trace_iff_antipode_involutive` | ℂ[S₃]; SU_(1/2)(2); A=ℂ | trace and `S² = id`; `h(a*a) = 1/5 ≠ 4/5 = h(aa*)` and `S²(c) = c/4 ≠ c`; ℂ: both true (NT 1.7.7, `nt` 1036–1048) | pass | none |
| §4.2 pentagon | ℤ, (δ₁,δ₂,δ₃) | `U_12U_13U_23`: (δ₁,δ₂,δ₅) → (δ₁,δ₂,δ₆) → (δ₁,δ₃,δ₆); `U_23U_12`: (δ₁,δ₃,δ₃) → (δ₁,δ₃,δ₆) | pass | none |
| §4.3 free group | F₂ | reduced norm `2√3 ≈ 3.46 < 4 = ε(sum)` (BMT Thm 2.2, `bmt` 257) | pass | none |
| §5.1 relations | q=1, a=0, c=1; q=½ | `u = [[0,−1],[1,0]]` unitary; `aa* + q²c*c = ¼ ≠ 1`; `S²(c) = c/4` | pass | none |
| §5.2 free orthogonal | F=[[0,1],[−2,0]] | `FF̄ = −2I`; cup `Σ F_ji e_i⊗e_j = −2e₀⊗e₁ + e₁⊗e₀`, `‖E‖² = 5`, zigzag sign `sign(c) = −1`; `d ≤ 5/2 > 2`; `J(e₀) = Fe₀/√2 = −√2e₁`, norm² 2 ≠ 1 | pass | none |
| §6.1 reconstruction | Rep(S₃) | `1+1+4 = 6` vs diagonal 4; hypotheses = Malacarne Thm 4.1 (`malacarne` 285–291) | pass | none |
| §7.1 Haar | q=½; q=±1 | `h(c*c) = (1−q²)/(1−q⁴) = 4/5`; `h((c*c)²) = (3/4)/(63/64) = 16/21`; `∫t = ½`, `∫t² = ⅓` | pass | none |
| §7.1 character | ξ₂, ξ₃ | `ae_(0,j) = 0`, `ae_(1,j) = √(3/4)e_(0,j)`: `⟨ξ₂,aξ₂⟩ = √3/4`; `⟨ξ₃,aξ₃⟩ = (√3/2 + √15/4)/3`; BMT 2.12 needs `0<|q|<1` (`bmt` 592, 614–624) | pass | none |
| §7.2 dimensions | n=2, d=5/2 | Hilbert 1,2,3,4; intrinsic `[4] = d[3]−[2] = 105/8 − 20/8 = 85/8`; `β = d² = 25/4`; n=3: ε(χ)=3 ∉ [−2,2]; n=1: `m₂ = m₄ = 1` | pass | none |
| `quantumInteger` | q=½; q=1 | `[2] = 5/2`, `[−2] = −5/2`, `[0] = 0`; q=1: `0/0 = 0` vs Laurent 2 | pass | none |
| `quantumSL2Comul_exists` | q=±1 (totalised) | commutative quotient; `ΔEΔF − ΔFΔE = KF⊗(EK⁻¹ − K⁻¹E) = 0`, so Δ exists; q=0 excluded by `hq` | pass | none |
| `quantumSL2PBW_exists` | a=b=1 | `K^bF^a = q^(−2ab)F^aK^b`: `KF = 4FK`; q=0 forces E=F=0 | pass | none |
| §8.1 Hopf laws | S(E)=−K⁻¹E, S(F)=−FK | `m(S⊗id)ΔE = −K⁻¹E + K⁻¹E = 0 = εE`; `m(S⊗id)ΔF = −FKK⁻¹ + F = 0`; = `virelizier` 352–357 | pass | none |
| `quantumSL2_simple_classification` | ladder relations | `KE b_j / EK b_j = q²`, `KF/FK = q⁻²`; `(EF−FE)b_j = ε([j+1][m−j] − [j][m−j+1])b_j = ε[m−2j]b_j = (K−K⁻¹)/(q−q⁻¹) b_j`; L₂⁺ diag 5/2, 0, −5/2; L₁⁻ diag −1, 1 | pass | none |
| `quantumSL2_exists_ladderAction` | m=0, ε=−1 | ℂ¹, K=−1, E=F=0, `(K−K⁻¹) = 0`; subspaces ⊥, ⊤ only | pass | none |
| `quantumSL2_center` | Casimir | `Ω = EF + (q⁻¹K+qK⁻¹)/(q−q⁻¹)²` after `EF−FE` substitution, central; scalar on L_m^ε `ε(q^(m+1)+q^(−m−1))/(q−q⁻¹)²`: 10/9, 17/9, 65/18 and negatives, six distinct; on L₁⁺: `FE = diag(0,1)`, toral `diag(17/9, 8/9)`, sum `(17/9)I` | pass | none |
| `quantumSL2_finite_semisimple` | §8.3 route | `EF^r = F^rE + [r]F^(r−1)X_r`, `X_r = (q^(1−r)K − q^(r−1)K⁻¹)/(q−q⁻¹)`: r=2 check `Fc + cF = [2]F(q⁻¹K − qK⁻¹)/(q−q⁻¹)`; on W (K ≈ εq^m) `X_r = ε[m+1−r] ≠ 0` for r≤m, `= 0` at r=m+1 ⇒ `K² = q^(2m)`; V=0 semisimple | pass | none |
| `quantumSL2_locallyFinite_iff` | L₀⁻; ⊕_ℕ L₀⁺; Verma M(1); 0 | T/T (K=−1 is a signed weight); T/T; weights `4^j`, F not nilpotent: F/F; T/T. ⇐: a weight vector v has `E^a v` highest, `U·E^cv = span{F^bE^cv}` finite by F-nilpotence | pass | none |
| `quantumSL2_locallyFinite_semisimple` | M(1); L₀⁻ | M(1) excluded by `hV`; L₀⁻ simple | pass | none |
| §8.5 Clebsch–Gordan | ΔE = E⊗1 + K⊗E | coefficient of `v_i⊗w_(j−i−1)` in `ΔE(Σα_iv_i⊗w_(j−i))`: `α_(i+1)ε[m−i] + α_iεq^(m−2i)δ[n−j+i+1] = 0` ⇒ the stated recurrence; m=n=j=1: `α₁ = −δq = −½` | pass | none |
| §8.5 binomials | r=2 | `(K⊗E)(E⊗1) = q²(E⊗1)(K⊗E)` ⇒ middle `(1+q²)EK⊗E = q[2]EK⊗E`, `5/4`; `K⁻¹F = q²FK⁻¹` ⇒ `Δ(F²)` middle `(1+q²)F⊗FK⁻¹` | pass | none |
| §8.5 pivot | g=K⁻¹ | `S²(E) = K⁻¹EK = Ad(K⁻¹)E` (`virelizier` 358); `tr(K⁻¹|L_m^ε) = Σ_j εq^(−(m−2j)) = ε[m+1]`: 5/2 on L₁⁺, −1 on L₀⁻ | pass | none |
| §8.2 vs Virelizier Ex 3.3 | `Ev_i` coefficient | `(q^(n−2i+2)−q^(−n))(q^(2i)−1)/((q−q⁻¹)(q²−1)) = [i][n−i+1]` with `Fv_i = v_(i+1)`; rescaling `v_i ↦ ([i]!)⁻¹`-type gives `F = [j+1]`, `E = [m−j+1]` | pass | none |
| §8.6 metric | m=1 | `h₁/h₀ = [1]/([1]q⁻¹) = q = ½`; `⟨v₁,KFv₀⟩ = q⁻¹h₁ = 1 = ⟨Ev₁,v₀⟩` ⇒ `E* = KF`; o.n. basis: `E₀₁ = √2`, `F₁₀ = 1/√2`, `K = diag(½,2)`, `[E,F] = diag(1,−1)` | pass | none |
| §8.7 | v=1, m=2 | F 1,2,0; E 0,2,1; `[E,F] = diag(2,0,−2)` | pass | none |

**Pinned declarations opened (file at the pin).**
- Mathlib: `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean`), `WithCStarModule` (`…/Module/Constructions.lean`, `Synonym.lean`), `DoubleCentralizer` (`Analysis/CStarAlgebra/Multiplier.lean`), `CStarMatrix` (`…/CStarMatrix.lean`), `NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass` (`…/CompletelyPositiveMap.lean:152`), `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `norm_map_star_mul_le`, `norm_map_mul_star_le` (`…/GelfandNaimarkSegal.lean`), `gelfandStarTransform`, `gelfandStarTransform_naturality`, `WeakDual.CharacterSpace.compContinuousMap` (`…/GelfandDuality.lean`), `WeakDual.CharacterSpace.homeoEval` (`Topology/ContinuousMap/Ideals.lean`), `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean`), `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`, `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean`), `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:21`, "equal to its double commutant"; the bicommutant theorem is a TODO at `:23`), `IsCompactOperator`, `ZeroAtInftyContinuousMap`, `BoundedContinuousFunction`, `PartitionOfUnity`, `ContinuousLinearMapWOT`, `WithConv`, `SkewPolynomial` (`Algebra/SkewPolynomial/Basic.lean`), `IsGroupLikeElem`, `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`), `antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean`), `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean`), `ObjectProperty.FullSubcategory` (`CategoryTheory/ObjectProperty/FullSubcategory.lean:39`), `ModuleCat.restrictScalars` (`Algebra/Category/ModuleCat/ChangeOfRings.lean:85`), `FGModuleCat`, `ExactPairing` (`CategoryTheory/Monoidal/Rigid/Basic.lean`), `IsSl2Triple` (`Algebra/Lie/Sl2.lean`), `LaurentPolynomial`, `IsSemisimpleModule`, `Karoubi`. No spatial or minimal C*-tensor product under `Analysis/CStarAlgebra`.
- Tau Ceti: `coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`), `coact_basis_eq_sum_coefficientMatrix` (`:109`), `comul_coefficientMatrix_eq_sum` (`:117`), `map_antipode_mul_coefficientMatrix` (`:173`, `S(u)·u = 1`), `matrixComodule` (`…/FromMatrix.lean`), `tensorCombine` (`Comodule/TensorProduct.lean:80`–`:102`), `Subcomodule` (`Subcomodule/Basic.lean`), `IsCompletelyReducible`, `fixedSubcomodule`, `convolutionAction`, `Comodule/Finite/{Monoidal,RightRigid,Rigid,TensorProduct}.lean`, `TemperleyLieb` (`Algebra/TemperleyLieb/Basic.lean`), `markovTrace` (`…/MarkovTrace.lean`), `antipode_antipode`, `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean`), `FDRep.ofShrink`, `ofShrinkEquiv` (`RepresentationTheory/FDRep.lean`). No Hopf *-structure, Hopf integral, quantum integer or spatial tensor product.

**Cross-roadmap citations resolved (main `ad30d94` unless an open head is named).**
- Subfactors §3.1 `:676`, §3.2 `:697` with `markovTrace_nonneg_iff` and `jonesLoopParameters = {2cos(π/m): m≥3} ∪ [2,∞)` `:729`–`:731`, the †-stable trace radical `:726`–`:727`; §3.3 `:774` with the half-line and `A_(m−1)` path models, `ker π_n = R_n` `:791`–`:792`, `tr_n = δ⁻ⁿτ_n` `:801`, the reusable C*-lemma `:804`–`:805`. Subfactors cites no QuantumGroups section.
- VonNeumannAlgebras: Layer 0 `:275` (Gelfand–Naimark `:298`, state separation `:326`), Layer 1 `:392` (`ContinuousLinearMapWOT`, Kaplansky `:477`), Layer 3 `:905`, V4.Core/PositivePredual/Normality `:244`, V10.ModularTheory `:2364`, V10.KMS `:2459` with the convention `:2462`, Layer 11 `:2785` (full left Hilbert algebras, Tomita's theorem, canonical weight `:2794`–`:2804`), V13b.SpatialNorm `:3743`–`:3760` (spatial norm, `‖a⊗b‖_min = ‖a‖‖b‖`, representation independence, slice maps).
- TemperleyLieb Layers 0–7 (`:254`–`:767`; presentation theorem, negligible ideal and Goodman–Wenzl `:28`–`:35`, Karoubi envelope `:767`); PivotalSpherical Layers 0–2 (`:257`–`:318`) and 7 (`:477`, `RigidCategory (FDRep k G)` `:238`), `leftTrace`/`rightTrace` `:61`; OperatorAlgebraDynamics D1 `:148`, D2 `:221`; FreeProbability F1 `:127`, F3 `:255`, F6 `:532`; AmenableGroups Layers 1 `:98`, 5 `:289`, 7 `:415`; CompactGroups `su2Irrep` `:190`; LieHighestWeight `IsSl2Triple` `:5`.
- Downstream: QuantumEnvelopingAlgebras cites "Q8 item 1" (`:56`–`:57`, `:183`) and HopfologicalAlgebra "Q8 item 5: `FiniteHopfModuleCat k H`" (`:165`, `:319`–`:337`); both resolve through the crosswalk at `README.md:149`–`:153` and `:1532`. DiagrammaticCoherence `:52` and TypeAHeckeAlgebras `:38` name QuantumGroups Q8 as a consumer or rank-one supplier; neither cites a dropped id.
- HilbertModules H1–H3 and CStarAlgebras §§1.7, 1.8, 2.1, 5.1, 5.2 (R01, R02): on main, consuming nothing from QuantumGroups.

**Ownership.**
- §0.2 and §0.3 state objects that two open new-folder pull requests also own: CategoricalOperatorAlgebras #888 CA1a/CA2a (`:39`–`:44` at its head: "have their single home here; QuantumGroups consumes CA1a and CA2a") and TemperleyLiebOperatorAlgebras #867 Layers 1–3 (`:137`, `:1777`–`:1790`). Both are in the merge order (positions 228 and 244) while QuantumGroups is on main and not in the order, so this roadmap cannot cite them; the notions move down into Layer 0 and the move is recorded here, as reviews ~4 to ~6 recorded it. #888 and #867 must repoint their consumer notes to §§0.2–0.3. HilbertModules and CStarAlgebras were part of the same move while they were open; now that they are on main the move reverses (R01, R02).
- Nothing in NoncompactQuantumSymmetry #1015, CompactQuantumMetricSpaces #1155, OperatorAlgebraDynamics #1137 or VonNeumannAlgebras #1041 overlaps with a target here. Ownership against open pull requests whose files the brief did not list was not checked.

**Seeded sample.**
1. §0.1: Landsman Cor 3.2.4 p.59 (`landsman` 2787), Thm 3.2.5 p.60 (2801), §3.3 pp.61–63 (2839–2876), Construction 3.5.3 p.66 (3086–3112; R04.2); the content is HilbertModules' (R01).
2. §1.1: Landsman (3.21) p.61 (`landsman` 2850–2852, `M(C₀(X)) = C_b(X)` by multiplication on L²(X)); the pullback theorem is CStarAlgebras C1.8 (R02); Checks computed.
3. §1.2: Timmermann Thm 5.1.6 not verifiable; the Cesàro-mean and domination route is the standard one; Checks computed.
4. §2.1: Timmermann not verifiable; the tensor convention agrees with Tau Ceti's `tensorCombine`.
5. §3.1: `nt` Thm 1.4.2 (447–452, p.9) with `ρ = F̃ᵗ`; Timmermann not verifiable.
6. §3.2: Timmermann not verifiable; the statements agree with `nt` Thm 1.7.3 (977–978, p.22) and the computed characters.
7. §3.3: `nt` Prop 1.7.7 (1036–1048, p.23); PivotalSpherical and Tau Ceti Finite/RightRigid resolved.
8. §4.2: BMT §§2–3, Thm 3.6 pp.18–19 (`bmt` 858–871).
9. §4.3: BMT Thm 2.2 p.6 (257), Thm 2.8 pp.10–11 (461), Cor 2.9 p.11 (478), Thm 3.6 (858).
10. §5.1: BMT §2 pp.12–14 on SUq(2) with `0<|q|<1` (`bmt` 586–624); Timmermann Ch. 6 not verifiable; the five relations ⇔ unitarity computed in review ~6 and unchanged.
11. §6.1: Malacarne Thm 4.1 pp.5–6 (`malacarne` 285–297), same hypotheses.
12. §6.3: Malacarne Thm 4.1's uniqueness clause (275–281); the semigroup step is the README's own.
13. §8.1: Virelizier §2.3 p.8 (`virelizier` 348–357), Prop 2.4 (358–359).
14. §8.2: Virelizier Ex 3.3 p.11 (552–555), Prop 3.7 and Cor 3.8 p.12 (585–594); E-coefficient identity computed above.
15. §8.5: Virelizier Lemma 2.3 p.6 (265–267), Prop 4.1 pp.13–14 (644–651).

Also located: `nt` Defs 2.2.10, 2.2.12, Thms 2.2.14, 2.2.17 (1427, 1446, 1501, 1596; pp.32–35), `R̄ = −τR` (2429–2431, p.52), the Temperley–Lieb category (2488–2559, pp.54–55), Def 2.7.1 (3236–3241, p.70); Longo–Roberts Lemma 3.3 (`longoroberts` 389), Thm 3.8 (621), Thm 3.11 (681, p.17), Appendix (2000, p.48); Penneys Prop 4.5.3 (`penneys` 745, printed p.158), Facts 4.5.5 (758, p.159), Ex 4.6.12 (941, p.163), Ex 4.6.14 (1000, p.164); Banica Thm 1, Prop 1, Lemma 1, Prop 2 (`banica` 42–75, pp.2–3); Malacarne Thm 1.1 (52), Lemmas 1.2 (127), 2.1 (183), 2.2 (202), 3.1 (235); EGNO Chapter 5 (`egno` 4751).

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008, DOI 10.4171/043): every locator at `README.md:514`, `:569`, `:597`, `:620`, `:688`, `:734`, `:781`, `:820`, `:889`, `:1031`, `:1270`, `:1652`, `:1709`–`:1721` and `Suggested.lean:135`. The publisher's page is subscription-only, there is no arXiv or author copy, and the work has no key in the package manifest; this review edits no manifest. The mathematics of §§3.1–3.4 and 4.1 was checked against `nt` instead.
- Jones, *Index for subfactors* (1983): uncertified; the range is confirmed by Subfactors §3.2 and Penneys Thm 4.3.17.
- The AlgebraicAnalysis repository link (`README.md:1760`) is code, not a source, and was not opened.
- The general theorems are certified only by the computed instances above and the located inputs.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type fusion holds for every n ∈ ℕ with FF̄ real; it should require n ≥ 2, as its abstract does, since n=1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the q-numbers `(t)_q`, t ∈ ℤ, lie in the unit group; it should exclude t=0, where `(0)_q=0`; affects nothing.
