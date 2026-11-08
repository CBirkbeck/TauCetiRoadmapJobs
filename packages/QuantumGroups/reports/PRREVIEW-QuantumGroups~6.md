# Review of QuantumGroups (pull request #1705 at a938955)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `a938955c3dc306cf59d3c0545a5b4dc9dd8304cb`. This is a full review: 1722 lines changed since `cb48124`, the head review ~4 read. Review ~5 read `5c75e09`, and its single finding is also rechecked below. No file of the pull request was changed. There are seven findings, two of them blocking. The worker's gate fails one check, `depcheck` (R01); every other gate check passes. `Suggested.lean` elaborates with `sorry` as its only warning.

Locations are in `TauCetiRoadmap/QuantumGroups/` unless another roadmap is named. Other roadmaps are read on main (`3b3f7ef`) or at the open head named. Sources are cited as `<id> line N` in the worker's cache.

**Status of earlier findings (review ~4 at `cb48124`, review ~5 at `5c75e09`).**

| Earlier | Passage at this head | Status |
| --- | --- | --- |
| ~4 R01 (P2) one folder, two open revisions | `README.md` is #1649's README at `968db79` with §0.1 and §0.5 replaced by VonNeumannAlgebras citations (281 differing lines: scope, supplier table, Layer 0, `*Needs:*` lines, references). #1649 is still open, and overlaps.md reports that it conflicts with this pull request in both files | Partly repaired: the content is unified, but no merge order is stated (R06) |
| ~4 R02 (P2) statable headlines absent | `Suggested.lean:145` `compactType_iff`; `:366` `quantumSL2_locallyFinite_semisimple`; the docstring `:41`–`:45` names §§3.2–3.4 | Repaired. The docstring's reason is wrong for the Kac equivalence (R03) |
| ~4 R03 (P3) rescaling with \|λ\| = 1 | `README.md:238`: "Rescaling its two conjugate cups by 2 and 1/2 … squared norms 8 and 1/2" | Repaired (8 ≠ 1/2, zigzag factor 2·½ = 1) |
| ~4 R04 (P3) root-of-unity range, locators | `README.md:121`–`:124` gives the generality; `:286` cites Jones Thm 4.3.1, Neshveyev–Tuset §2.5 pp.54–55 and Penneys §§4.3–4.6 | Repaired (locators verified below). §0.3 now duplicates Subfactors (R02) |
| ~4 R05 (P3) canonical-weight comparison | `README.md:694`–`:697` consumes VonNeumannAlgebras Layer 11, which constructs the canonical weight (`VonNeumannAlgebras/README.md:2805`–`:2809`, main) | Repaired |
| ~4 R06 (P3) references, locators | References `:1585`–`:1589` list Landsman, Longo–Roberts, Penneys, Neshveyev–Tuset and Jones. The NT §2.2/§2.5/§2.7 split is at `:212`–`:223`. Malacarne Lemmas 1.2, 2.1, 2.2 and 3.1 all exist (`malacarne` lines 127, 183, 202, 235); review ~4 was wrong that Lemma 2.2 does not exist. Murphy, Lance, Wenzl, Takesaki and Hiai are no longer cited | Repaired |
| ~4 R07 (P3) Tau Ceti import | `Suggested.lean:9` `TauCeti.Algebra.Coalgebra.Subcomodule.Basic` | Repaired |
| ~4 R08 (P3) per-target shape | All 29 subsections have API bullets, ≥3 Checks (counted: 3–5 each) and `*Needs:*`; every layer ends with Examples and Dependencies; the external-code sentence is gone | Repaired |
| ~4 R09 (P3) proved API theorems | Both deleted; `README.md:562`–`:565` keeps the target with no Lean name of its own | Repaired |
| ~5 R01 (P1) §0.1, §0.5 re-plan VonNeumannAlgebras | No §0.1/§0.5. The supplier row `:77` cites VonNeumannAlgebras Layers 0, 1, 3, V4.Core/PositivePredual/Normality, V10.ModularTheory, V10.KMS and Layer 11, and every id resolves on main. `weakClosure_eq_bicommutant` is gone; the docstring `:32`–`:34` defers to VonNeumannAlgebras | Repaired |

## R01 (P2) — The gate fails: a roadmap on main cites CStarAlgebras, which is still in the merge order

**Location:** `README.md:75`: "[CStarAlgebras C1–C5,C8](../CStarAlgebras/README.md) | C1.CommutativeMultiplierMorphisms: continuous pullbacks, nondegeneracy, properness and strict composition; C2 state extension, C3 matrix norms, C4 CP positivity and multiplicative domains, C5 minimal tensors and slice maps; C8's Toeplitz extension". Also `:18`–`:20`, `:192`, `:286`, `:295`, `:355`, `:416`, `:823`, `:919`, `:1090`, `:1134`–`:1136`, `:1155`.

**Claim:** CStarAlgebras is a supplier this revision may cite.

**Witness:** the gate prints `UPWARD: QuantumGroups (on main) -> CStarAlgebras (#7) at README lines [75, 192, 286, 295, 355, 416]`. The content repository has no `TauCetiRoadmap/CStarAlgebras/` at `3b3f7ef`, and CStarAlgebras is the seventh roadmap in the merge order. If this pull request merged first, main would cite an absent roadmap.

**Repair:** choose one of the following.
- (a) Change nothing in the README, and merge after CStarAlgebras. The description's depends-on block already names CStarAlgebras. Re-run the gate once CStarAlgebras is on main: a roadmap on main is never upward, so the line disappears. Under the same sequencing, §0.1 could cite HilbertModules H1–H3 (eighth in the merge order, right after CStarAlgebras) instead of restating them; see the ownership note under Verified sound.
- (b) Pass the gate now by giving CStarAlgebras the same treatment Layer 0 already gives HilbertModules, CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras.
  - Repoint each input that has an owner on main or at the pin. The spatial norm, `A ⊗_min B`, `‖a⊗b‖=‖a‖‖b‖`, representation independence and slice maps go to VonNeumannAlgebras V13b.SpatialNorm (`VonNeumannAlgebras/README.md:3744`, main). Gelfand duality in §6.3 goes to Mathlib `gelfandStarTransform` (`Analysis/CStarAlgebra/GelfandDuality.lean:189`). Matrix norms go to Mathlib `CStarMatrix` and Subfactors §3.3.
  - State the rest as Layer 0 targets and record the move: the strict extension and commutative pullbacks of C1.7–C1.8 specialised to §1.1's maps, C2.1 state extension, the state case of C4.1, C5.2's `C₀(X)⊗_min A ≅ C₀(X,A)`, and C8.4.

  Tested on the refuting instance: with (b), every remaining supplier row names a roadmap on main (VonNeumannAlgebras, Subfactors, TemperleyLieb, PivotalSpherical, OperatorAlgebraDynamics, FreeProbability, AmenableGroups, RepresentationTheory), so the gate has nothing upward to report.

## R02 (P2) — §0.3 restates Subfactors §§3.1–3.3, which is on main

**Location:** `README.md:246`–`:258`: "define the normalized Markov trace by closing diagrams … Prove positivity in all degrees exactly for d≥2 or d=2cos(π/m), m≥3 … the half-line graph for d≥2 and A_(m−1) … Give the faithful finite-dimensional C*-norm on the quotient".

**Claim:** Layer 0 owns the analytic positivity of Temperley–Lieb algebras because no citable roadmap states it.

**Witness:** Subfactors is on main and owns exactly this (`Subfactors/README.md:31`–`:34`). Its §§3.1–3.3 (`:676`–`:835`) state the analytic adjoint, Markov uniqueness, Jones's theorem `markovTrace_nonneg_iff` with the same Penneys locator (`:729`–`:732`), the path models, `ker π_n = R_n` and the C*-norms on `Q_n`. Its Checks at `:818`–`:819` are this section's d=1 and d=√2 Checks.

**Repair:**
- Cite Subfactors §3.1 (analytic adjoint), §3.2 (Markov uniqueness, Jones–Wenzl projections, `markovTrace_nonneg_iff`, trace radical) and §3.3 (path models, `Q_n ≅ ⊕ M_paths`, faithful trace, finite C*-norms; the normalisation `tr_n = δ⁻ⁿτ_n` is at `:801`).
- Add Subfactors §§3.1–3.3 to the supplier table and to the `*Needs:*` of §0.3, and record the deferral in the scope section.
- Delete the restated sentences `:246`–`:258` and the Checks they carry: d=1, d=√2 and d=1/2 on two strands.
- Keep `:260`–`:269`: the δ=−d sign comparison, the unitary tensor category, the truncated fusion rule, and the Checks about them (δ=−5/2, m=3).

Tested: Subfactors cites no QuantumGroups section, so the new edge closes no cycle, and Subfactors is on main, so it is not upward. The refuting instance d=√2, `dim Q_3 = 4` (against `dim TL_3 = 5`), is Subfactors' own Check at `:819`.

## R03 (P3) — Four Lean statements are algebra on their hypotheses, and the docstring misstates two gaps

**Location:**
- `Suggested.lean:81`–`:89` (`counit_star`, `antipode_star_antipode_star`).
- `Suggested.lean:158`–`:191` (`freeOrthogonalRelation`, `freeOrthogonalCup_invariant`, `suqMatrix`, `SUqRelations`, `suqMatrix_unitary_iff`).
- The docstring at `:41`–`:45`: "the Kac equivalences … the characters need the complex powers `F^z`".

**Claim:** these are headline theorems, and the docstring names each unstated headline with what it lacks.

**Witness:**
- Cup invariance follows from the hypotheses in three steps, for any invertible F over any star algebra: `Σ_j U_ij (UF)_kj = Σ_j U_ij (FŪ)_kj = Σ_a F_ka (UU*)_ia = F_ki`.
- `suqMatrix_unitary_iff` is the entrywise comparison of `u*u` and `uu*` with the five relations; q=0 is included.
- `counit_star` follows because `a ↦ conj ε(a*)` is a counit.
- Layer 5's real headlines (`A_o(F)` and `C(SUq(2))` as compact matrix quantum groups) are not named.
- "h tracial ⇔ S∘S = id" needs no `F^z`. It is statable at the pins (probe below).

**Repair:**
- Delete the four theorems, and the three definitions only they use, from `Suggested.lean`. Unbacktick those names at `README.md:559`–`:560`, `:898`, `:926` and `:933`, keeping `StarCompatibleHopf`; the README keeps the targets as prose.
- Add the docstring line "Layer 5: the universal C*-algebras `A_o(F)` and `C(SUq(2))` with their coproducts need the minimal tensor product".
- Either state the Kac equivalence or drop "Kac equivalences" from the `F^z` sentence.

Tested: `theorem haar_isTrace_iff_antipode_antipode (A) [Ring A] [Nontrivial A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A] [StarCompatibleHopf (A := A)] (h : AlgebraicHaar (A := A)) : (∀ a b, h.functional (a*b) = h.functional (b*a)) ↔ ∀ a, antipode ℂ (antipode ℂ a) = a` elaborates appended to the file, with only a `sorry` warning. It is true by `nt` line 1036 (Proposition 1.7.7, printed p.23).

## R04 (P3) — §4.3 needs §6.3, which itself consumes Layer 4

**Location:**
- `README.md:870`: "*Needs:* §4.2; … FreeProbability F3; §6.3 for the commutative reconstruction comparison".
- `:853`–`:854`: "Q6 recovers the group from any commutative compact quantum group."
- `:878`: "Only the comparison for an arbitrary commutative CQG uses §6.3".

**Claim:** Layer 4 is built before Layer 6.

**Witness:** §6.3 consumes Q4 at `:1060`–`:1061` ("Compare universal and reduced reconstructed compact quantum groups using Q4") and at `:1075`–`:1077` ("Compare this reconstruction with Q4's single classical-group completion theorem A_u=A_r=C(G)"). So there is a layer cycle 4 → 6 → 4, and the comparison for an arbitrary commutative compact quantum group is already a target of §6.3.

**Repair:** delete ", §6.3 for the commutative reconstruction comparison" from `:870`, delete the sentence at `:853`–`:854`, and delete the last sentence of `:878`. Tested: §4.3's other needs (§4.2, OperatorAlgebraDynamics D2, AmenableGroups, FreeProbability F3) are all earlier.

## R05 (P3) — README and Lean disagree on one statement and three locators

**Location and witness:**
1. `README.md:1240`–`:1242`: "The headline `quantumSL2PBW_exists` asserts existence of the basis … including unique coefficient expansion, subalgebra inclusions, triangular decomposition and `quantumSL2_domain`". The Lean statement (`Suggested.lean:274`–`:279`) asserts only the basis; the domain property is a separate theorem at `:284`.
2. `Suggested.lean:109`–`:110` cites "Timmermann … Theorem 3.2.12 and Proposition 3.2.17" for orthogonality. But `README.md:586` cites Propositions 3.2.9, 3.2.17 and Theorem 5.4.1, and `:1596` assigns Theorem 3.2.12 to compact-type positivity.
3. `README.md:144` gives "Landsman Corollary 3.2.4, p.60", but the statement is on p.59 (`landsman` line 2787); `:1585` correctly says pp.59–60.
4. Timmermann Proposition 2.2.4 is given as "pp.50–51" at `:1592` and as "pp.49–51" at `:1603`.

**Repair:**
1. "The headline `quantumSL2PBW_exists` asserts the basis F^a K^b E^c; prove from it the unique coefficient expansion, subalgebra inclusions and triangular decomposition; the domain property is `quantumSL2_domain`."
2. In the docstring, cite the README's locator, or the verified one: Neshveyev–Tuset Theorem 1.4.2, printed p.9 (`nt` line 450), whose ρ is the transpose of F̃. Rederived: left and right invariance give `h(u_ij u_kl*) = δ_ik ψ_jl` with `ū*ψū = ψ`, and `h(u_ij* u_kl) = δ_jl φ_ik` with `ūφū* = φ`, hence `φ ∝ ψ⁻¹`, as `schur_orthogonality` states. Tau Ceti's orientation `Δu_ij = Σ_k u_ik ⊗ u_kj` is at `Comodule/MatrixCoefficient/Matrix.lean:117`.
3. Write "pp.59–60" at `:144`.
4. Use one page range for Proposition 2.2.4.

## R06 (P3) — #1649 is a conflicting revision of this folder, and no merge order is stated

**Location:** the whole folder. The title of this pull request is "construct the ribbon category RepUqg", and its description says "Add Q9 to build `RepUqg`" and "Only the roadmap README changes; no Lean interfaces … change".

**Claim:** this pull request is the only open revision of QuantumGroups, and its description says what it does.

**Witness:** overlaps.md reports that "#1649 and #1705 conflict in `TauCetiRoadmap/QuantumGroups/README.md`, `TauCetiRoadmap/QuantumGroups/Suggested.lean`". This head equals #1649's head `968db79` plus repairs. There is no Q9 section, and `Suggested.lean` changes.

**Repair:** state in this pull request's description that it supersedes #1649 and that #1649 is closed. Alternatively, merge #1649 first and rebase this one onto it. In either case, retitle and redescribe this pull request to match what the head does: Layers 0–8 in house shape and the stated Lean headlines.

## R07 (P3) — The "Q8 item k" numbering that HopfologicalAlgebra cites has no crosswalk

**Location:** `README.md:1296`–`:1297` ("consume item 5’s single generic Hopf-module construction after item 1’s Hopf structure"), `:1376` ("splits by item 3"), `:1552` ("Item 6 additionally consumes") and `:1226` ("Modules in this lane").

**Claim:** every id that other roadmaps cite still resolves after the merge.

**Witness:** HopfologicalAlgebra, on main, cites "QuantumGroups Q8 item 5: `FiniteHopfModuleCat k H`" (`HopfologicalAlgebra/README.md:165`, `:319`, `:331`, `:337`; `Suggested.lean:90`). Main's `QuantumGroups/Suggested.lean` declares `FiniteHopfModuleCat`; this head declares nothing by that name and has no "items".

**Repair:**
- Replace "item k" with "§8.k" at the four places, and "lane" with "layer".
- Add one sentence to §8.5: "Q8 item k of the earlier numbering is §8.k; the finite Hopf-module category constructed here is the carrier HopfologicalAlgebra §2.1 cites as FiniteHopfModuleCat k H". Leave the name unbackticked, since `Suggested.lean` no longer declares it.

Tested: the four HopfologicalAlgebra citations then name §8.5, which defines that category (`:1409`–`:1423`).

## Verified sound

**Scope, gate and build.**
- Head `a938955c3dc306cf59d3c0545a5b4dc9dd8304cb`, worktree clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. `STATUS.md` and `PROGRESS.md` are identical to main.
- The content checkout is at `origin/main` `3b3f7ef`. The pins are Mathlib `f6090c70` and Tau Ceti `358314d4`.
- The worker's gate reports 0 for every check except `depcheck=1` (R01).
- `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 in 35 s. It prints exactly 15 `declaration uses sorry` warnings (lines 81, 87, 114, 145, 167, 189, 256, 274, 284, 291, 299, 311, 332, 355, 366) and nothing else.
- There is no `set_option`, `lemma`, admitted `example`, `#eval`, LaTeX or process word, except "lane" (R07).

**Dependency check (unmodified output of the required command):**

```text
UPWARD: QuantumGroups (on main) -> CStarAlgebras (#7) at README lines [75, 192, 286, 295, 355, 416]
depcheck: 244 roadmaps, 2460 edges, 1 problem(s)
```

It is not a false positive: see R01.

**Signatures and padding probe.**
- A scratch copy carried `#check @name` for all 30 declarations. Each elaborated type was compared with its README statement; the only mismatch is R05.1.
- The worker's four "dropped binder" leads are all `[StarModule ℂ A]` on `AlgebraicHaar`, `freeOrthogonalRelation`, `suqMatrix` and `SUqRelations`. None of their types uses scalar–star compatibility, and every theorem that needs it carries it. No change.
- A second copy replaced every `sorry` with `first | rfl | infer_instance | simp | simp_all | aesop`. It produced 15 errors, one per admitted theorem, so none closes in one tactic. R03 rests on the headline criterion, not on this probe.

**Headline coverage.**

| Headline | At this head |
| --- | --- |
| §3.1 Schur orthogonality; §4.1 compact type | `schur_orthogonality`, `compactType_iff` |
| §§8.1–8.4: coproduct, PBW, domain, classification and ladders, centre, finite and locally finite semisimplicity, local-finiteness criterion | Eleven theorems, `Suggested.lean:256`–`:371` |
| Layers 0–2, 4, 6, 7; §§8.5–8.7 | Named in the docstring with the missing carrier (no Hilbert-module operators, `A ⊗_min A`, C*-tensor category, or module monoidal structure at the pins) |
| §§3.2–3.4 | Named; the Kac equivalence is statable (R03) |
| Layer 5 | Only lemmas stated; headlines unnamed (R03) |

**Adversarial pass (computed).** q = 1/2 unless stated. "Pass" certifies the instance.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 rank-one maps | over ℂ; H=0 | `θ_(e₁,e₂)=e₁₂`, adjoint `e₂₁`, product `e₁₁`; both compact algebras 0 | pass | none |
| §0.1 Hilbert sums | A=K(ℓ²), `a_n=p_n/√(n+1)` | tail `‖Σ_(n≥N)a_n*a_n‖=1/(N+1)→0`; `Σ‖a_n‖²=Σ1/(n+1)=∞` | pass | ownership note |
| §0.1 interior tensor | A=ℂ², φ(a,b)=a; φ=0 | `A⊗_A ℂ≅ℂ`; all norms 0 | pass | none |
| §0.1 right vs left module | x=e₁₁, y=e₁₂ | `x*y=e₁₂`, `yx*=0` | pass | none |
| §0.2 C*-identity | T=diag(2,1) | `‖T†T‖=4=‖T‖²`; Hilbert–Schmidt `√17≠5` | pass | none |
| §0.2 rescaled cup | (2R, R̄/2) on ℂ² | squared norms 8, 1/2; zigzag 2·½=1; traces 8≠1/2 | pass | none |
| §0.2 sign | J(z₁,z₂)=(−z̄₂,z̄₁); SU(2) | J²=−I, conj²=I; NT `R̄=−τR`, τ=1, ε=−1 | pass | none |
| §0.2 d≥1, =1 iff invertible | X⊗X̄ ⊇ 1 | `d²=d(X⊗X̄)≥1`; d=1 ⇒ complement has d=0 ⇒ zero | pass | none |
| §0.3 trace | d=5/2 | `τ(p)=(d/d²)/d=4/25`, `τ(1−p)=21/25` | pass | none |
| §0.3 radical | d=1; d=√2; d=1/2 | `τ₂(f₂)=1−d⁻²=0`; `dim Q₃=4<5`; `1−d⁻²=−3` | pass | R02 |
| §0.3 signed | δ=−5/2, e=−(5/2)p | `e²=(25/4)p=−(5/2)e=δe` | pass | none |
| §0.3 truncated fusion | m=3; d=2 | labels {0,1}, `1⊗1`: c≤min(2,0) ⇒ 0; d=2: 0⊕2 | pass | none |
| §1.1 coproduct | S₃, f=1[(123)], g=(12), h=(23) | gh=(123), hg=(132): Δf(g,h)=1, Δf(h,g)=0 | pass | none |
| §1.1 noncompact | ℤ, f=1[0] | Δf(N,−N)=1 ∀N ∉ C₀(ℤ²); `r₊Δf=f(0)=εf` | pass | none |
| §1.1 inverse maps | a=1[1], b=1[−1] | `aS(b)=1[1]`, `S(a)b=1[−1]`, `ab=0` | pass | none |
| §1.2 cancellation | monoid {1,0} | span Δ(A)(A⊗1): F(0,1)=F(0,0), dim 3<4 | pass | none |
| §1.2 Fell unitary | ℤ | `W(λ₁⊗1)W*(δ₁⊗δ₂)=δ₂⊗δ₃=(λ₁⊗λ₁)(δ₁⊗δ₂)` | pass | none |
| §2.2 unitarization | C₂, U(s)=[[1,2],[0,−1]] | U(s)²=I; T=½(I+U*U)=[[1,1],[1,3]], det 2; U*TU=T | pass | none |
| §2.1 coefficients | S₃ permutation | `u₁₃(gh)=1`, `u₁₃(hg)=0` | pass | none |
| `schur_orthogonality` | general, Tau Ceti orientation | `ψ`: `ū*ψū=ψ`; `φ`: `ūφū*=φ` ⇒ `φ∝ψ⁻¹`; = `nt` Thm 1.4.2 with ρ=F̃ᵗ | pass | R05.2 locator |
| `schur_orthogonality` | SU_(1/2)(2), F̃=diag(2,½) | `h(a*a)=½/(5/2)=1/5`, `h(c*c)=4/5`, `h(aa*)=4/5`; Haar law `(1−q²)/(1−q⁴)=4/5` | pass | none |
| `schur_orthogonality` | H=0 | subcomodule lattice trivial ⇒ no `IsSimpleOrder`, no 0/0 | pass | none |
| §3.2 Plancherel | a+c | `(½+2)/(5/2)=1`, mixed term 0 | pass | none |
| §3.2 characters | fundamental a | `f_z(a)=2^z`, `f₁*f₁(a)=4=f₂(a)`, `θ(a)=FaF=4a`; Vandermonde [[1,1],[1,4]] det 3 | pass | none |
| §3.2 star law | `nt` line 957 | `f_z(a*)=conj f_(−z̄)(a)` = Prop 1.7.2(ii) | pass | none |
| §3.3 dual metrics | irreducible u | right dual ū: `ū*F̃ū=F̃`; left dual `F̃ūF̃⁻¹` preserves F̃⁻¹; double dual `FuF⁻¹` preserves F⁻² | pass | none |
| §3.3 d≥n | F=diag(2,½) | `n²≤(ΣλᵢΣλᵢ⁻¹)=d²`; 5/2>2; tr(F·e₁₁)=2, tr(F⁻¹e₁₁)=½ | pass | none |
| §3.3 Kac | `nt` line 1036 | ρ=1 ⇔ h trace ⇔ S²=id; Lean probe elaborates | pass | R03 |
| §3.4 KMS sign | a; V10.KMS M₂ example | `σ_(−i)(a)=4a`: `h(aa*)=4/5=4h(a*a)`; inverse 1/20. VNA: `φ(e₁₂e₂₁)=2/3=φ(e₂₁·2e₁₂)`, same convention | pass | none |
| §3.4 S²=τ_(−i) | c | `τ_(−i)(c)=F₁₁cF₀₀⁻¹=q²c=c/4=S²(c)`; `σ_t(c)=c` | pass | none |
| `counit_star` | ε'(a)=conj ε(a*) | `(ε'⊗id)Δ(a)=(star of (ε⊗id)Δ(a*))=a` ⇒ ε'=ε | true, 2 lines | R03 |
| `antipode_star_antipode_star` | ℂ[C₃], a=iu | `S(a*)=−iu`, star `iu⁻¹`, `S(iu⁻¹)=iu=a` | pass | R03 |
| `compactType_iff` | ℂ; ℂ[C₂]; zero ring; ℂ[x] primitive | h=id spans; `h((a+bu)*(a+bu))=\|a\|²+\|b\|²`; zero ring: span=⊤ but h(1)=0≠1 (needs `Nontrivial`); ℂ[x]: `(id⊗h)Δx=x+h(x)≠h(x)1`, both sides false | pass | none |
| §4.2 pentagon | ℤ, (δ₁,δ₂,δ₃) | both words ↦ (δ₁,δ₃,δ₆) | pass | none |
| §4.2 norms | C₂, 1+u | C*-norm 2 in both completions; L² norm √2 | pass | none |
| §4.3 free group | F₂ | reduced `‖Σλ(s)^(±1)‖=2√3≈3.46<4=ε`; BMT Thm 2.2 (`bmt` line 257) | pass | R04 order |
| `suqMatrix_unitary_iff` | general a,c; q=0 | u*u: `a*a+c*c`, `c*a*−qa*c*`, `ac−qca`, `aa*+q²cc*`; uu*: `aa*+q²c*c`, `ac*−qc*a`, `ca*−qa*c`, `cc*+a*a` ⇔ five relations | pass | R03 |
| `freeOrthogonalCup_invariant` | any invertible F | `Σ_j U_ij(FŪ)_kj=Σ_a F_ka(UU*)_ia=F_ki` | pass | R03 |
| §5.2 example | F=[[0,1],[−2,0]] | FF̄=−2I; E=−2e₀⊗e₁+e₁⊗e₀, ‖E‖²=5; J(e₀)=−√2e₁; FūF⁻¹=[[a,−c*/2],[c,a*]]=u | pass | none |
| §5.2 AM–GM | singular values sᵢ | {sᵢ²}={c²/sᵢ²} ⇒ Σsᵢ²/\|c\|≥n, = iff F∝unitary | pass | none |
| §5.2 vs Malacarne | `malacarne` lines 177–179 | U*=FᵗUᵗ(F⁻¹)ᵗ ⇔ U=FŪF⁻¹ | pass | none |
| §6.2 truncations | H=0; H=ℂ | degree 0 ℂ, k≥1 zero, quotient ℂ; dim A_(≤1)=2; R=(ι⊗F)r=ΣF_ji e_i⊗e_j | pass | none |
| §6.1 reconstruction | Rep(S₃) | 1+1+4=6 vs diagonal 4; hypotheses = Malacarne Thm 4.1 | pass | none |
| §7.1 Haar | q=½; q=±1 | `h(c*c)=(¾)/(1−1/16)=4/5`, `h((c*c)²)=(¾)/(1−1/64)=16/21`; ∫t=½, ∫t²=⅓ | pass | none |
| §7.1 q=−1 model | a=√(1−t)zσ₃, c=√t wσ₁ | a*a+c*c=I, aa*+c*c=I, c*c=cc*=tI, ac=−ca, ac*=−c*a; t=0,z=1: a=σ₃, c=0 ⇒ counit | pass | none |
| §7.1 character | state τ, τ(a)=1 | a*a≤1 ⇒ τ(a*a)=1=\|τa\|²; τ(aa*)=1; τ(c*c)=0 ⇒ a,c in multiplicative domain; BMT 0<\|q\|<1 (`bmt` line 592) | pass | none |
| §7.2 dimensions | n=2, d=5/2 | Hilbert 1,2,3,4; intrinsic 1,5/2,21/4,85/8; β=c⁻²‖E‖⁴=25/4=d² | pass | none |
| `quantumInteger` | q=½; q=1 | [2]=5/2, [−2]=−5/2, [0]=0; q=1: 0/0=0 vs Laurent 2 | pass | none |
| `quantumSL2Comul_exists` | generic; q=±1 | bracket `q⁻²q²−1=0`; at ±1 KF=FK ⇒ bracket 0 and EF−FE=0=0·(ΔK−ΔK⁻¹): q≠0 suffices | pass | none |
| `quantumSL2PBW_exists` | a=b=1; q=0 | `K^bF^a=q^(−2ab)F^aK^b`: 4; q=0 forces E=0, excluded by `hq` | pass | R05.1 wording |
| §8.1 Ore tower | σ_E, δ_E | `σ_E(F)σ_E(K)=q⁻²FK=KF=q²σ_E(K)σ_E(F)`; `δ_E(FK)=δ_E(q²KF)=K(K−K⁻¹)/(q−q⁻¹)` | pass | none |
| §8.1 q⁻¹ presentation | K↦K⁻¹ | `K⁻¹E=q⁻²EK⁻¹`; `(K⁻¹−K)/(q⁻¹−q)=(K−K⁻¹)/(q−q⁻¹)`; ΔE not preserved | pass | none |
| `quantumSL2_simple_classification` | ladder; L₂⁺; V=0 | `ε([j+1][m−j]−[j][m−j+1])=ε[m−2j]`; diag 5/2,0,−5/2; 0 not simple | pass | none |
| `quantumSL2_exists_ladderAction` | m=0, ε=−1 | ℂ¹, K=−1, E=F=0, K−K⁻¹=0 | pass | none |
| `quantumSL2_center` | Casimir scalars | 10/9, 17/9, 65/18 and negatives distinct; equality forces q^(2k)=1; z=0 ↔ p=0 | pass | none |
| `quantumSL2_finite_semisimple` | L₀⁻⊕L₁⁺; top weight W | dims 1+2, blocks −10/9, 17/9; r=m+1: `(q^(−m)K−q^mK⁻¹)W=0` ⇒ K²=q^(2m) | pass | none |
| `quantumSL2_locallyFinite_iff` | L₀⁻; ⊕_ℕL₀⁺; Verma M(1); 0 | T/T; T/T; weights 4^j, F not nilpotent: F/F; T/T | pass | none |
| `quantumSL2_locallyFinite_semisimple` | M(1); L₀⁻ | M(1) excluded by `hV`; L₀⁻ simple | pass | none |
| §8.5 Clebsch–Gordan | m=n=j=1 | α₁=−q[1]/[1]=−½; ΔE(v₀⊗v₁−½v₁⊗v₀)=(½−½)v₀⊗v₀; recurrence from the v_i⊗v_(j−i−1) coefficient | pass | none |
| §8.5 binomials | r=2 | Δ(E²) middle q[2]=1+q²=5/4; Δ(F²) middle (1+q²)F⊗FK⁻¹ | pass | none |
| §8.5 pivot | g=K⁻¹ | S²=Ad(K⁻¹) (`virelizier` line 358); tr(K⁻¹)=ε[m+1]: 5/2 on L₁⁺, −1 on L₀⁻ | pass | none |
| §8.5 vs Virelizier §4.1 | basis rescaling | v_i=q^(i(i−1)/2)w_i turns `(i+1)_q`, `q^(1−n)(n−i+1)_q` into `[i+1]`, `[n−i+1]` | pass | none |
| §8.6 metric | m=1 | h₁=q=½; ⟨v₁,KFv₀⟩=q⁻¹h₁=1=⟨Ev₁,v₀⟩; h₁=1 gives E*=F; E₀₁=√2, F₁₀=1/√2 | pass | none |
| §8.6 star | (KE)* | KFK=q²K²F=(q²EK)* | pass | none |
| §8.7 | v=1, m=2 | F 1,2,0; E 0,2,1; [E,F]=diag(2,0,−2) | pass | none |

**Pinned declarations opened.**
- Mathlib: `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean:72`); `gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:246`); `WeakDual.isCompact_closedBall` (`Analysis/Normed/Module/WeakDual.lean:269`); `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and `finite_dimensional_eigenspace` (`Analysis/InnerProductSpace/Spectrum.lean:441`, `:461`, the latter with `μ ≠ 0` as the README says); `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:67`); `IsCompactOperator` (`Analysis/Normed/Operator/Compact/Basic.lean:69`); `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean:37`); `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`); `antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean:57`); `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean:159`); `SkewPolynomial` (`Algebra/SkewPolynomial/Basic.lean:93`, on `SkewMonoidAlgebra R (Multiplicative ℕ)`); `gelfandStarTransform` (`Analysis/CStarAlgebra/GelfandDuality.lean:189`); `CStarMatrix` and `Multiplier.lean` exist.
- Tau Ceti: `coefficientMatrix`, `coact_basis_eq_sum_coefficientMatrix`, `comul_coefficientMatrix_eq_sum`, `map_antipode_mul_coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`, `:109`, `:117`, `:173`); `matrixComodule` (`…/FromMatrix.lean:166`); `antipode_antipode`, `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean:88`, `:97`); `FDRep.ofShrink`, `ofShrinkEquiv` (`RepresentationTheory/FDRep.lean:248`, `:254`); `Comodule/Finite/{Monoidal,RightRigid,Rigid,TensorProduct}.lean` and `Comodule/{Fixed,Convolution,LinearlyReductive}.lean` exist.
- No Hopf *-structure, Hopf integral or quantum integer exists in Mathlib or Tau Ceti at the pins.

**Cross-roadmap citations resolved.**
- CStarAlgebras (#860 head `33ddcef`):
  - C1.7 `:468` and C1.8 CommutativeMultiplierMorphisms `:497`–`:521`: maps ↔ nondegenerate homomorphisms into C_b; proper ⇔ lands in C₀.
  - C2.1 `:544`, C3 `:886`, C4.1 `:986`, C5.1 `:1112` (consumes V13b.SpatialNorm), C5.2 `:1143` (`C₀(X)⊗_min A ≅ C₀(X,A)`), C8.4 `:1676`. It names QuantumGroups as consumer at `:1957`.
- VonNeumannAlgebras (main):
  - Layer 0 `:275`: weak-* compact state space `:288`–`:289`, GNS `:295`–`:297`.
  - Layer 1 `:392`; Layer 3 `:905` (finite-dimensional classification).
  - V4.Core `:972`, V4.PositivePredual `:1059`, V4.Normality `:1124`.
  - V10.ModularTheory `:2364`; V10.KMS `:2459` with the convention at `:2462`–`:2464`; Layer 11 `:2785`, canonical weight `:2805`–`:2809`.
  - The open revision #1041 keeps every one of these ids.
- TemperleyLieb Layers 0–7 (`:254`–`:767`); PivotalSpherical Layers 0–2 (`:257`–`:318`) and 7 (`:477`, `RigidCategory (FDRep k G)` `:486`–`:490`); OperatorAlgebraDynamics D1 `:75`, D2 `:143`; FreeProbability F1 `:127`, F3 `:255`, F6 `:532`; AmenableGroups Layers 1 `:98`, 5 `:289`, 7 `:415`; CompactGroups `su2Irrep` `:190`; LieHighestWeight `IsSl2Triple` `:5`, `:181`. All on main.
- Downstream: QuantumEnvelopingAlgebras QEA1 `:323` consumes Q8 (`:56`, `:88`, same coproduct); HopfologicalAlgebra §2.1 `:317` (R07).

**Ownership.**
- Layer 0 states, as its own targets, objects that three open new-folder pull requests also own and that main's version of this README cited as suppliers (main `QuantumGroups/README.md:41`–`:43`):
  - HilbertModules #861 H1–H3, down to the same Checks (`a_n=p_n/√(n+1)` `:165`, `J⊥=0` `:255`, `θ_(1,1)` `:259`) and the same `K_A(H⊗A)≅K(H)⊗min A` `:209`;
  - CategoricalOperatorAlgebras #888 CA1a/CA2a (`:25`–`:30`, consumer note `:1865`);
  - TemperleyLiebOperatorAlgebras #867 Layers 1–3 (`:137`, `:1777`–`:1790`).
- Because the gate places this roadmap, which is on main, before every roadmap in the merge order, these notions move down, and the move is recorded here, as reviews ~4 and ~5 did. Those three pull requests still name QuantumGroups as their consumer and must repoint to Layer 0. Six roadmaps on main (OperatorAlgebraDynamics, FreeProbability, NoncommutativeGeometry, GeneralizedCohomology, FactorRigidity, SeibergWittenTheory) cite HilbertModules as the owner of Hilbert C*-module theory.
- R01's choice decides whether the move stands. With (a), §0.1 should cite H1–H3. With (b), Layer 0 owns CStarAlgebras' inputs as well.
- Subfactors is not a later roadmap, so it is R02, not a move. NoncompactQuantumSymmetry #1015 and CompactQuantumMetricSpaces #1155 overlap with nothing here.
- Ownership against open pull requests whose files the brief did not list was not checked.

**Seeded sample.**
1. §0.1 Landsman:
   - Cor 3.2.4: statement p.59, proof p.60 (`landsman` lines 2787–2793).
   - Thm 3.2.5 p.60 (line 2801): one module; the README applies it to E⊕F.
   - §3.3 pp.61–63 (line 2858; nondegenerate action line 2876).
   - Construction 3.5.3 p.66 (line 3086): positivity by cyclic decomposition (lines 3103–3107) is Gram positivity in every representation, as used.
   - Verified, except the locator in R05.3.
2. §0.3:
   - Penneys: Thm 4.3.17 p.150 (`penneys` line 368; necessity only), Facts 4.4.14 p.154 (557), Prop 4.5.3 p.158 (745), Facts 4.5.5 p.159 (758), Ex 4.6.12/4.6.14 pp.163–164 (941, 1000).
   - NT: `R̄=−τR` p.52 (`nt` line 2431); admissible range and `TL_(d,τ)` pp.54–55 (2488–2495, 2556–2559).
   - Jones is uncertified.
   - Verified, but the material duplicates Subfactors (R02).
3. §1.1: supplier C1.8 and C5.2 as above; Checks computed. Verified.
4. §3.2: Timmermann is not verifiable. The statements agree with `nt` Def 1.7.1 and Prop 1.7.2 (lines 941–964, p.21) and Thm 1.7.3 (977–978, p.22).
5. §3.3: Timmermann is not verifiable. `nt` Prop 1.7.7 (1036–1048, p.23) gives the Kac equivalences; PivotalSpherical resolved.
6. §3.4: VonNeumannAlgebras V10/Layer 11 resolved with matching KMS sign; `nt` Thm 1.7.3.
7. §4.1: Timmermann is not verifiable. `nt` Thm 1.6.6 (810–820, p.18) gives the direction from spanning to Haar.
8. §5.2: Banica Prop 1 and Lemma 1, p.2 (`banica` lines 54–57, 65); Malacarne Lemma 2.1, p.3 (`malacarne` line 183), with the presentation equal to the README's. Verified.
9. §6.1: Malacarne Thm 4.1, pp.5–6 (285–291), same hypotheses. Verified.
10. §6.2: Malacarne Lemmas 1.2 (127), 2.1 (183), 2.2 (202), 3.1 (235), proof of Thm 4.1 (292–340), `I_n` at 120–126. Verified.
11. §6.3: uniqueness clause of Malacarne Thm 4.1 (288–289). Verified; the semigroup step is the README's own argument.
12. §8.1: Virelizier §2.3 p.8 (`virelizier` lines 348–357), with the same relations, Δ and S; Prop 2.4 (358–359). Verified.
13. §8.2: Virelizier Ex 3.3 p.11 (552–555), Prop 3.7 and Cor 3.8 p.12 (585–594), type 1 only, as the README says. Verified.
14. §8.5: Virelizier Lemma 2.3 p.6 (265), Prop 4.1 pp.13–14 (644–651). Verified.
15. §8.6: Virelizier §2.3 verified; Timmermann Ch. 6 §2 not verifiable; pairing values computed.

Also checked: Longo–Roberts §3 pp.10–17 (Lemma 3.3 `longoroberts` line 389, Thm 3.8 line 621, Thm 3.11 line 681), Appendix p.48 (line 2000); BMT Thms 2.2, 2.8, Cor 2.9, Thm 2.12, Cor 2.13, Thm 3.6 (`bmt` lines 257, 461, 478, 614, 645, 858; pp.6, 10–11, 13–14, 18).

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008, DOI 10.4171/043). Every locator at `README.md:416`, `:467`, `:495`, `:518`, `:586`, `:632`, `:679`, `:718`, `:776`, `:919`, `:1155`, `:1534`, `:1591`–`:1606` and `Suggested.lean:109`, `:142` is unchecked: no open copy, and the work has no key in the package's `sources.toml`. This review edits no manifest. The mathematics of §§3.1–3.4 and 4.1 was checked against `nt` instead (seeded sample 4–7).
- Jones, *Index for subfactors* (1983): recorded as uncertified; the range is confirmed by Penneys Thm 4.3.17.
- The AlgebraicAnalysis repository link (`README.md:1642`) is code, not a source, and was not opened.
- The general theorems are certified only by the computed instances above and by the located inputs.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type fusion holds for every n ∈ ℕ with FF̄ real; it should require n ≥ 2, as its abstract does, since n=1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the q-numbers `(t)_q`, t ∈ ℤ, lie in the unit group; it should exclude t=0, where `(0)_q=0`; affects nothing.
