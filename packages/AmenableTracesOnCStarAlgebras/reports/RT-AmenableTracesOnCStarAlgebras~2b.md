<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6850491235 -->
Red team round 2 pass b (claude) of fcefcb8

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the passage to the image of the GNS representation (§6.4) is statable and absent from `Suggested.lean`

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:1797-1800`: "if `τ ∈ UAT(A)` then
   `τ̇ ∈ UAT(B)` … and if `τ ∈ AT(A)` and the quotient map `π_τ : A → B` has a c.p.c. splitting
   `σ : B → A`, then `τ̇ ∈ AT(B)`"; module docstring, `Suggested.lean:35-38` and `:44-50`.

   **Claim.** The module docstring lists what Layer 6 states (faces, normalized restriction, ideal
   extension) and which headlines are not statable (bimodule form, `⊗min`). The Summary
   (`README.md:18-19`) names "permanence of the classes under subalgebras, quotients, ideals,
   unitization and minimal tensor products" among the end theorems.

   **Witness.** Every other permanence target of that sentence is stated or declared not statable
   (§3.2, §3.4 and §6.3, §6.5 stated; §3.5 declared). §6.4, the only one whose hypothesis is delicate
   (`C*(F₂) → C*_r(F₂)`, `README.md:1807-1809`), is neither, and needs only carriers the file has:
   `A →⋆ₙₐ[ℂ] B`, `B →CP A`, `IsFaithfulTrace`.

   **Repair.** In `Suggested.lean`, section `Faces`, after `isAmenableTrace_of_normalized_comp`, add:

   ```lean
   /-- **Passage to the image of the GNS representation.** Let `q : A → B` be a surjective star
   homomorphism and `γ` a faithful tracial state of `B` with `γ ∘ q = τ`, so that `ker q` is the trace
   kernel of `τ`, `B ≅ π_τ(A)` and `γ` is the descended trace. If `τ` is uniform amenable, so is `γ`;
   if `τ` is amenable and `q` has a completely positive contractive splitting, `γ` is amenable
   (README §6.4; brown2006, Proposition 3.5.8 (1)–(2)). The splitting cannot be dropped:
   `C*(F₂) → C*_r(F₂)` carries the amenable regular trace to a non-amenable one. -/
   theorem isAmenableTrace_of_comp_surjective {B : Type*} [NonUnitalCStarAlgebra B]
       [PartialOrder B] [StarOrderedRing B] (q : A →⋆ₙₐ[ℂ] B) (hq : Function.Surjective q)
       (τ : A →P[ℂ] ℂ) (hτ : IsTracialState τ) (γ : B →P[ℂ] ℂ) (hγ : IsTracialState γ)
       (hf : IsFaithfulTrace γ) (hτγ : ∀ a, τ a = γ (q a)) :
       (IsUniformAmenableTrace τ → IsUniformAmenableTrace γ) ∧
         ((∃ σ : B →CP A, (∀ b, ‖σ b‖ ≤ ‖b‖) ∧ ∀ b, q (σ b) = b) →
           IsAmenableTrace τ → IsAmenableTrace γ) := by
     sorry
   ```

   In the module docstring, Layer 6 clause, after "lifting from quotients)" insert ", under passage to
   the image of the GNS representation". In README §6.4 add before *Needs:*: "`Suggested.lean` states
   both parts as `isAmenableTrace_of_comp_surjective`, with `B = π_τ(A)` presented by a surjective star
   homomorphism `q : A → B` and a faithful `γ ∈ T(B)` with `γ ∘ q = τ`; then `ker q = N_τ` and `γ` is
   `τ̇`."

   **Tested on.** `q : C*(F₂) → C*_r(F₂)`, `γ = τ_{F₂}` (faithful), `τ` the regular trace: `τ ∈ AT`,
   `γ ∉ AT`, so the second part says no c.p.c. splitting exists, which is the README's Check; `τ ∉ UAT`,
   so the first part is vacuous. `q = pr₁ : ℂ ⊕ ℂ → ℂ`, `γ = id`, `σ(λ) = (λ, 0)`: both sides hold.
   Truth for nonunital `A`, without Arveson: for approximants `φ` of `τ`, `φ ∘ σ` recovers
   `γ(b) = τ(σ(b))`, and `x = σ(bb′) − σ(b)σ(b′) ∈ ker q ⊆ N_τ` gives
   `‖φ(x)‖₂² ≤ tr φ(x*x) < τ(x*x) + ε = ε`. The uniform part: `â ↦ q(a)^` is a unitary
   `L²(A,τ) → L²(B,γ)` carrying `π_τ(A)''` onto `π_γ(B)''`, and §5.2 applies on both sides. The Lean
   text was not elaborated (this pass may run no Lean); it uses only notations already in the file.

2. **F02** (P3) the reduced group C*-algebra has an earlier owner that the README does not cite

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:103-104`: "**OperatorAlgebraDynamics**
   owns reduced group C*-algebras of discrete groups"; §7.3, `README.md:1923-1946`.

   **Claim.** The only earlier carriers of `C*_r(Γ)` are D2's `ℂ ⋊_r Γ` and D2.FreeGroups'
   `generatedCStarAlgebra`; the comparison of §7.3 covers them.

   **Witness.** `TauCetiRoadmap/VonNeumannAlgebras/README.md:2665-2666` (V8.RegularL2, on main, first
   in the merge order): "Define the reduced group C*-algebra C*_r(G) as the norm closure of λ(L¹(G))
   in `B(L²(G,μ))`". The README never names V8, yet uses V13b's `L(F₂)`, built on that layer.

   **Repair.** In "Scope and ownership", VonNeumannAlgebras bullet, add: "V8.RegularL2 defines
   `C*_r(G)` for a locally compact group as the norm closure of `λ(L¹(G))` in `B(L²(G, μ))` and the
   group von Neumann algebra `L(G) = λ(G)''`; §7.3 compares its discrete case with
   `generatedCStarAlgebra`." In §7.3, after "nuclearity passing along star isomorphisms.", add: "The
   same conjugation carries `generatedCStarAlgebra lam` onto VonNeumannAlgebras V8.RegularL2's
   `C*_r(Γ)` for the counting measure: for `f ∈ ℓ¹(Γ)`, `λ(f) = Σ_g f(g)u_g` converges in norm, so the
   closure of `λ(ℓ¹(Γ))` is the closure of the span of the `u_g`; and it carries
   `M_{τ_Γ} = λ(Γ)''` onto V8's `L(Γ)`." Add "VonNeumannAlgebras V8.RegularL2" to the *Needs:* of §7.3,
   to the supplier contracts (one line with the definition above) and to the Layer 7 Dependencies.
   Tested: trivial group, both are `ℂ`; `Γ = ℤ`, V8's Check gives `C*_r(ℤ) ≅ C(𝕋)` with `λ_1` the
   bilateral shift, as in the README's Check of §7.3.

Two new findings (S01 is P2, S02 is P3). All eight round-1 findings are repaired at this head and
no repair introduced an error. No statement of `Suggested.lean` or of the README was found false.

## Round-1 findings at this head

| Finding | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (P2) comparison with D2's `ℂ ⋊_r Γ` | repaired | `packages/AmenableTracesOnCStarAlgebras/README.md:1930-1946`: "Prove the comparison with OperatorAlgebraDynamics D2 … `x ↦ WxW*` induces a star isomorphism of `generatedCStarAlgebra lam` onto `ℂ ⋊_r Γ` with `λ_g ↦ u_g`". API bullet at `:1977-1980`, three Checks at `:2000-2011`. Recomputed: `S₃`, `g = (12)`, `h = (23)`: `(12)(23) = (123)`, `(23)(12) = (132)`. |
| 1a/F02 (P3) C8.2 cited for a statement it does not make | repaired | `README.md:1428-1433`: "by Stinespring (CStarAlgebras C4.2), `φ_n = W*ρ(·)W` … `V_m = U_m*(0 ⊕ W)` is an isometry". C8.2 on main states exactly the absorption used (`TauCetiRoadmap/CStarAlgebras/README.md:1619-1623`); C4.2 is in the *Needs:* and in the Layer 4 Dependencies. |
| 1a/F03 (P3) no Check pins the `Aᵒᵖ` convention | repaired | `README.md:1404-1410`: "`Σ τ(e_{ij}e_{ji}) = n²·(1/n) = n` and `Σ e_{ij} ⊗ e_{ij} = n·P`". Recomputed: `e_k ⊗ e_l ↦ δ_{kl} Σ_i e_i ⊗ e_i`, norm `n`; flip has norm `1`. |
| 1a/F04, 1b/F03 (P3) `IsNormalState` and faithfulness Checks | repaired | `README.md:1505-1520`: positive control `1 − 2^{-m-1} → 1`; negative control `σ(p_m) = 0`, `σ(1) = 1`; "Faithfulness is needed: on `M = L(F₂) ⊕ ℂ` …". |
| 1b/F01 (P2) vector-trace clause declared not statable | repaired | `Suggested.lean:300-306`, `isUniformAmenableTrace_iff_isAmenableTrace_gns`; `README.md:1595-1600` and the uniqueness bullet at `:693-696`. The "not statable" list now has two entries (bimodule form, `⊗min`). |
| 1b/F02 (P3) §6.5 estimate assumed its conclusion | repaired (differently, soundly) | `README.md:1826-1831`: "`d₂(ψ, x(1 − e)) ≤ tr ψ̃((1 − e)x*x(1 − e)) ≤ ‖x‖²(1 − tr_k φ(e))`". Recomputed with `(1−e)x*x(1−e) ≤ ‖x‖²(1−e)² ≤ ‖x‖²(1−e)` and `tr ψ̃(1 − e) = 1 − tr φ(e)`; on `c₀ ⊆ c`, `ψ = (1−η)δ_1 + η·lim`: `η|lim x| ≤ ‖x‖η^{1/2}`. |
| 1b/F04 (P3) `generatedCStarAlgebra` restatement not named | repaired | `Suggested.lean:19-23` and `:421-424`; `README.md:107-108` and `:1925-1926`: "restating the definition of the same name of OperatorAlgebraDynamics D2.FreeGroups". Owner's body identical (`TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean:337-339`). |

## Verified sound

**Dependency check** (run on the README at this head):

    depcheck: 207 roadmaps, 1900 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. CStarAlgebras, VonNeumannAlgebras, CStarClassification,
OperatorAlgebraDynamics, FactorRigidity and BanachSpaceTheory are on main; FactorRigidity stands
later in the merge order but is on main and is cited for a remark only. `design/plan.json` has
`"gaps": []` and the README declares none; none is needed. The pull request changes only
`packages/AmenableTracesOnCStarAlgebras/`.

**Counts.** Declarations of `Suggested.lean` read: 45 (22 theorems, 18 definitions, 1 abbreviation,
4 instances), each compared with its elaborated type in the worker's signature table and with its
README statement. README targets read: 40 subsections (all 2213 lines). Checks read: about 150;
recomputed with values: about 95. Source locators verified at the cited lines: brown2006, 75 line
locators; schafhauser2020, 4; tikuisis-white-winter2017, 7. Sibling citations resolved on main at
`42813dd`: CStarAlgebras C2.1, C2.8, C4.1, C4.2, C5.1, C5.2, C5.4, C6.1, C6.2, C6.5, C7.1, C8.1–C8.4,
C9.1, C9.7; VonNeumannAlgebras V0, V1, V2, V4, V5, V13a, V13b.SpatialNorm, V13b; CStarClassification
§2.1, §3.4, §3.5; OperatorAlgebraDynamics D2, D2.FreeGroups; FactorRigidity §2.2; BanachSpaceTheory
B1 (31). Pinned declarations found in the cited files: about 45 of Mathlib and about 40 of Tau Ceti.

**Policy.** No `set_option`, `lemma`, `#check`, `#eval`, `example`, `True` placeholder, sorry'd data,
pull-request number, process narrative or machine path. Imports: `import Mathlib` and three
`TauCeti.*` modules, each used (`IsKMSState`, `VonNeumannAlgebra.adjoin`, `TauCeti.Amenable`). Every
Lean name occurs in the README; the citation resolver lists nothing unresolved.

**Restated definitions against their owners on main.** `IsInjective`, `IsQuasidiagonalSet`,
`IsQuasidiagonal`, `IsAF`, `generatedCStarAlgebra`: bodies identical to VonNeumannAlgebras,
CStarAlgebras, CStarClassification and OperatorAlgebraDynamics. `IsNormalState` is
`IsNormalFunctional` on `→P`; `IsNuclearMap` is `IsNuclearContraction` on a bare function. The
namespaces differ, so no fully qualified name is shared.

**Ownership.** `roadmaps grep` for amenable trace, quasidiagonal trace, Connes–Kirchberg, and the
names `IsAmenableTrace`, `IsHypertrace`, `gnsVonNeumannAlgebra`: no other owner on main or at an open
head. `IsTracialState` of VonNeumannAlgebras V5 lives on `VonNeumannAlgebra` with a bare linear
functional; the README says so and compares. Overlap report: no dropped id, no second copy.

**Headlines.** Stated: unitization; Connes–Kirchberg in hypertrace, extension and tensor forms;
Følner sufficiency and equivalence; tracial von Neumann form; uniform amenable ⇔ injective and the
vector-trace form; nuclear; exact; both faces; normalized restriction; ideal extension; commutative;
AF; groups; quasidiagonal algebra ⇒ quasidiagonal trace; faithful quasidiagonal trace ⇒
quasidiagonal; Rosenberg; AF-subalgebra necessity. Declared not statable, correctly: bimodule form
(no right GNS representation at the pins) and `⊗min`. Absent: §6.4 (S01).

**Padding.** None. The four instances have one-line bodies but are needed to state headlines (see
Not verifiable); `amenable_of_isQuasidiagonal_generatedCStarAlgebra` combines two other headlines
and is the named theorem of §8.4.

**The computed pass.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `IsTracialState` | `M_2`, `x ↦ x₁₁`; zero algebra | `1` vs `0` at `e₁₂e₂₁`, `e₂₁e₁₂`; no norm-one functional | excluded |
| `matrixTrace`, `matrixTwoNorm` | `e₁₁ ∈ M_2`; `k = 0` | `1/2`, `2^{-1/2}`; `0` | junk harmless |
| three classes | `φ_m = τ(·)1_m/m` on `M_2`, `e₁₂, e₂₁` | defect `1/(2m)`, `tr_m φ_m(1) = 1/m` | rejected by normalization |
| `isAmenableTrace_unitization_iff` | `A = ℂ`; `c₀`, `δ_1` | `τ̃ = pr₁` on `ℂ²`; norm `δ` vs `2δ` at `(1/2, −1/2)` | true, unital `A` included |
| hypertrace form | `ℂ²` on `ℂ²`; `H = 0` | `ψ′(e₁₁e₁₂) = 1/2 ≠ 0`; no tracial state | true |
| extension form | `(ℂ², pr₁)` | `Φ(T) = T₁₁`, `Φ(1) = 1` | true |
| tensor form | `M_n`, `(e_{ij}, e_{ji})` | `n ≤ n`; wrong model `n ≤ 1` | true |
| `IsFoelnerTrace`, sufficiency | `P = e₁₁`, `T = e₁₂`; `H = 0` | `0 + 1 = ‖e₁₂‖²_HS`; no family with `n ≥ 1` | true |
| Følner equivalence | `ℂ²`, `(1/3, 2/3)`; finite-dimensional `H` | commutator `4/9`, rank 2 gives `1/2`; `hess` forces `A = 0` | hypothesis needed, present |
| §4.5 compression step | `V_m = U_m*(0 ⊕ W)` | `V_m*V_m = W*W = 1`; difference `→ 0` | sound |
| tracial von Neumann form | `L(F₂) ⊕ ℂ`, `pr₂`; `ℓ∞`, `lim_U` | amenable, not injective; `0 ↛ 1` | `hf` needed; `hn` discriminates |
| uniform amenable ⇔ injective | `C*(F₂)`; `c₀` | both false; `M_τ = ℓ∞`, both true | true |
| vector-trace form | `c₀`, `σ′ = τ'' + lim_U` | `σ′(p_m) → 1 ≠ 2` | `hn` needed |
| `IsNuclearMap`, nuclear, exact | zero map; `C*_r(F₂)`; `C*(F₂)` | `n = 0`; all four false; hypothesis fails | true |
| §5.1 commuting-range lemma | `Σ_m w_m*w_m`; `β = id_{M_2}`, `y_{kl} = e_{lk}` | `β(1) ≤ 1`; `2·1` vs norm `1` | contractive; commutation needed |
| faces | `ℂ²`, `s = 1/2`; `C*_r(F₂) ⊕ ℂ` | `P = e₁₁`; `AT = {χ ∘ pr₂}` | true |
| normalized restriction | `M_3 → M_4`; `c₀ ⊆ c` | `3/4·1 + 1/4·1 = 1`, `3/4` at `1_{M_3}`; `c = 1/2`, `δ_1` | true |
| ideal extension | `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`; non-injective `q` | bounds `0`; amenable to non-amenable | `hι` needed |
| §6.4 (S01) | `C*(F₂) → C*_r(F₂)`; `ℂ² → ℂ` | no splitting; `σ(λ) = (λ, 0)` | true as proposed |
| commutative, AF | `C[0,1]`, `f = x`; `M_2 ⊕ ℂ`; `K(ℓ²)` | `(n+1)/(2n)`; `(Tr x + 2λ)/4`; `T = ∅` | true |
| group TFAE, Rosenberg | `1`, `ℤ`, `S₃`, `F₂`; `λ_1M_{δ_0}λ_1*` | all true ×3, all false; `M_{δ_1}` | true; item 4 not vacuous |
| quasidiagonal pair | `π(1) = q ≠ 1`; `SO₂`; Toeplitz | restrict to `qH`; no trace; no faithful trace | hypotheses needed, present |
| `subalgebra_isAF_simple` | `M_3 ⊆` CAR; `B = ℂ²`; `B = 0` | `c = 3/4`; `pr₁` not faithful; contradicts `Nontrivial A` | true |
| §1.3 ideal extension | `γ(ab)` | `lim τ((ea)(be)) = lim τ((be)(ea)) = γ(ba)` | sound |
| §1.6 expectation | `x = e_{kl}` | `τ(e_{kk})/τ(e_{ll})·e_{kl} = e_{kl}` | projection |
| §2.2 product rule | `T(ab)` | `T(a)φ(b) + (1−VV*)^{1/2}π(a)(1−VV*)^{1/2}T(b)` | sound |
| §2.4 Ozawa | `h = diag(1/3, 2/3)`; rank one | `min`: `1/3 ≤ 1/3`, `max`: `2/3`; `1 − c² ≤ 2^{3/2}(1 − c²)^{1/4}` | sound |
| §6.3 decomposition | `τ(ι(a) + λ1)` | `cγ(a) + λ = c(γ(a) + λ) + (1 − c)λ` | sound |

## Not verifiable

- **Elaboration.** No Lean command is permitted in this pass: the binder comparison used the
  worker's signature table, and the declaration proposed in S01 must be elaborated by the repair
  worker.
- **Whether two instances are redundant.** `starOrderedRing_vonNeumannAlgebra` and
  `starOrderedRing_generatedCStarAlgebra` apply Mathlib's instance `Subtype.starOrderedRing` with
  `𝕜 := ℂ`. The scalar field occurs only in its class arguments, so instance search probably cannot
  find it unaided; deleting them and elaborating would decide.
- **Waived or uncertified sources**, cited by locator only: connes1976, brown-ozawa2008,
  paulsen2002, pedersen2018, kirchberg1993 (the last agrees with brown2006 lines 1910–1913).
- **Published numbering of brown2006.** The README cites the arXiv v2 numbering and says so; the
  Memoir's numbering was not compared.
- **VonNeumannAlgebras V3 and V6** were located by heading and keyword, not read in full.

## Source issues

- **Misprint** in brown2006 at Proposition 3.5.3, proof, printed page 30 (line 1285): the source says the cutting projections lie in the double commutant of the GNS image; it should be the commutant, as in Lemma 3.5.2; affects nothing.
- **Misprint** in brown2006 at Lemma 2.5, printed page 11 (line 488): the source states a strict inequality for every element, which fails at zero; it should be non-strict or exclude zero; affects nothing.

Source independence: 14 passages compared with 3 sources, none shared; largest share brown2006, 79 of 110 locators; contents compared with brown2006: independent (Layer 4 draws on its §3.1, Layer 5 on §3.2, §4.2 and §4.3 together, Layers 3 and 6 split §3.5, Layer 8 joins §3.3, §4.1 and §4.3 with schafhauser2020; no run of layers maps one to one onto its sections).

## For the human reviewers

- **Licence.** brown2006 is read from arXiv:math/0304009v2 and cited in that numbering; the published Memoir (no. 865) was not compared (`packages/AmenableTracesOnCStarAlgebras/sources.toml`).
- **Ownership on main.** OperatorAlgebraDynamics D2.FreeGroups states its free-group theorems on `generatedCStarAlgebra` and uses D2's expectation on `ℂ ⋊_r Γ` without stating the comparison that §7.3 proves here (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:1833-1838`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fcefcb83341d80f56cdd1a3a1c9162c2f8afa855", "job": "RT-AmenableTracesOnCStarAlgebras~2b", "model": "fable", "worker": "chris-x14"} -->
