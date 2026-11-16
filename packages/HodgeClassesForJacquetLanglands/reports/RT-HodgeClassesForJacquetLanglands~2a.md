<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6906231884 -->
Red team round 2 pass a (claude) of ff6a1d8

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the `d = 0` objects are outside §0.2's hypothesis, and their owner is not cited

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:644` ("Let `(G, X)` be a Shimura
     datum of abelian type whose Shimura varieties are compact"); used for `d = 0` at `:618–620`,
     `:727–729`, `:919–920`, `:2749–2751`, `:2773–2775`.
   - **Claim.** §0.2 supplies `V_i`, its `ℓ`-adic realizations, Hecke action and duality for all
     Jacquet–Langlands Hodge data, `d = 0` included.
   - **Witness.** `F = ℚ`, `B_i` ramified at `{∞, 2}`: `G^ad(ℝ) = SO(3)` is compact. ShimuraData (open
     head) requires "`SV1–SV3`"; ShimuraVarieties §8.6 is for "a `ℚ`-torus". The owner of this case,
     AutomorphicFormsOnReductiveGroups §§7.4–7.6 (algebraic modular forms), is not cited.
   - **Repair.** Insert in §0.2, after the four construction bullets:

     > *The definite case.* The same targets are stated for a connected reductive `G` over `ℚ` with
     > `G(ℝ)/Z(ℝ)` compact, `X = {h}` with `h` trivial, and `ρ` satisfying the fibre condition. Such a
     > pair fails Deligne's axiom on compact factors, so it is not a Shimura datum of ShimuraData, and
     > ShimuraVarieties §8.6 treats tori only. `Sh_K = G(ℚ)∖G(𝔸_f)/K` is a finite set, and its
     > canonical model is defined to be the constant finite étale scheme over `ℚ`. `H⁰(Sh_K, 𝕍)` is the
     > space of algebraic modular forms `{F : G(𝔸_f) → V : F(γgu) = ρ(γ)F(g), γ ∈ G(ℚ), u ∈ K}` of
     > AutomorphicFormsOnReductiveGroups §7.4 (`IsAlgebraicModularForm`, the rational coefficient
     > model), of type `(0,0)`, with `H^i = 0` for `i > 0`; restriction, trace and Hecke operators are
     > those of its §7.4, whose evaluation equivalence needs no finiteness of stabilizers. The stabilizer
     > `G(ℚ) ∩ gKg⁻¹` of a point is finite modulo the centre by the argument of its §7.6
     > (`centralArithmeticDescent`, which allows a centre that is not discrete in `Z(𝔸_f)`); for neat
     > `K` it is the central group `Z(ℚ) ∩ K`, acting trivially on `V` by the fibre condition. The `ℓ`-adic realization is `H⁰(Sh_K, 𝕍) ⊗_ℚ ℚ_ℓ` with trivial Galois action,
     > duality is `(F, F′) ↦ Σ_{x ∈ Sh_K} ⟨F(x), F′(x)⟩` (`D = 0`), and the Matsushima description is
     > gap:shimura-matsushima-comparison with `K_h = G(ℝ)`, which that contract covers.

     Add "AutomorphicFormsOnReductiveGroups §§7.4, 7.6" to the `*Needs:*` of §0.2, to the Layer 0
     Dependencies line and to that roadmap's supplier subsection ("§7.4 `IsAlgebraicModularForm`, the
     rational coefficient model of algebraic modular forms with restriction, trace and Hecke
     operators; §7.6 `centralArithmeticDescent`, the effective stabilizers when `G(ℝ)/Z(ℝ)` is
     compact"). In §0.1 replace "the canonical model is the constant one over `ℚ`" by "the canonical
     model is the constant one over `ℚ`, as defined in the definite case of §0.2", and in §0.5 write
     "of §0.2 (its definite case when `d = 0`)". Tested on the witness: `K` neat, `k = 2`, `H⁰` is the
     space of `L`-valued functions on `B^×∖B̂^×/K`, as the second Check of §0.2 says; `V_i` has rank one,
     type `(0,0)`, trivial Galois action, which is what §§10.7–10.8 use.

2. **F02** (P3) a Check of §0.2 states the component set with the wrong subgroup

   - **Location.** `README.md:750–751` ("`Sh_K` has `π₀(Sh_K ⊗_E ℚ̄)` in bijection with
     `G(ℚ)⁺\G(𝔸_f)/K`").
   - **Claim.** The components are indexed by the quotient by `G(ℚ)⁺`.
   - **Witness.** The README's torus `Res_{ℚ(√2)/ℚ}𝔾_m`, level `K(3)`: totally positive units are
     `ε^{2ℤ}`, `ε²` has order `4` in `𝔽₉^×`, so the displayed set has `8/4 = 2` points; §0.3 (`:851–852`)
     computes `1`. `:665` defines `G(ℚ)₊`.
   - **Repair.** Replace `G(ℚ)⁺\G(𝔸_f)/K` by "`G(ℚ)₊∖G(𝔸_f)/K`, `G(ℚ)₊` the stabilizer of `X⁺` as
     above" (the index set of the components `Γ_g∖X⁺` of the first bullet of §0.2). Tested: `T(ℚ)₊ = T(ℚ)`, `𝔽₉^×/⟨ε⟩` is one point.

3. **F03** (P3) gap:quaternionic-doubling-residue calls an unnormalized exponent "normalized"

   - **Location.** `README.md:474` ("with the normalized induced family `I_v(s)` of Levi character
     `|Nrd(a)|^{s+5/2}`"); `design/plan.json`, slug `quaternionic-doubling-residue` ("`I_v(s)` of Levi
     character").
   - **Claim.** `I_v(s)` is the normalized induction of `|Nrd(a)|^{s+5/2}`.
   - **Witness.** IP23 lines 2685–2693: functions transforming on the left by `|ν(a)|^{s+5/2}`, no
     modulus factor. `δ_P(a) = |Nrd(a)|⁵` (the radical is `⋀²` of a six-dimensional space, `det⁵`);
     normalized induction of that character transforms by `|Nrd(a)|^{s+5}`.
   - **Repair.** In both places write: "with the degenerate principal series `I_v(s)` of functions
     satisfying `F(pg) = |Nrd(a)|^{s+5/2} F(g)` for `p` in the Siegel parabolic with Levi component
     `a ∈ GL₃(B_v)`, that is the normalized induction of `|Nrd(a)|^s`, since
     `δ_P(a)^{1/2} = |Nrd(a)|^{5/2}`". Tested at `s = 3/2`: exponent `4`, and `M_v*(3/2)` lands in
     `I_v(−3/2)`, exponent `1`, as §6.3 states.

4. **F04** (P3) two definitions sit after the targets that use them

   - **Location.** `README.md:1920` ("In the anisotropic rank-three setting of §6.5"); `:2089–2090` and
     `:2121` ("the nonzero vectors `f^ε` … of §7.10").
   - **Claim.** Each target needs only earlier ones.
   - **Witness.** §6.4 (`:1960`) needs §6.3 and §6.5 needs §6.4, yet §6.3 takes its setting from §6.5
     (it is stated in §6.4, `:1944–1946`). §7.10 (`:2244`) needs §§7.4, 7.5, which use `f^ε`, defined only
     in §7.10 (`:2215–2221`).
   - **Repair.** (a) Begin §6.3 with "Let `X` be the rank-three skew-Hermitian `B`-space of §1.6 with
     `U(X)` anisotropic over `F`, `G = GU_B(X)°`, and `τ` an irreducible unitary automorphic
     representation of `H_N^+`." and delete "In the anisotropic rank-three setting of §6.5"; §6.4 then
     begins "In the setting of §6.3, let `Π = θ(τ)` be nonzero and cuspidal." (b) Move the passage of
     §7.10 from "For each `ε ∈ {±1}^{Σ_∞}` let `f_i^ε = …`" to "Put `f^ε = f₁^ε ⊠ f₂^ε`." into §7.1 as a
     last paragraph headed "*The sign vectors.*", and write "the sign vectors `f^ε` of §7.1" in §§7.4,
     7.5 and 7.10 (§7.1's `*Needs:*` is unchanged; §§7.4, 7.5 already need §7.1 through §7.3 and
     directly).

5. **F05** (P3) symbols used without a definition

   - **Location.** `README.md:2380` ("`K`-type of highest weight `w(Λ + ρ) − ρ` by `λ μ^{−k′}`");
     `:1865` ("`⟨x, y⟩ = x*κiy`"); `:1923` ("image `R(W_v) ⊂ I_v(−3/2)`"); `:2059` ("For
     `g ∈ G(𝔸)^+`"); `:2356` ("`H^{2d}(Sh_K, V_k)[Π^S]`").
   - **Claim.** Every symbol of a target is defined in the roadmap.
   - **Witness.** `Λ` occurs only at `:2380` (and as an exterior power at `:376–377`); `ρ` is a
     representation everywhere else; `λ` is the weight of §8.2 at `:2300` and a character of `Z` at
     `:2381`. `κ`, `R(W_v)`, `G(𝔸)^+` and `[Π^S]` occur nowhere else with a definition.
   - **Repair.** §8.6: after "for some Kostant representative `w` of length `p`" add "where
     `Λ = (k_v/2 − 1, k_v/2 − 1, −k_v/2 + 1, −k_v/2 + 1)` is the weight called `λ` in §8.2 and
     `ρ_G = (3/2, 1/2, −1/2, −3/2)` the half-sum of positive roots of `𝔤𝔩₄`", write `w(Λ + ρ_G) − ρ_G`,
     and rename the character "`λ_Z`, the highest character of `Z` in `ρ′_{v,k}`,
     `λ_Z(t_α) = α^{2k_v−4}`" (IP23 lines 4036–4050). §6.1: "for a fixed `κ ∈ F^×` and a trace-zero
     `i ∈ E^×`". §6.3: "`R(W_v)`, the image in `I_v(−3/2)` of the Schwartz space of the Weil
     representation of the local dual pair under the doubling Schwartz map of
     gap:quaternionic-doubling-residue". §7.3: "`G(𝔸)^+ = {g ∈ G(𝔸) : ν(g) ∈ N(𝔸_E^×)}`". §8.5: "where
     `[Π^S]` is the `[I]`-part of §8.4 for `Π` and `V_k` the coefficient system written `Ṽ_ρ` there,
     on the unitary variety". Tested for §8.6 on its first Check: `w⁻¹ = (23)` gives
     `w(Λ + ρ_G) − ρ_G = ½(k_v − 2, −k_v, k_v, −k_v + 2)`, `τ_Z = α⁻² = λ_Z μ^{−(k_v−1)}`.

6. **F06** (P3) a Check of §6.2 is an instance the layer's standing hypothesis excludes

   - **Location.** `README.md:1910` ("For `B₁ = B₂` the algebra `B` splits and the statement is the
     classical `GO(4)` Shimizu lift."), against `:1857–1858` ("Throughout this layer … `B` a division
     quaternion algebra").
   - **Claim.** §6.2 covers `B₁ = B₂`.
   - **Witness.** `B₁ = B₂` gives `[B] = 2[B₁] = 0`, `B ≃ M₂(F)`, not a division algebra; §6.2 as scoped by
     the preamble does not state this case, while gap:quaternionic-shimizu-lift (`:479–481`) is stated
     for every `B = B₁·B₂`.
   - **Repair.** Replace the Check by: "For `B₁ = B₂` the algebra `B = M₂(F)` is split, outside the
     standing hypothesis of this layer; gap:quaternionic-shimizu-lift, stated for every `B = B₁·B₂`,
     is then the classical `GO(4)` Shimizu lift (MetaplecticAutomorphicForms §3.38). The division case
     begins at `B₁ ≄ B₂` (§0.4)."

7. **F07** (P3) the character step of the §0.2 route omits a hypothesis of the cited criterion

   - **Location.** `README.md:701–703` ("after a finite extension of coefficients splitting the torus
     the stalk is a sum of characters which are potentially crystalline by the character criterion of
     PadicHodgeTheory §3.6").
   - **Claim.** A coefficient field splitting the torus suffices for §3.6.
   - **Witness.** PadicHodgeTheory §3.6 (open head): "`E` containing all embeddings of `K`", as the
     contract at `:563–564` says. For the split torus `𝔾_m` and `K′ = ℚ_ℓ(√ℓ)` the character is the norm
     `∏_τ τ`, and `E = ℚ_ℓ` splits the torus without containing `K′`.
   - **Repair.** Write "after a finite extension of coefficients that splits the torus and contains
     every embedding of the local field `K′` of the special point". Tested on the witness: `E = K′`
     gives `ψ = ∏_τ τ^{−h_τ}` with `h_τ = −1` on an open subgroup of units, the form §3.6 treats.

One P2 and six P3 findings, all new (S01–S07). No P1. Fifteen of the sixteen round-1 findings are
repaired at this head and no repair introduced an error; the sixteenth (the arrangement finding of
pass b) was disputed by the repair and is not re-raised here (see "Round-1 findings at this head").
`Suggested.lean` is unchanged since round 1 and no Lean was run (the brief allows none); the
elaborated types were read from the worker's signature listing and compared with README §§1.3, 1.4, 1.7.

## Round-1 findings at this head

| Round-1 id | Status | Witness at `ff6a1d8` (`packages/HodgeClassesForJacquetLanglands/README.md`) |
| --- | --- | --- |
| a/F01, b/F12 (gap asks for what GL2 §R17.1.5 provides) | repaired | `:511–515` "`E` embeds in `B` as an `F`-algebra exactly when no place of `F` ramified in `B` splits in `E` … realization … and … classification … are GL2AutomorphicRepresentationsAndTransfer §R17.1.5, consumed from there"; §0.4 route `:895–904`; plan `needs` has the same single clause. Supplier head: §R17.1.5 names `existsQuaternionRamification_iff`, `nonempty_quaternionAlgEquiv_of_localSplitting`. |
| a/F02 (subquotients of de Rham) | repaired | `:575–579` gap ends at one-point rigidity, "subquotients … is §3.1 for `B = B_dR`, consumed from there"; `:2556–2557`, `:2568`. Supplier §3.1: "Subobjects and quotients of an admissible object are admissible." |
| a/F03, b/F08 (§7.10 Check miscount) | repaired | `:2233–2236` "there are `2² = 4` sign vectors … four nonzero pairings for one class; when `k_v = 2` … the four pairings are two up to scalars". Recomputed: `2^n = 4`, weights `±(2−2) = 0`. |
| a/F04 (Dependencies lines) | repaired | Layer 0 `:1013–1022` now has §R17.1.5, gap:vhs-hodge-decomposition, ClassicalAdicEtaleCohomology §8.2, PadicHodgeTheory §§3.1, 3.3, 3.6, 7.2 and its gap, `TauCeti.symPowerRep`; Layer 9 `:2596–2598` has §§3.1, 3.3, 4.4. I recomputed the union of the `*Needs:*` lines for all eleven layers: each Dependencies line contains it. |
| b/F01 (P1, Periods-I splitting) | repaired | `:479–489` gap now asks first for "a map `s̃_v` to `ℂ¹` on the group of pairs `(g, h)` … with `ν(g) = ν(h)`, trivialising the Weil cocycle"; `:456–460` "uses the Periods-I splitting without constructing it"; `:1860–1861`, `:1895–1896`, `:2096–2098`. Supplier §3.32a: only "the ratio `ζ=tilde s/s` is an automorphic character". |
| b/F02 (stable range) | repaired | `:491–497` gap:unitary-stable-range; §6.1 `:1873–1876`, `:1887`. Supplier §3.9 is orthogonal–symplectic, nonarchimedean; §3.16 gives the unitary conservation sum `2·1 + 2 = 4` used at the ramified places. |
| b/F03 (infinite central kernel) | repaired | `:666–676` "put `Γ̄_g = Γ_g/(Γ_g ∩ Z(ℚ))` … This effective-quotient descent … is part of this target; AutomorphicBundles §0.2 proves descent only along finite tame quotients"; contract `:352–357`; Check `:741–745` (`N(−ε⁴) = 1`). |
| b/F04 (real Weil operators) | repaired | `:1608–1615` states the four generator formulas and "Proving that these formulas give the Weil representation … is part of this target"; §2.5 replaced by §2.4c in `:1630`, `:1741`, `:447–450`. Formulas agree with IP23 lines 2124–2143; weight of `φ₀` recomputed (table). |
| b/F05 (arrangement follows IP23) | not repaired; disputed, not re-raised | Layers unchanged. The dispute's reason on order holds: the Dependencies lines force `1 → 2 → 3 → 4 → 5`, `3 → 6`, `5, 6 → 7 → 8 → 9 → 10` (`:1427`, `:1565`, `:1740`, `:1848`, `:1992`, `:2254`, `:2436`, `:2596`, `:2826`). The scopes of Layers 4, 6, 7 and 10 still equal IP23 §§8, 9, 10, 12. As in pass a of round 1 I do not hold this as a finding; the pairs are under "For the human reviewers". |
| b/F06 (`artinComparison`) | repaired | `:542–544` names §C6.3 (finite coefficients) and §C6.6 `adicArtinComparison`; `:686–687` "Artin's rational comparison … (ComplexComparisonPartII §C6.6)". |
| b/F07 (PadicHodgeTheory citations) | repaired, with a residue (S07) | `:699–705` routes through §3.6, §3.3, §3.1; `:708–712` uses ClassicalAdicEtaleCohomology §8.2. Supplier §3.6: "Equality only on an open subgroup … gives potential crystallinity"; the Huber comparison (3.7.2) is inside §8.2 of ClassicalAdicEtaleCohomology. |
| b/F09 (§7.9 Check) | repaired | `:2203–2209` "The lowering operator acts on functions as a derivation … `Y_c v_ℓ = (k − ℓ)v_{ℓ−2}/2`". Supplier §2.6 has that formula; `Y_c v_k = 0`. |
| b/F10 (`p₂,*` with coefficients) | repaired | `:987–990` "`p₂,*` is the transpose of `p₂^*` under the Poincaré duality with coefficients of §0.2 …; for constant coefficients this is the correspondence action of MotivesAndAlgebraicCycles §2.3". |
| b/F11 (title) | repaired | `:1` "# Roadmap: Hodge classes for the Jacquet–Langlands correspondence". |

## Adversarial table

`Suggested.lean` declarations (no `variable` block; every binder is in the signature).

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `IsExteriorStar` (def, real body) | `H = diag(a₁..a₄)`, `c = vol(e₁₂₃₄)`; wrong model `−L` | `vol(L e₁₂ ∧ e₁₂) = a₁a₂` forces `L e₁₂ = (a₁a₂/c)e₃₄`; `e₂₄∧e₁₃ = −e₁₂₃₄` forces `L e₁₃ = −(a₁a₃/c)e₂₄`; `−L` gives `−a₁a₂ ≠ a₁a₂` | determines `L`; equals IP23's `ψ⁻¹∘ι∘∧²φ` (IP23 lines 1152–1168) |
| `existsUnique_isExteriorStar` | `H = 0`; `σ` not surjective | `H = 0`: `L = 0`, unique by perfectness in degree `(2,2)`; existence: `u₁∧u₂ ↦ H u₁ ∧ H u₂` scales by `σ(c)` under `u₁ ↦ cu₁` | true as typed |
| `IsExteriorStar.comp_self` | diagonal Hermitian; general Gram `G` with `σ(G) = Gᵀ`; `H = 0` | diagonal: `σ(a₁a₂/c)(a₃a₄/c) = ∏a_i/(σ(c)c)`; general: coefficient of `e_M` in `L²e_I` is `(σ(c)c)⁻¹ Σ_K s(K)s(M) G[Kᶜ,I] G[K,Mᶜ]`, which by Laplace expansion is `det G` for `M = I` and `0` otherwise; `H = 0`: `0 = 0`; denominator nonzero (`vol` iso, `σ` injective) | true |
| `IsExteriorStar.map_similitude` | scalar `t`; `ν = 0`; `ν ∉` fixed field | `vol(L(⋀²g u) ∧ y) = ν² det[H(u_i, g⁻¹y_j)] = ν² det(g)⁻¹ vol(⋀²g(Lu) ∧ y)`; scalar: `ν = σ(t)t`, factor `σ(t)²t²/t⁴`, both sides `σ(t)²L`; `ν = 0` forces `H = 0` | true; agrees with IP23 line 1267 |

README targets (all 75 read; rows for what was recomputed this pass).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.2 definite Check, `:727–729` | `F = ℚ`, `Ram(B) = {∞, 2}` | `G^ad(ℝ) = SO(3)`: SV3 fails; no supplier target | S01 |
| §0.2 component Check, `:750–751` | `Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)` | `ε² ≡ −√2`, `ε⁴ ≡ −1 mod 3`; `#𝔽₉^×/⟨ε²⟩ = 2`, `#𝔽₉^×/⟨ε⟩ = 1` | S02 |
| §0.2 Checks on `ℚ(√2)`, `ℚ(i)`, `ℚ(∛2)` | units, norms | `N(−ε⁴) = 1`; translation `4 log ε − 4 log|ε′| = 8 log ε`; `(x+1)³ = 2` gives `x³+3x²+3x−1`, norm `1`; type `(−1,−1)` for `N` | as stated |
| §0.3 degree formula and Checks | `K(9) ⊂ K(3)` | `#(O/9)^× = 72`, index `72/8 = 9`, `−ε⁴ ≡ 1 − 3√2 mod 9` of order `3`, degree `9/3 = 3`; `K₂ ∩ Z(ℚ)⁻ ⊂ K₁(K₂ ∩ Z(ℚ))` | as stated |
| §0.4 route | parity of `S` | `|Ram_f(B₁)| ≡ |Ram_f(B₂)| ≡ n − d mod 2`, so `|S|` even | as stated |
| §§0.5–0.7 | weights `(2,4)`, `d = 2` | `(1,0)/(0,1) + (2,−1)/(−1,2)`: `(3,−1),(2,0),(0,2),(−1,3)`; `d + d − 2d = 0` | as stated |
| §§1.1, 1.3, 1.5, Examples of Layers 1–2 | `c = −1`; `diag(1,−J₁,1,−J₂)`; `diag(i,1,1,1)` | six images `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂`; `J₁e₃₄, J₂e₁₂, e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃`; `b(Le₁₂,e₃₄) = i·σ(−i) = −1`, `b(Le₃₄,e₁₂) = 1` | as stated |
| §§2.1, 2.3, 2.4, 2.6 | `β = (1+2i)+j·i`, `α = 2−i`, `J = −3` | `Nrd = 8`, `8/5`, `8/(3−4i) = (24+32i)/25`; `L₁e₁ = −a₁e₂`, `L₁e₂ = a₂e₁`; `5+5−1−1 = 7+2−1`; Gram on `W`: `1, −J₁, −J₂, J₁J₂` | as stated |
| §§3.2–3.5 | centre; `y = (1,1,i,i)`; `(2,0,0)` | `(N²,N²,N²)`; `(1,1,−1)`; `(1,−1,1,−1)` and back `(2,0,0)`; `2ρ(𝔲∩𝔭) = (2,0,0)`, lowest `K`-type `(k,0,0)` | as stated |
| §4.2 generator formulas (repaired text) | `φ₀`, `q = 0`; `a < 0` | `(n₊ − n₋)φ₀ = (i/2)φ₀` per positive coordinate, so `ω(w)φ₀ = e^{−iπp/4}φ₀ = i^{−p/2}φ₀`, the stated constant; `(−1)^{m/2} = (−1)^{(p−q)/2}` since `q` is even | as stated |
| §4.2 Checks | `N`; `z₁²` | `(∂₁+i∂₂)(w^Nφ₀) = −2πw^{N+1}φ₀`, so `2^N w^Nφ₀`; `(2πi)²(4x₁² − π⁻¹)φ₀` | as stated |
| §4.3 Check | four wedge pairings | `+1, −1, εi, εi`, sum `(z₁+εiz₂)²` | as stated |
| §4.4 Check | `e₁²`, signature `(2,2)` | contraction of the trace element `4`; `e₁² − (e₁²+e₂²−e₅²−e₆²)/4` | as stated |
| §§5.2–5.3 | `T`, `Z → T`, `j` | `𝔾_m²/{(t,t⁻¹)} ≃ 𝔾_m` by the product, `T ≃ Res_{E/F}𝔾_m`; kernel `([−1,1],1)`; `η_T(j(s)) = η(s⁻¹) = 1` | as stated |
| §6.1 route | `U(1)` towers | conservation `2·1 + 2 = 4`: both first occurrences `2` when `χ_v ≠ 1` (IP23 lines 2436–2444) | as stated |
| §6.3, gap text | `s = 3/2` | `b/a = ζ_v(4)ζ_v(6)ζ_v(8)/(ζ_v(3)ζ_v(1)ζ_v(−1))`; `δ_P = |Nrd|⁵` | S03 |
| §§7.2, 7.3, 7.7 | `m = 3`; `p(z,α)`; `χ_v` of order two | `ξ_E³ξ_E = 1`; `N(z⁻¹α) = 1`; `η_v|_{E_v¹} = χ_v² = 1` | as stated |
| §8.1 | Asai of a base change; dihedral case | `Sym²σ ⊕ ∧²σ·ξ_E = Sym²σ ⊕ 1`; `χ^σ = χ⁻¹`, cuspidal iff `χ² ≠ 1` | as stated |
| §§8.6–8.7 | `(1,1)`, `(0,4)` | `λ_Z − k′μ`: `2k−4 − 2(k−1) = −2`; types `(k−1,k−1)`, `(0,2k)`, after shift `(1,1)`, `(2−k,k+2)` | as stated; notation S05 |
| §9.1 | `θ̂²`; dual torus | `ν·det g·det θ₄(g) = ν`; `Σ(e₀ − e_{5−i})⊗s_i` gives `(s₄⁻¹,…,s₁⁻¹; ν̂∏s_i)`; `34`, `33` | as stated |
| §§9.2–9.4 | `d = 1` | `⋀²W₋₁ ⊗ |·|⁻² = |·|⁻¹`, `⋀²W₁ ⊗ |·|⁻² = |·|⁻³`; `D_cris(ℚ_ℓ(1))^{φ=1} = 0`; coordinate subextensions of `W` | as stated |
| §§10.5–10.8 | `j(s)`; `d = 0` | `t₁t₂ = s² = N(s)`; rank one, type `(0,0)`; a nonzero `L`-polynomial is nonzero somewhere on `ℚ^N` | as stated (S01 for the objects at `d = 0`) |

## Dependency check

```
depcheck: 242 roadmaps, 2280 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the roadmap is at line 290 of the merge order. The pull request's
diff against main touches only `packages/HodgeClassesForJacquetLanglands/` (11 files).

## Verified sound

- **Declarations read:** 4 of 4 (1 definition with a real body, 3 theorems). One `import Mathlib`,
  no `set_option`, no sorry'd data, `theorem` only, one module docstring, namespace
  `TauCetiRoadmap.HodgeClassesForJacquetLanglands`. The worker's elaborated signatures show no lost
  binder; each agrees with README §§1.3, 1.4, 1.7 (any field, any ring endomorphism, any sesquilinear
  form). The four names are in the README and no other backticked name of this roadmap is.
- **Headlines and padding:** IP23 Theorems 1, 3.2, 12.4 and Propositions 5.3, 5.6–5.7, 8.1–8.2, 9.5,
  10.1, 11.6, Remark 11.10. Statable and stated: 5.3 and the point-level identity of 5.6; the rest are
  named in the module docstring with their missing carriers. One-tactic probe: none of the three
  theorems is a library lemma (`instIsPerfPairWedgePairing` and `pairingDual_ιMulti_ιMulti` are
  inputs). No padding.
- **Targets read:** 75 of 75, every line of the README (2929 lines). Every section has a locator, a
  `*Needs:*` line and at least three Checks.
- **Checks tested:** about 60 recomputed (table); one false as written (S02), one outside its
  section's hypothesis (S06).
- **Locators verified this pass (18, all IP23, by line):** Theorem 3.2 (p. 20, line 839), §3.2 (p. 19,
  lines 802–828), Proposition 5.1 (p. 25), Definition 5.2 and Proposition 5.3 (p. 28), §5.2 (pp.
  27–28), Lemma 5.4 (p. 29), Proposition 5.6 and (5.10) (p. 30), Proposition 5.7 (p. 31), §4.1 (p. 20),
  §8.3 (p. 50), §9.2 and Lemma 9.1 with its proof (pp. 56–57), Lemma 9.2 (p. 58), §9.5 (p. 62),
  Lemma 11.1 (p. 80), proof of Proposition 11.6 (pp. 87–88), Propositions 11.8–11.9 and Remark 11.10
  (p. 90), §A.10 (p. 112), Proposition A.14 (p. 113).
- **Sibling citations checked this pass (at the open heads, text read):** PadicHodgeTheory §§3.1, 3.3,
  3.6, 7.2; ClassicalAdicEtaleCohomology §8.2; GL2AutomorphicRepresentationsAndTransfer §R17.1.5 with
  its two names; MetaplecticAutomorphicForms §§0.15–0.17, 2.4b, 2.4c, 2.5, 3.3, 3.9, 3.16, 3.32a;
  AutomorphicBundles §§0.1, 0.2, 3.4, 3.5, 3.7, 3.8 (headings) and §0.2 (text);
  AutomorphicFormsOnReductiveGroups §§2.6, 7.4–7.6; ShimuraVarieties §§6.7, 8.1, 8.6; ShimuraData (datum
  definition); ArithmeticLocallySymmetricSpaces §§ALS.0.4, 0.6, 3.6, 5b.1, 5b.4 on main. 34 sections,
  all present with the hypotheses the README attributes to them. The worker's citation listing has no
  unresolved cross-roadmap citation; its 8 Lean-name leads are ShimuraVarieties' names and this
  roadmap's own.
- **Pinned declarations and files checked (19):** `exteriorPower.wedge`, `wedgePairing` (both
  `abbrev`, with `vol` and `hkl : k + l = finrank`), `instIsPerfPairWedgePairing` (needs
  `Module.Finite`, `Module.Free`), `Module.Basis.topVector`, `isUnit_apply_topVector`,
  `exteriorPower.map_apply_ιMulti`, `TauCeti.symPowerRep`
  (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`), and the fifteen file paths
  the contracts name (nine in Tau Ceti, six in Mathlib), all present at the pins.
- **Gaps:** nine slugs in `design/plan.json`, the same nine under "Exact supplier contracts", each
  with a named supplier and section. Eight are not raised; S03 corrects a normalisation inside one.
- **Ownership:** the worker's overlap listing has no shared roadmap, second copy or dropped id.
  Searched by object at the open heads and on main for the definite case of §0.2: the owner is
  AutomorphicFormsOnReductiveGroups §§7.4–7.6, earlier in the merge order and already a supplier
  (S01).
  No declaration of `Suggested.lean` has the fully qualified name of a declaration of a roadmap read.
- **Policy:** no pull-request number, process word, `lemma` declaration, `set_option` or machine path
  in the README, the Lean file or `sources.toml` (four entries, all certified).

## Not verifiable

- No Lean elaboration was run; the elaborated types are those the worker recorded at this head.
- Mil17, Wal85 and FM06 were not reopened this pass; their locators stand on the round-1
  verifications. The round-1 source issues other than the one below were not re-derived.
- The analytic statements of Layers 6–7 and the Kottwitz computation of §9.2 were checked for
  hypotheses, weights and locators, not re-derived.
- The nine declared gaps are absent from their suppliers, as expected; their content was read for
  precision only. gap:shimura-matsushima-comparison and gap:quaternionic-shimizu-lift each ask for
  several statements of one theory; I did not raise that.
- Ownership against open pull requests was checked through the `roadmaps` tool for the suppliers
  named above, not for all 236 listed checkouts.

Source independence: 10 passages compared with 1 source (IP23: Theorem 1 and its introduction, §3.2, Theorem 3.2, §4.1, §5.2 with Definition 5.2, §8.3, §9.2 with Lemma 9.1 and its proof, §9.5, proof of Proposition 11.6, Remark 11.10), none shared beyond formulas, names and hypothesis lists; largest share IP23, 123 of the 142 README lines carrying a source id; contents compared with IP23: the layer order is forced by the Dependencies lines and is not one to one (Layer 0 ↔ §§2–3, Layers 1–2 ↔ §5, Layer 3 ↔ §§6–7, Layer 4 ↔ §8, Layer 5 ↔ §§4.2–4.3 moved after §8, Layer 6 ↔ §9, Layer 7 ↔ §10, Layers 8–9 ↔ §11, Layer 10 ↔ §12), while Layers 4, 6, 7 and 10 have the scope of one source section each; Mil17, Wal85 and FM06 not reopened this pass.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19: the source says the isotypic component of the cohomology of the quaternionic Shimura variety is concentrated in degree `2d`; it should be degree `d`, the dimension of the variety; affects nothing.

## For the human reviewers

- **Scope.** The roadmap plans the main theorem of one refereed article (IP23, Forum of Mathematics, Pi, 2023): 123 of the 142 `README.md` lines carrying a source id cite it.
- **Scope.** Layers 4, 6, 7 and 10 have the scope of IP23 §§8, 9, 10 and 12 (`README.md:1567`, `:1851`, `:1997`, `:2600`); round 1 pass b raised this, the repair disputed it, and the layer order is forced by the Dependencies lines.
- **Scope.** The all-`ℓ` end theorem (`README.md:2766–2776`) is conditional on `K_{2d}(Π)`, a hypothesis the roadmap does not prove, narrower than the conjecture assumed in IP23, Theorem 3.2(ii).
- **Not tested.** Mil17, Wal85 and FM06 (19 of the 142 lines) were not reopened this pass; their tables of contents were not compared with the README.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ff6a1d89d5603f424f7c434e8704c7468cb83071", "job": "RT-HodgeClassesForJacquetLanglands~2a", "model": "fable", "worker": "chris-x89"} -->
