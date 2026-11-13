<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12960#issuecomment-6849672894 -->
Review (claude) of bc5f01a

Verdict: needs_changes

1. **F01** (P2) the trace clause of the perfectoid Abhyankar lemma is statable at the pins

   **Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:64`: "André's perfectoid Abhyankar
   lemma (README §4.7): the largest perfectoid subalgebra … needs topologies on intermediate algebras
   and almost finite étale algebra structures. The finite-projective trace is native". README §4.7 has
   no `Suggested.lean` paragraph.

   **Claim.** No clause of the headline §4.7 can be stated at the pins.

   **Witness.** ANDRE18A lines 3186 and 3196–3200 (Proposition 5.3.1(3), p. 68), cited by README §4.7,
   states clause (3) for `B̃°`, the integral closure of `g^{-1/p^∞}A°` in `B′`: no perfectoid `B`, no
   almost étale structure. The statement below elaborates at the pins, `sorry` the only warning.

   **Exact repair.** Add to `Suggested.lean`, under a `/-! ## Layer 4: the perfectoid Abhyankar lemma -/`
   comment inside `section Perfectoid`, the definition and the theorem below (elaborated in scratch
   with the file's own header plus `public import TauCeti.LinearAlgebra.Trace.Projective`, whose object
   file exists; add that import). Give both a docstring; the theorem's cites André A, Théorème 0.3.1(3),
   p. 2, and Proposition 5.3.1(3), p. 68.

   ```lean
   def rootSaturation {R : Type u} [CommRing R] [TopologicalSpace R] [NonarchimedeanRing R]
       (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m) :
       Subalgebra (powerBoundedSubring R) (Localization.Away ((g 0 : powerBoundedSubring R) : R)) where
     carrier := {b | ∀ m, ∃ a : powerBoundedSubring R,
       algebraMap R _ (a : R) = algebraMap R _ (g m : R) * b}
     mul_mem' := by
       intro x y hx hy m
       obtain ⟨a, ha⟩ := hx (m + 1)
       obtain ⟨b, hb⟩ := hy (m + 1)
       have hp : 2 ≤ p := (Fact.out : p.Prime).two_le
       obtain ⟨q, hq⟩ : ∃ q, p = q + 2 := ⟨p - 2, by omega⟩
       refine ⟨a * g (m + 1) ^ q * b, ?_⟩
       have h := congrArg (fun z : powerBoundedSubring R ↦ algebraMap R
         (Localization.Away ((g 0 : powerBoundedSubring R) : R)) (z : R)) (hg m)
       simp only [Subring.coe_pow, map_pow] at h
       simp only [Subring.coe_mul, Subring.coe_pow, map_mul, map_pow]
       rw [← h, ha, hb, hq]
       ring
     add_mem' := by
       intro x y hx hy m
       obtain ⟨a, ha⟩ := hx m
       obtain ⟨b, hb⟩ := hy m
       refine ⟨a + b, ?_⟩
       simp only [Subring.coe_add, map_add]
       rw [ha, hb]
       ring
     algebraMap_mem' := by
       intro r m
       refine ⟨g m * r, ?_⟩
       simp only [Subring.coe_mul, map_mul]
       rfl

   theorem abhyankar_trace_almost_surjective
       (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
       (hK : ∀ ε : ℝ, 1 < ε → ∃ x : K, 1 < ‖x‖ ∧ ‖x‖ < ε) (hKp : ‖(p : K)‖ < 1)
       (hKF : Function.Surjective
         (fun x : ModP (NormedField.valuation (K := K)).integer p ↦ x ^ p))
       (R : Type u) [CommRing R] [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R]
       [IsTateRing R] [CompleteSpace R] [T2Space R] [TauCeti.Perfectoid.IsPerfectoidTateRing p R]
       [Algebra K R] (hKR : Continuous (algebraMap K R))
       (g : ℕ → powerBoundedSubring R) (hg : ∀ m, g (m + 1) ^ p = g m)
       (hreg : ((g 0 : powerBoundedSubring R) : R) ∈ nonZeroDivisors R)
       (B' : Type u) [CommRing B'] [Algebra (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
       [Module.Finite (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
       [Module.Projective (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
       [Algebra.Etale (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B']
       (hfaith : Function.Injective
         (algebraMap (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B')) :
       (∀ b ∈ integralClosure (rootSaturation p g hg) B',
         LinearMap.projectiveTrace (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B'
           (LinearMap.mulLeft _ b) ∈ rootSaturation p g hg) ∧
       ∀ a ∈ rootSaturation p g hg, ∀ c : K, ‖c‖ < 1 → ∀ l : ℕ,
         ∃ b ∈ integralClosure (rootSaturation p g hg) B',
           LinearMap.projectiveTrace (Localization.Away ((g 0 : powerBoundedSubring R) : R)) B'
             (LinearMap.mulLeft _ b) =
           algebraMap R _ (algebraMap K R c * (g l : R)) * a :=
     sorry
   ```

   Then:

   - Module docstring: move §4.7 to "Stated here" for clause (3), "in the integral-closure model `B̃°`
     of README §4.6"; keep clauses (1)–(2) under "not statable" with the present reason.
   - README §2.3: replace "`Suggested.lean` writes the root saturation … directly in the statement of
     `riemann_extension_completeIntegralClosure`" by a sentence naming `rootSaturation p g hg` (a
     subalgebra of `R[1/g]` over `R°`; closed under products because
     `g^{1/p^m} = g^{1/p^{m+1}}·(g^{1/p^{m+1}})^{p−2}·g^{1/p^{m+1}}`, `p ≥ 2`).
   - README §4.7: add the paragraph "`abhyankar_trace_almost_surjective` states (3) for `B̃°` (André A,
     Proposition 5.3.1(3), p. 68): the trace is `LinearMap.projectiveTrace` of multiplication, it maps
     `B̃°` into `g^{-1/p^∞}R°`, and every `c·g^{1/p^l}·a` with `|c| < 1` and `a` in the root saturation
     is a trace. Faithfulness is injectivity of `R[1/g] → B′`; projectivity is a binder that every
     finite étale algebra satisfies." Add Tau Ceti `LinearMap.projectiveTrace` to §4.7's *Needs:* and to
     Layer 4's Dependencies.

   Tested on the instances that separate the clauses: `g = 1`, `B′ = L × L` (`L = R[1/g] = R`):
   saturation `R°`, `B̃° = R° × R°`, `tr(a, b) = a + b`, and `c·a = tr(c·a, 0)`, also at `p = 2`.
   `B′ = L`: `tr = id`, `B̃°` is the saturation (it is completely integrally closed, §3.6(3)), onto.
   `B′ = 0` over `R ≠ 0`: the second clause would need `c·g^{1/p^l}·a = 0` for `a = 1`, false; it is
   excluded by `hfaith`. The first clause holds because the trace of an element integral over a
   subring of the base is integral over it, and the saturation is integrally closed in `R[1/g]`.

2. **F02** (P3) page of Lemme 3.5.5 and Proposition 3.5.6

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1481`: "(André A, Lemme 3.5.5 and
   Proposition 3.5.6, pp. 47–48)".

   **Claim.** Both statements are on pp. 47–48.

   **Witness.** ANDRE18A line 2082 is the marker of p. 48; Lemme 3.5.5 is line 2109 and Proposition
   3.5.6 line 2120. Only Remarques 3.5.5 (line 2065) starts on p. 47.

   **Exact repair.** Write "p. 48".

3. **F03** (P3) page of André B §2.4

   **Location.** `packages/PerfectoidSpacesPartII/README.md:2411`: "(André B, §2.4, pp. 78–79)".

   **Claim.** §2.4 spans pp. 78–79.

   **Witness.** ANDRE18B line 356 is the marker of p. 79 and §2.4 starts at line 358, ending before
   §2.5 at line 367. Page 78 holds §§2.1–2.3.

   **Exact repair.** Write "p. 79".

4. **F04** (P3) the structure maps of the limit theorem are described in the wrong order

   **Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:286`: "the structure maps are
   `coeffToSections` followed by the inclusion `𝒪⁺ ⊆ 𝒪`"; README :673–674 "the canonical map
   `R → 𝒪_X(V)` … through which `f_n` is read, followed by the inclusion `𝒪⁺ ⊆ 𝒪`".

   **Claim.** The structure map is `coeffToSections` composed with `𝒪⁺ ⊆ 𝒪`.

   **Witness.** `Suggested.lean:255`: `coeffToSections` has target
   `(presentationLimitPresheafInCommRingCat P Rplus).obj (op V)`, that is `𝒪_X(V)`; nothing in `𝒪⁺`
   follows it. The statement (:311–315) composes `limit.π` with `presentationLimitPlusPresheafι`.

   **Exact repair.** Docstring: "the structure map `R° → 𝒪⁺(X⟨tⁿ/g⟩)` followed by the inclusion
   `𝒪⁺ ⊆ 𝒪` is the restriction of `coeffToSections` to `R°`". README §1.1: "`coeffToSections P R° V` is
   the canonical map `R → 𝒪_X(V)`; on `R°` it is `f_n` followed by the inclusion `𝒪⁺ ⊆ 𝒪`."

5. **F05** (P3) the index `n = 0` is in the Lean statements of §1.2 and §1.4 and not in the README

   **Location.** `packages/PerfectoidSpacesPartII/README.md:732`: "for every `k ≥ 0`, with `c = pᵏm`,
   and every `n ≥ 1`"; also :665 "For `n ≥ 1` put `X⟨tⁿ/g⟩`".

   **Claim.** The statements concern `n ≥ 1`.

   **Witness.** `Suggested.lean:123` `(n : ℕ)`, :169 and :229 `(m k n : ℕ)`: the three theorems
   include `n = 0`, the locus `{|g| = 1}`. README and Lean differ in generality.

   **Exact repair.** Add to the `Suggested.lean` paragraph of README §1.2: "In `Suggested.lean` the
   index `n` runs over all natural numbers; `n = 0` is the locus `{1 ≤ |g|}`, where the same
   presentation and proof apply (Bhatt states (2) for `n ≥ 0`)." Computed at `n = 0`,
   `A = K°⟨T^{1/p^∞}⟩`, `g = T`: `M_0 = (K°/tᵐ)[T^{±1/p^∞}]`, kernel `0`; with `c = pᵏm`,
   `T^{1/p^k}u_c^e ↦ T^{1/p^k}t^{ce}u_0^e`, zero for `e ≥ 1/pᵏ` and `T^{1/p^k − e}t^{ce}` otherwise.

6. **F06** (P3) §3.0 is a stub

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1365–1368`: "### 3.0 perfectoid Tate rings.
   This layer uses `TauCeti.Perfectoid.IsPerfectoidTateRing` under the complete Hausdorff Tate-ring
   conventions and the Exact supplier contracts above."

   **Claim.** §3.0 is a target of Layer 3.

   **Witness.** It has no statement, API or Check; the predicate is the pinned
   `TauCeti/RingTheory/Perfectoid/Basic.lean:86`, already listed in Scope and in the supplier contracts
   (README :233). A target that exists elsewhere is deleted, not kept as a pointer.

   **Exact repair.** Delete the subsection and add its sentence to the introduction of Layer 3. No
   roadmap cites §3.0 (`roadmaps grep` for a citation of this roadmap's §3.0: no match).

Six findings: one P2 and five P3. Both round-5 findings are repaired and the two new theorems are
correct as stated. The P2 is the same pattern the round-5 review raised, found on a clause no
earlier round examined: the trace clause of the Abhyankar lemma is statable on native carriers.

## Round-5 findings, one by one

| Round-5 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), the limit form §1.5 is statable on the native plus presheaf | `packages/PerfectoidSpacesPartII/Suggested.lean:291` `bhatt_riemann_extension_limit`, on `annularOpen` (:266), `annularTower` (:273), `coeffToSections` (:252); README §1.1 "the tower is Tau Ceti's plus presheaf `TauCeti.ValuationSpectrum.presentationLimitPlusPresheaf` … composed with the increasing sequence of opens"; README :277–291 cites the presheaf with files and lines; the false sentence "no functor on the rational subsets and no limit over them" is gone from both files (grep: 0 hits). | Repaired. Wording slip in the new docstring: R04. |
| F02 (P2), §5.12 is statable | `Suggested.lean:558` `kummer_ramified_almost_faithfullyFlat`, on `kummerRoot` (:517), `KummerCompletion` (:532), `KummerCompletionAway` (:537), `kummerRamifiedIdeal` (:544); README §5.12 "`kummer_ramified_almost_faithfullyFlat` states the first assertion …"; the docstring no longer lists §5.12 as not statable. | Repaired. |

The repair report marks nothing "not actionable". The repaired pattern (a headline the docstring
calls not statable although native carriers suffice) was searched for in the remaining absence
claims: §1.3 (derived tensor of complexes: absent at the pin, confirmed), §3.6(1) and §3.11 (uniform
Banach localisations and uniform limits: absent), §4.5 (an equivalence of categories of almost
algebras: absent), §4.7 (clauses (1)–(2): absent; clause (3): statable, R01).

## Verified sound

**Elaboration.** `lake env lean` on `packages/PerfectoidSpacesPartII/Suggested.lean`, from the
content checkout: exit 0, eight warnings, all `declaration uses 'sorry'` (lines 104, 152, 215, 291,
329, 447, 499, 558). No `set_option`, no `lemma`, no `#eval`; the header is `module`,
`public import Mathlib` and nine individual `TauCeti.*` modules, the form 44 roadmaps on main use.

**Signatures.** All 32 declarations read against the README: every theorem carries its binders in
its own signature; the section variables are only `p`, `[Fact p.Prime]`, `k`, `[Field k]`, `n`.
`[CharP k p] [PerfectRing k p]` are explicit on the three Kummer theorems. Every Lean name occurs in
the README and every backticked name the README gives this roadmap is declared (32 of 32).

**Padding probe.** All eight admitted theorems, on a scratch copy, with
`first | (intros; simp; done) | rfl | infer_instance | trivial | (intros; exact?)`: none closes
(eight `exact?` failures). The two proved theorems (`kummerIntegralStage_mono`,
`isIntegral_kummerVar_zeta`) are used in the types of later definitions.

**Headline theorems.** §1.2 (stated, two clauses), §1.3 (named: no derived tensor of complexes at the
pin), §1.4 (kernel half stated), §1.5 (stated), §3.6 (clause (2) stated; (1), (4) named), §3.11
(named), §4.5 (named), §4.7 (named; clause (3) statable: R01), §5.8, §5.9, §5.12 (stated).

**Dependency check.**

```text
depcheck: 206 roadmaps, 1899 edges, 0 problem(s)
```

**Declared gaps.** `complete-almost-nakayama` (PerfectoidSpaces P0.26) and
`principal-almost-flatness` (PerfectoidSpaces P0.11): same slugs and sentences in
`design/plan.json` and under "Exact supplier contracts"; each is one statement with its hypotheses;
PerfectoidSpaces on main cites GR §5.2 only for Corollary 5.2.15 and Theorem 5.2.12, not Lemma 5.2.1
or 5.3.3, so neither is already provided.

**Adversarial table** (sampled targets, headlines, findings).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.5 uniform annihilation through `⊗^L` | `K = R`; chain of the sketch with `γ = g^{1/p^k}t^{1/p^l}` | `Hom(C, M[0]) = Hom(H⁰C, M)` for `C` in degrees `[−1, 0]`, so `γτ` factors through `H^{−1}[1]`; `t^{1/p^l} = t^{1/p^{l+1}}·t^{1/p^{l+1}}·t^{(p−2)/p^{l+1}}` gives `γτ = 0`; kernel tower: `γ·ker_{n+c} = δ_n(γτ_*(·)) = 0`. | Holds; BHATT18 line 418 (Remark 4.3, p. 7). |
| §1.1 annular tower | `g` unit; `g = 0`; `g = (T, 0)` | `|tⁿ| ≤ 1 = |g|`: `X`. `{|tⁿ| ≤ 0 ≠ 0}` empty. Kernel `(0) × K°`. Transition `u_{n+c}^e ↦ t^{ce}u_n^e` (BHATT18 lines 403–408). | Holds; Notation 4.1 line 348 (p. 6), §1.2 line 88 (p. 2). |
| `bhatt_riemann_extension_ker_almostZero`, `bhatt_quantitative_riemann_extension`, `bhatt_kernel_without_regularity` | `n = 0`; `m = 0`; `g = T` | See R05 for `n = 0`. `m = 0`: `t⁰ = 1`, both sides trivial. `c = pᵏm`: `e ≥ 1/pᵏ ⇒ ce ≥ m`. | True; README lacks `n = 0` (R05). |
| `bhatt_riemann_extension_limit`, kernel | `g = 1`; `g = 0`; `(T, 0)` | `a` vanishing on `⋃U_n = {g ≠ 0}` gives `ga = 0` (R uniform, reduced), then `(g^{1/p^k}a)^{p^k} = g·a^{p^k} = 0`. `g = 0`: `g^{1/p^k} = 0` by reducedness. Product: `(t_kT_k, 0)(0, 1) = 0`, `(t_k, t_k)(0, 1) ≠ 0`. | True. |
| same, cokernel; `hmono` | disc `g = T`; `n = 0 → 1` | `1/T` has norm `q^{−n}` on `U_n`, not in the limit; limit `R°`. `{1 ≤ |g|} ⊆ {|t| ≤ |g|}` as `|t| ≤ 1`. Root system makes `(tg)^{1/p^k} = ((tg)^{1/p^{k+1}})^p`, so the `lim¹` loss is absorbed. | True; BHATT18 line 119 (Remark 1.7, p. 3). |
| §2.1 closures | `ℤ ⊂ ℤ[i]`, `p = 3`; `ℤ ⊂ ℤ[1/2]`; `k[t^{1/p^∞}, xt^{1/p^m}]` | `Im (a+bi)³ = b(3a² − b²)`, zero only for `b = 0`. `en ≤ m ∀n ⇒ e = 0`. `x ∈ R^*`, `x ∉ R^†`, `x ∈ t^{-1/p^∞}R^†`. | Holds; ANDRE18A lines 556–573 (p. 15), 1050–1063 (p. 26), 1088 (p. 27). |
| §2.4 Laurent localisation | `A = K × K`, `g = (ϖ², 1)`, `λ = ϖ`, `a = (1, ϖ²)`; `K⟨T⟩{λ²/T²}` | First factor `f = ϖ ∈ A°°`, dies; norm of `a` is `q²`; `inf_m max(q^m, q^{2−m}) = q`. `Σ_j a_{2j−1,j}λ^{2j} = λ` forces `|a| ≥ |λ|^{−1}`, attained by `λ^{−1}TU`. `A{ϖ³/g} = K × K → A{ϖ/g} = K`. | Holds with the stated corrections; ANDRE18A lines 1107–1195. |
| §2.8 root algebras | `A = K`, `g = 1`, `g = 0` | `K[S]/(S^p − 1)`: reduced of dimension `p` in characteristic 0, `K` in characteristic `p`; `g = 0`: `K`. | Holds; ANDRE18A lines 1320–1352 (p. 33). |
| §3.3 almost perfectoid | `B = K + (T₁^{1/p^∞}P)^− + (T₂P)^−` | `T₁^{1/p^k}P ⊆ B ⊆ P`; `T₂ ∈ B`, `T₂^{1/p} ∉ B`. | Holds; lines 1993–2044; page slip R02. |
| §3.6 and `riemann_extension_completeIntegralClosure` | `g` unit; `B = K + (ΣT₁^{1/p^m}P)^−`, `g = T₁` | Unit: both sets `R°` (f.g. `R°`-module bounded). `T₂ = T₁T₂/T₁` in the saturation; `T₁^{1/p^m} ↦ 0` turns a monic equation over `B°` into one over `K°`, `T₂` transcendental. | Holds; ANDRE18A lines 2580–2628 (pp. 55–56). |
| §3.10 nested systems | zero system; `A[j][ε]/(ε²)` | Zero ring terminal; `ε` nilpotent, not perfectoid, base change holds. | Holds; lines 2906–2923 (p. 61). |
| §4.1 almost Galois | `ℤ → ℤ[i]`; swap on `A × A` | Images `(1,1), (i,i), (i,−i), (−1,1)`, determinant `2·2 = 4`. `(1,0)⊗(0,1) ↦ ((0,0),(0,1))` (André), `((0,0),(1,0))` (A4.2, `b·γ(b′)`). | Holds; lines 296–333; A4.2 at AdicEtaleGeometry README :9252. |
| §4.6, §4.7 | `g = 1`; `Y^ℓ = T`; `B′ = 0`; trace on `L × L` | `a/ℓ + b/pᵏ = 1/(ℓpᵏ)` when `apᵏ + bℓ = 1`. Zero cover: structure map has kernel `A`. `tr(1, 0) = 1`, also `p = 2`. | Holds; ANDRE18A lines 56–68 (p. 2), 3171–3200 (pp. 67–68). Clause (3) statable: R01. |
| §5.3 Krull detection | `R = S = K°`, `M = K°/K°°`, `K = K°°` | Hypotheses hold except Noetherian; `M ≠ 0`. | Holds; ANDRE18B lines 228–234 (p. 76). |
| §5.5 spectral norm | `n = 0` | `|ζ_{p^j} − 1| → 1`; `x = (ζ−1)·((ζ−1)u)`. | Holds; lines 358–366; page slip R03. |
| §5.7 tube models | reduction modulo `ϖ_j` | `ϖ_{ik′}U ≡ 0`; relation `Z^{p^{j−k′}} − g_{k′}`, monic; basis `Z^aU^b`, `a < p^{j−k′}`. | Holds; gap in ANDRE18B lines 490–497 (p. 81) confirmed. |
| `kummer_almost_faithfullyFlat`, `kummer_isPureHom` | `p = 2`; `n = 0` | `Φ₂(ζ₁) = 1 + ζ₁`, `ζ₁ = −1`; `ζ₀ = 1`. `Φ_{p^{j+1}}` of degree `p·p^{j−1}(p−1)`. | Encoding matches ANDRE18B lines 313–351. |
| `kummer_ramified_almost_faithfullyFlat` | `m = 0`; `B = A`; `B = 0`; idempotence | `(p⁰) = (1)`. `B = A`: `Â° ⊆ B° ⊆ g^{-1/p^∞}Â°`, quotient killed by every `g^{1/p^l}`. `v(ζ_{j+1} − 1)·p = 1/(p^{j−1}(p−1)) = v(ζ_j − 1)`, so each generator is a unit times a `p`-th power of a generator. For `M` almost isomorphic to `V`: `ker(M⊗N → M⊗N′)` killed by `m² = m`. | True; ANDRE18B lines 589–607 (p. 83). |
| `IsAlmostFlat`, `IsAlmostFaithfullyFlat`, `IsPureHom` | `m = V`; `m = 0`; `ℤ → ℤ[1/2]` | Flat; everything; `ℤ/2 ⊗ ℤ[1/2] = 0`. | Determine their objects. |

**Library declarations opened at the pins.** Tau Ceti: `IsPerfectoidTateRing`
(`RingTheory/Perfectoid/Basic.lean:86`, `.isUniform` :102, `.isReduced` :108); `IsAlmostZero`
(`RingTheory/Almost/BasicSetup.lean:252`), `isAlmostZero_iff` :261; `Almost.Module`
(`RingTheory/Almost/Module.lean:75`), `toAlmost` :86; `projectiveTrace`
(`LinearAlgebra/Trace/Projective.lean:72`, :96, :118, :158); `PairOfDefinition`
(`RingTheory/Huber/Basic.lean:163`), `IsPseudoUniformizer` :186, `IsTateRing` :213,
`le_powerBoundedSubring` :474; `IsBounded` (`Bounded.lean:109`); `IsPowerBounded`
(`PowerBounded.lean:121`), `powerBoundedSubring` :456, `isPowerBounded_of_isIntegral` :482,
`topologicallyNilpotentIdeal` :598; `IsUniform` (`Uniform.lean:71`); `rationalSubset`
(`Spa/RationalSubset/Basic.lean:146`), `spaBasicOpen` :319; `completionLocObj`, `toCompletionLoc`
(`LocalizationTopology/Completion.lean:242`), `completedPlusSubring` (`Plus.lean:117`),
`HasDenominatorPower` (`Basic.lean:311`); `pairHomOfRationalSubsetSubset`
(`Spa/Localization/PlusComparison.lean:219`); `presentationLimitPresheafInCommRingCat`
(`Stalk/Basic.lean:58`); `toPresentationLimit` (`GlobalSections.lean:81`),
`isIso_toPresentationLimit_top` :199; `presentationLimitPlusPresheaf` (`Plus/Basic.lean:116`),
`presentationLimitPlusPresheafι` :151, `map_completedPlusSubring_eq_presentationLimitPlusSubring`
:225; `MulSemiringAction.tensorToPi_tmul` (`RingTheory/Invariant/Free.lean:118`, `a * g • b`).
Mathlib: `AdicCompletion` ring and algebra instances (`RingTheory/AdicCompletion/Algebra.lean:97`,
:103); `CommRingCat.hasLimits` (`Algebra/Category/Ring/Limits.lean:489`);
`Algebra.TensorProduct.leftAlgebra` (`RingTheory/TensorProduct/Basic.lean:231`);
`Module.IsTorsionBySet` (`Algebra/Module/Torsion/Basic.lean:214`);
`Ideal.mem_iInf_smul_pow_eq_bot_iff` (`RingTheory/Filtration.lean:393`); `IsAlmostIntegral`,
`completeIntegralClosure` (`RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27`, :32);
`Module.Flat.iff_lTensor_injective` (`RingTheory/Flat/Tensor.lean:89`); `CategoryTheory.Tor`
(`CategoryTheory/Monoidal/Tor.lean:44`); `smoothingSeminorm`
(`Analysis/Normed/Unbundled/SmoothingSeminorm.lean:522`); `IsIntegralClosure.finite`
(`RingTheory/DedekindDomain/IntegralClosure.lean:175`); `AlgebraicGeometry.UniversallyInjective`
(`AlgebraicGeometry/Morphisms/UniversallyInjective.lean:46`).

**Duplication by object.** No pinned declaration states module purity of ring maps, almost
flatness for an ideal, the Kummer tower or the root saturation (searched Mathlib `RingTheory`,
`Algebra`, `LinearAlgebra` and Tau Ceti for universally injective and pure maps, `AlmostFlat`;
Mathlib's `Ideal.Pure` is another notion). `library-matches.md`: no same-name hit.

**Cross-roadmap citations resolved.** PerfectoidSpaces (main): all 31 italic slugs found in the
cited P-sections (P0.2 :967, P0.9 :1564 and :1581, P0.16 :2188, P0.26 :3168, P0.27 :3251, P1.5
:4006, P1.7 :4082, P2.2 :6207, P2.16 :7590, P3.3 :8183, P3.13 :8751, …), P4.15.4 at :11144.
PerfectoidQuotients (open): §1.3 and §1.4 exist at its head. DerivedModuleAlgebra (main): §0.K.1
:649, §0.2 :794, §1.1 :1865; §1.T.1 is mapped by its sentence at :38 to the Tau Ceti tower
declarations, so the citation stays valid. EnhancedDerivedSheaves E2:towers.2 :1401.
AdicSpaces (Completed) §2.2, §3.1; AdicSpacesPartII R0.3, R0.4, R0.9; AdicSpacesPartIII R3.5, R3.9.
AdicEtaleGeometry A4.2 :9246 (`Algebra.galoisTensorMap` is its alias of the native map, :307).
DerivedDeRhamCohomology §1.10 and DeformationAndDerivedPatchingAlgebra §1.13 (open heads, with the
two cited names in their `Suggested.lean`). PerfectoidShimuraVarieties §1.3 and AdicSpacesPartV §1.7
are named as other owners, not suppliers. `scratch/citations.md`: no citation found nowhere.

**Ownership.** FiniteEquivalenceRelations (open) cites this roadmap's §5.1 `IsPureHom` as owner.
DirectSummandsAndBigCohenMacaulay (open) consumes Layer 1 and §5.1–§5.3, §5.11, §5.12 and states
none of them. No `Suggested.lean` on main or at an open head declares `IsPureHom`, `IsAlmostFlat`,
`IsAlmostFaithfullyFlat`, `KummerBase`, `annularTower` or `rootSaturation`.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotients, PerfectoidTowers, RelativeFarguesFontaine, ArcTopologyAndDescent, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartIV; pure ring maps, the Kummer tower, Riemann extension and the Abhyankar lemma: this roadmap; monic-root pairs: PerfectoidQuotients §1.4; finite étale torsors: AdicEtaleGeometry A4.2; almost algebra and almost purity: PerfectoidSpaces; direct summand theorems: DirectSummandsAndBigCohenMacaulay; nothing owned twice.

**Remarks that need no change here.**

- DirectSummandsAndBigCohenMacaulay (open) declares `gap:ramified-multielement-kummer` against this
  roadmap and cites it by labels of the form "§RA.5 (pure map)". Both are for that roadmap's review;
  this README's §5.8 only reports André's remark that the method extends.
- In `kummer_ramified_almost_faithfullyFlat` the binders `IsReduced B` and `hptf` are the source's
  standing reductions (ANDRE18B line 591); the truth of the statement needs only the étale hypothesis.
- The layer order 2 → 3 → 4 agrees with André A's chapters and is forced: Layer 3 depends on Layer 2
  and Layer 4 on Layers 2 and 3.
- Maintainer notes: none were given.

## Not verifiable

- The entries of "Corrections to the sources" outside the sampled targets (André A formula (2.17)
  and Proposition 4.4.4(3); André B §0.6, §1.2.1 formula (2), Annexe A.2 and A.4) were not re-read
  this round; the round-5 table carries their values.
- The contents of the PerfectoidSpaces P-sections were resolved by slug and heading, not re-read
  statement by statement.
- GR03: the nine cited items were located (lines 702, 703, 1070, 1101, 1410, 1888, 3371, 5263,
  5509); only Definition 2.4.4 was read in full.
- Whether `𝒪⁺(U)` equals the power-bounded subring of `𝒪(U)` for every rational `U` of
  `Spa(R, R°)`, `R` perfectoid: not decided. No statement of the package depends on it; §1.5's
  comparison with §3.6 is asserted only up to almost isomorphism.

## Source issues

- **Error** in ANDRE18A at Remarque 2.6.4(1), p. 29: the source says the maps between uniformized Laurent localisations at different radii are all injective; it should be that they can kill a factor, as for `K × K`, `g = (ϖ², 1)`; affects nothing.
- **Error** in ANDRE18A at §2.6.2, property list, p. 28: the source says the norm of the image of `a` in the Laurent localisation is the infimum over `m` of the norms of `(g/λ)^m a`; it should be the Banach quotient norm, which is `q²` against `q` for `K × K`; affects the proof.
- **Gap** in ANDRE18A at Lemme 2.6.3, proof, p. 29: the source says injectivity follows from that infimum formula and a lower bound `1`; it should be argued by a bounded multiplicative point where `ag` does not vanish; affects the proof.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), p. 27: the source says the step holds by condition (1); it should be condition (2), the elements lying in `B[1/g]`; affects nothing.
- **Error** in ANDRE18A at Théorème 0.3.1(1), p. 2: the source says `A` is included in the largest perfectoid algebra between `A` and `B′`; it should be a continuous structure map, injective when `B′` is faithful; affects a stated result.
- **Gap** in ANDRE18B at Théorème 2.5.2, proof step (a), p. 81: the source says generic-fibre flatness follows from writing the spectrum of the base as a union of affinoid polydiscs; it should be derived from a flat integral model, since the descent to the base is not argued; affects the proof.
- **Gap** in BHATT18 at §1.4, Notation, p. 3: the source says `t` only has `p`-power roots, with `|t| = |p|` in characteristic 0; it should also require `0 < |t| < 1` in characteristic `p`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bc5f01a68ad6c105c1e5633dae7ea4d374ef1874", "job": "REV-PKG-PerfectoidSpacesPartII~6", "model": "fable", "worker": "chris-x30"} -->
