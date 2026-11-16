<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6907103271 -->
Red team round 2 pass a (claude) of 6d0579c

Verdict: needs_changes

1. **F01** (P1) §9.1 needs the compatibility of base change with endoscopic transfer at the bad primes of `Spl_{F/F⁺}`, which no cited section states

   **Location.** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:430` (§9.1): "Matching at the other places uses the unramified transfers of §6.8 away from `S′`, the base-change transfer of §6.9 at `S′_fin ⊂ Spl_{F/F⁺}`"; `:432` (*Needs*); `:82` (contract for §§6.6–6.10).

   **Claim.** For arbitrary `f_{n,S′_fin∖{p}} ∈ C_c^∞(𝒢_n(𝔸_{S′_fin∖{p}}))`, Shin's endoscopic function `φ^n⃗` has a base-change matching `f^n⃗`, by EndoscopicTransferAndUnitaryTraceComparison §§6.8–6.9.

   **Witness.** At the supplier's head: §6.8 "*Hypotheses.* `v ∉ S` for the unramified statements `(a),(b)`"; §6.9(a) "if `v` splits in `F₀`"; §6.14 only for `φ_v` supported near `1`. Every Case 2 `S` contains a prime ramified in `𝒦`, which is not split in `𝒦`.

   The statement used is [Shin11] §4.2 Case 2 (`v ∈ Spl_{F/F⁺}`, split in `𝒦` or not; p. 1678, Shin11 line 1474) with the diagram (4.19) and identity (4.20) (p. 1683, Shin11 lines 1685–1710); [CS17] cites exactly these (CS17 lines 3522–3523 and 3579–3582). The supplier treats the non-split bad places by small support instead (its §6.14, and "small level at `S_pf` as in §6.14" in its §6.25), which does not give §9.1 for arbitrary test functions, and §9.3, §9.6 and the Case 2 parts of §§11.4–11.8 inherit the gap.

   **Repair** (tested on the instance: `v` ramified in `𝒦`, `v ∈ S ⊂ Spl_{F/F⁺}`; the new contract is stated for exactly such `v`).

   1. Add to the top-level `gaps` of `design/plan.json`: slug `split-place-base-change-compatibility`, supplier `EndoscopicTransferAndUnitaryTraceComparison`, section `§6.9`, and the `needs` sentence of item 2.
   2. Add under "From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison":

      > What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:split-place-base-change-compatibility): for `F = F⁺𝒦`, every `n⃗` and every rational prime `v ∈ Spl_{F/F⁺}`, split in `𝒦` or not, a transfer `BC*_n⃗ : C_c^∞(𝒢_n⃗(ℚ_v)) → C_c^∞(G_n⃗(ℚ_v))` with `tr π_v(BC*_n⃗ f_v) = tr(BC_n⃗(π_v)(f_v) ∘ A_θ)` for every irreducible `π_v`, such that for `n₁ + n₂ = n`, every `f_v ∈ C_c^∞(𝒢_n(ℚ_v))` and every irreducible `π_v` of `G_{n₁,n₂}(ℚ_v)`, `tr π_v(BC*_{n₁,n₂}(ζ̃*f_v)) = tr π_v(η̃*(BC*_n f_v))`, where `η̃*` is the constant-term transfer twisted by `χ_ϖ`, a Langlands–Shelstad transfer along `η̃_{n₁,n₂}` ([Shin11] §3.4, Cases 2–3, pp. 1668–1669, Shin11 lines 1046–1108; §4.2, Case 2, p. 1678, Shin11 line 1474; (4.19)–(4.20), p. 1683, Shin11 lines 1685–1710). §6.9(a) there states the character identity only at `v` split in `𝒦`, §6.8(a),(b) the compatibility only at unramified `v`, and §6.14 only for functions of small support. It is needed by §9.1 at the primes of `S′_fin ∖ {p}` not split in `𝒦`, which always include the primes ramified in `𝒦`, and through §9.1 by §§9.3, 9.6 and the Case 2 parts of §§11.4–11.8.

   3. In §9.1 replace the quoted sentence by: "Matching at the other places uses the unramified transfers of §6.8 away from `S′`; at `v ∈ S′_fin ∖ {p} ⊂ Spl_{F/F⁺}` put `f^n⃗_v = ζ̃*(f_{n,v})` (§6.8(c)), whose base-change transfer has the same traces as `φ^n⃗_v` (gap:split-place-base-change-compatibility; at `v` split in `𝒦`, §6.9(a)); and surjectivity of `BC^*` at the split prime `p`."
   4. Add "EndoscopicTransferAndUnitaryTraceComparison §6.9 (gap:split-place-base-change-compatibility)" to the *Needs* of §9.1 and to the Layer 9 Dependencies; in the scope paragraph (line 22) "Three supplier statements" becomes "Four", with one sentence naming this one; in §§11.5 and 11.6 name the gap beside the two Case 2 gaps already named.
   5. `sources.toml`, entry `Shin11`: extend `locator` by "section 3.4, Cases 2-3, pp. 1668-1669; section 4.2, Case 2, p. 1678; (4.19)-(4.20), p. 1683" and `cited_for` by §9.1.

2. **F02** (P3) §6.8 of the supplier excludes `v = ℓ`, and §9.1 uses it there

   **Location.** `README.md:38`: "we put `S′ = S ∪ {∞, p} ∪ Ram(ϖ)`"; `:424`: "an unramified `(f_n)^{S′} ∈ H^ur(𝒢_n(𝔸^{S′}))`"; `:430`: "the unramified transfers of §6.8 away from `S′`".

   **Claim.** §6.8 gives the unramified transfers at every `v ∉ S′`.

   **Witness.** Supplier §6.8, first sentence: "let `v` be a place of `ℚ` outside a finite set `S` containing `∞, p, ℓ` and the primes where `F` or `ϖ` ramifies". For `ℓ ∉ S ∪ Ram(ϖ)`, `ℓ ∉ S′` and §9.1 needs `v = ℓ`. [CS17]'s `S` omits `ℓ` (CS17 lines 3514–3516).

   `ℓ` cannot be moved into `S′`: that would need `ℓ ∈ Spl_{F/F⁺}` (take `ℓ` inert in `𝒦` and unramified in `F`).

   **Repair.** Add to `plan.json` and to the same supplier subsection: "What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:unramified-transfer-at-the-coefficient-prime): the statements (a) and (b) of §6.8 at `v = ℓ`, when `F` and `ϖ` are unramified at `ℓ` and `ℓ ≠ p`. §6.8 states them only outside a set containing `ℓ`; the Satake transforms involved have complex coefficients and do not involve `ℓ`. It is needed by §9.1 when `ℓ ∉ S′`." Cite it in the *Needs* of §9.1.

3. **F03** (P3) §11.2(c): a hyperspecial `K_q` need not stabilize a self-dual lattice

   **Location.** `README.md:620`: "At each `q ∉ S` the datum is unramified and the hyperspecial `K_q` is the stabilizer of a self-dual lattice (IgusaVarietiesAndTorsionConcentration §0.11)".

   **Claim.** Every hyperspecial `K_q` lies in `GSp(Λ ⊗ ℤ_q)` for a self-dual `Λ ⊗ ℤ_q`.

   **Witness.** `n = 2`, `q` inert in `F = 𝒦`, `V_q` with isotropic basis `e, f`, `h(e, f) = 1`, `M₀ = ⟨e, f⟩` self-dual, `g = diag(q, 1)` of similitude `q`. `gK₀g⁻¹` is hyperspecial; its stable lattices are `q^k gM₀`, with dual `q^{−1−2k} gM₀ ≠ q^k gM₀`.

   §8.1 and [CS17] (CS17 lines 4377–4378) allow any hyperspecial `K_q`; the parent's §0.11 only says that a self-dual lattice gives a hyperspecial level. With two places `u₁, u₂` of `F⁺` above `q` inert in `F` and lattices of opposite parity, no `ℚ_q^×`-multiple of the form helps either, so rescaling the form is not a repair.

   **Repair.** Replace the sentence and the choice of `Λ` by:

   > At each `q ∉ S` the hyperspecial `K_q` is the stabilizer of a lattice `M_q = ⊕_u M_u` over `O_B ⊗ ℤ_q`, summed over the places `u` of `F⁺` above `q`, with dual `M_u^∨ = q^{a_u} M_u` for integers `a_u`; at almost every `q` it is the completion of a fixed lattice and every `a_u = 0`. Use the Siegel embedding `g ↦ (g, g)` of `G` into `GSp(V ⊕ V, ⟨·,·⟩ ⊕ ⟨·,·⟩)`, which sends `h` to `h ⊕ h` and so respects the Shimura data. `V ⊕ V = V ⊗_F F²` with the form `⟨·,·⟩ ⊗ (x̄₁y₁ + x̄₂y₂)`. At `u` inert in `F` the plane `(F_w², x̄₁y₁ + x̄₂y₂)` is isotropic, since `−1` is a norm from the unramified `F_w`; in an isotropic basis `e, f` with pairing `1` the lattice `R_u = O_{F_w}e ⊕ q^{a_u}O_{F_w}f` has dual `q^{−a_u}R_u`, so `M_u ⊗ R_u` is self-dual. At `u` split in `F`, `M_u = M_w ⊕ M_{w^c}` and `q^iM_w ⊕ q^jM_{w^c}` is self-dual for `i + j = a_u`; tensor it with `O²`. Then `Λ_q = ⊕_u M_u ⊗ R_u` is self-dual and `K_q`-stable. These lattices, with arbitrary self-dual lattices at `q ∈ S`, give a self-dual `ℤ`-lattice `Λ ⊂ V ⊕ V` and `K_q ⊂ GSp(Λ ⊗ ℤ_q)` for `q ∉ S`.

   The rest of (c) is unchanged, with `GSp(Λ ⊗ ℚ) ≅ GSp_{4g}`. Tested on the witness: `gM₀ = ⟨qe, f⟩` has dual `q⁻¹gM₀`, so `a = −1`, `R = Oe ⊕ q⁻¹Of` has dual `qR`, and `gM₀ ⊗ R` has dual `q⁻¹ · q` times itself. The mixed case (`a_{u₁}` even, `a_{u₂}` odd) is covered place by place. Add the witness as a Layer 11 Example.

4. **F04** (P3) the Iwahori example of Layer 11 is false for `n = 1`

   **Location.** `README.md:714`: "Take a neat `K` whose component at some `q₁ ∈ S` is a pro-`q₁` Iwahori subgroup … For no `N ≥ 3` is `K` contained in the principal congruence subgroup `Γ(N)` of a Siegel embedding."

   **Witness.** `n = 1`, `B = F = 𝒦 = ℚ(i)`, `q₁ = 5 ∈ S`: `G(ℚ_5) = (ℚ_5^×)²`, the pro-`5` subgroup is `(1 + 5ℤ_5)²`, there are no unipotent entries, and `K ⊂ Γ(5)` for the lattice `ℤ[i]`, with `N = 5 ≥ 3`.

   **Repair.** Insert "of rank `n ≥ 2`" after "Take a neat `K`", and add: "For `n = 1` the group is a torus, the pro-`q₁` subgroup of `G(ℚ_{q₁})` is `1 + q₁O`, and `K ⊂ Γ(q₁)`." For `n ≥ 2` the claim was recomputed for an arbitrary lattice: if `K_{q₁} ⊂ 1 + q₁End(Λ)` then the same holds for the lattice `Λ′` spanned by the Iwahori order, a member `Λ_j` of the standard chain, on whose reduction `Λ_j/ϖΛ_j` the pro-`q₁` Iwahori acts through a nontrivial unipotent group.

5. **F05** (P3) `ι_p` has the opposite direction in the supplier cited for the local decomposition

   **Location.** `README.md:34`: "`ι_p : ℚ̄_p ≅ ℂ` is compatible with a chosen prime `𝔭 | p` of `E`"; `:243`: "(PELModuli §M0.27; IgusaVarietiesAndTorsionConcentration §0.11)".

   **Witness.** PELModuli §M0.27 at its head: "a fixed `ι_p : ℂ ≅ ℚ̄_p` (so that `Σ_∞` is also the set of `p`-adic embeddings)". With that `ι_p` the composite `ι_p ∘ τ` is defined, and the README's remark that it "is not defined" (lines 34, 262) reads as false.

   **Repair.** Add to the Conventions after the definition of `S_i`: "PELModuli §M0.27 fixes the inverse isomorphism `ℂ ≅ ℚ̄_p`; its `ι_p` is `ι_p⁻¹` here, and its `ι_p ∘ τ` is our `ι_p⁻¹ ∘ τ`." Two-term witness for the Check of §8.3: for `F = ℚ(i)`, `p = 5`, `τ(i) = i`, the prime induced by `ι_p⁻¹ ∘ τ` is `(2 + i)` or `(2 − i)` according to whether `ι_p⁻¹(i) ≡ 3` or `2` modulo `5`.

One P1 (an unowned prerequisite of §9.1) and four P3. No finding is re-raised from a repair report (none was marked `not actionable in this package`).

## Round 1 findings: state at this head

| Id | State | Witness at `6d0579c` (`packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md`) |
|---|---|---|
| 1a/F01 (P2) `u` not recorded | repaired | line 335: "there is a place `u` of `𝒦` above `p` (`p = uu^c`) such that, for an `ι_p` compatible with `𝔭`, the following holds at every prime `𝔭_i` of `F` above `u`"; "through the same `u`" at lines 295, 346, 670, 701; Check at line 356. Recomputed: `{1,2,4}` mod 11 has ordered ratios `{2,4,6,3}`, `7` absent; `{1,1,1}` has ratio `1`. CS17 lines 3679 and 4409–4410 agree. |
| 1a/F02 (P3) `S′` in Case 1 | repaired | line 637: "In Case 1 put `S′ = S ∪ {∞, p}`, so that `S′_fin = S ∪ {p}`, `𝕋^{S′_fin} = 𝕋^{S∪{p}}`". Consistent with §11.5 step 3 (line 656). |
| 1a/F03 (P3) "Theorem 1.1(1)/(2)" | repaired | line 650: "Theorem 1.1, first assertion, and Remark 1.2"; line 736: "the second assertion of [CS17] Theorem 1.1 (CS17 lines 92–95)"; `Suggested.lean` line 63. `1.1(` occurs nowhere in either file. |
| 1a/F04 (P3) AL.3 | repaired | lines 142, 449, 451, 498 read "AL.3.7.2 «Strong multiplicity one for isobaric sums»"; the heading exists at the supplier's head. |
| 1a/F05 = 1b/F02 (P3) §6.23/§6.25 edges | repaired | line 510 (§10.1 *Needs*) has no `6.23`; line 551 has "§6.8" only; line 549 calls §§6.23, 6.25 "special cases, not steps of this route"; line 591 lists neither. |
| 1b/F01 (P2) small level | repaired, with two new defects in the added text | §11.2(c) at lines 616–620; §§11.3–11.4 state the small level (lines 626, 644); §§11.5–11.6 pass to `K_N` (lines 654, 670). The construction of `K_N`, its normality, `(K_N)_q = K_q` off `S` and the localized Hochschild–Serre argument were recomputed and hold. New: S03 (a false step in the lattice choice) and S04 (the Iwahori example fails for `n = 1`). |

## Verified sound

### Suggested.lean: declarations, context and values

No `variable` or `include` block; every binder is in each signature. The elaborated types of `scratch/signatures.md` were compared with README §§8.7–8.8; nothing changed. No Lean was elaborated in this pass (none is permitted).

| Declaration (line; section) | Binders | Instances and values | Result |
|---|---|---|---|
| `IsStrongGenericAt` (47; before Layer 8) | `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n}` | `n = 0`: empty product, predicate is `v` maximal, `ℓ ∉ v`, inertia killed (trivially, `GL_0` trivial). `n = 1`: no pair `i ≠ j`. `v = ⊥`: not maximal. `Q = ⊥`: lies over `⊥` only. `q_v = 7`, `ℓ = 11`: `{3,3}` ratio `1` fails; `{1,2}` ratios `2, 6` pass; `{1,7}` ratio `7` fails. `Ideal.inertia` is an `abbrev` for the `toAddSubgroup.inertia` used (pinned `Mathlib/RingTheory/Ideal/Defs.lean:154`); `IsArithFrobAt` is the group-action form (pinned `Mathlib/RingTheory/Frobenius.lean:184`). | equals README §8.7 and CS17 Definition 1.9 |
| `IsCompletelySplitStrongGenericPrime` (66) | same | `F = ℚ(i)`: `p = 5` gives `ncard = 2 = [F:ℚ]`; `p = 3` and `p = 2` give `1`. `p = ℓ`: fails through `ℓ ∉ v`. Against the sibling `FiniteModelDecomposedGenericPrime` (read at its head): same shape, ratio `p` only; `{3,3}` at `p = 7`, `ℓ = 11` satisfies the sibling's (`21 ≡ 10 ≠ 3`) and not this one. | equals README; strictly stronger than the sibling's, as line 11 says |
| `infinite_setOf_isCompletelySplitStrongGenericPrime` (80; Layer 8) | same | Frobenius elements above `p` in the Galois closure `L̃` of `L_r(ζ_ℓ)` are the conjugates of one `σ₀ ∈ Gal(L̃/F̃)`; the same set for `p₀`; `p ≡ p₀ (ℓ)`; inertia of `L/F` above `p` lies in `Gal(L/L_r) = ker r` once `p` is unramified in `L_r`. `n = 0`, `F = ℚ`, `L` ramified at `p₀` with `r` trivial on inertia: all covered. | true; not one tactic (Chebotarev is not in the pinned Mathlib) |
| `infinite_setOf_isStrongGenericAt_degree_one` (92; Layer 8) | same | Class of a Frobenius at `v₀` in `Gal(L_r(ζ_ℓ)/F)` (well defined: `v₀ ∤ ℓ`, `r` kills inertia) fixes `r(Frob_v)` up to conjugacy and `q_v` mod `ℓ`; degree-one primes have density one in the class; finitely many ramify in `L`. | true |

Headline theorems of the README: Theorem 6.3.1(1) (§11.5), Theorem 6.3.1(2) (§11.6), Theorem 1.1 (§11.7), Remarks 1.3 and 1.7.1 (§11.8), Theorem 5.5.7 (§9.6), Corollary 5.6.3 (§10.6). None is statable at the pins (no PEL moduli, étale cohomology with Hecke action, Igusa varieties, `B(G, μ⁻¹)`, adelic Grothendieck groups); each is named in the module docstring with what it lacks, and so is the auxiliary-pair condition. Padding probe: the two definitions are used by both theorems; neither theorem follows from one library lemma or from the sibling's theorem (weaker predicate). No padding.

### README targets: values computed

| Target | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions, `d_b = d` | `S_i = {τ, τ′}`, `(1,1)`, `(2,0)` | `⟨2ρ, ((0,−1),(−1,−1))⟩ = 1 = ⟨2ρ, ((−½,−1),(−½,−1))⟩`; `⟨2ρ, (1^p, 0^q)⟩ = p(n−p)` | holds |
| Conventions, `e` and `K_∞` | `n = 1`; `GU(1,1)`; some `p_τ ≠ q_τ` | `ν < 0` swaps `(p_τ, q_τ)`: `e = 1` unless all `p_τ = q_τ`, then `e = 2`; `sgn ν · ω_f ∘ ν` trivial on `G^{(a)}(ℚ)` | holds |
| Conventions, integral localization | `ℤ[T]/(T⁴−1)`, `ℓ = 5` | `2² ≡ −1`; `T + 2 ≡ 4 ∉ 𝔪`, acts by `2 − i ∈ 5ℤ_5 ∖ 0` on the `−i`-line | `ℤ_5 ⊕ ℚ_5`, as stated |
| §8.1 | `[F⁺:ℚ] = 2`, `n = 3`, `(1,2)`, `(0,3)`; `n = 1`; quaternion datum at `5`; `(1,2)` at every `τ` | `d = 2` (all four embeddings: `4`); `G^ad = 1`; `B = D ⊗ ℚ(i)` has index 2 at both places over `5 = (2+i)(2−i)`; rank-6 quadratic form isotropic at finite places | holds |
| §8.2 | Case 1; Case 2 anisotropic | `End_B(V) = B^op` division (PELModuli §M2.11 read); no rational parabolic, no cusp label | holds |
| §8.3(5) | same `S_i` | bound `μ_{i,τ} + z`; `κ = −3` against `−1`; `v(det p) = 2` | holds |
| §8.4 | `n = 1, 2`; general `i` | `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; `deg T_{1,v} = q+1`, `deg T_{2,v} = 1` | holds |
| §8.5(1)–(4) | `n = 1`; `q = 7`, `ℓ = 11`, roots `{1,2}`, `{3,6}`; `deg` at `q = 5`, `ℓ = 3`; `𝔽_9` | `7⁻¹ = 8`, `T_1 ≡ 3`, `T_2 ≡ 5`; `5⁻¹ = 9`, dual `X² − 5X + 8`, roots `{7, 9}`; `{3,6} ↦ {6,3}`; `X² − 3X + 7` has roots `{4,10}`; `X² − 6X + 5`: mod 5 roots `{0,1}`, mod 3 roots `{1,2} ↦ {2,1}`; `a⁻¹ = a³ = −a`; twist `λ⁻¹(q⁻¹)^{1−n} = q^{n−1}λ⁻¹` | holds |
| §8.6 | `d = 0`; `𝔪 ∌ ℓ`; residue characteristic 0 | both sides zero on `ℓ^r`-torsion; `ι(ℓ) = ℓ` | holds |
| §8.7 | witness `1 ⊕ χ ⊕ χ²`; two `ι_p`; `n = 1` | as in the table above; `2` has order 10 mod 11; a `χ` of conductor a completely split prime exists, so `S ⊂ Spl_{F/F⁺}` is kept | holds |
| §8.8(a),(b) | degree-one `v`; definite at all but one place | `f(v) = 1`, `p ∉ S` unramified gives `p` split in `𝒦`; `Aut(ℂ)` moves `ι_p⁻¹ ∘ τ₀` to any place; `τ₀c ∉ ⋃S_i` | holds |
| §8.9 | inert `p`, `(2,0)`, `(0,2)`; `𝔪_2`, `ℓ = 3` | average `(−½, −½)`, class of `p⁻¹` over `F_𝔭`, `J = Res GL_2`; `ℤ_3 ⊗ ℤ_(2) = ℚ_3` | holds |
| §9.1 | `v` ramified in `𝒦` | supplier §6.9(a) needs `v` split in `𝒦` | **S01**, **S02** |
| §9.2 | `GL_2`, `D^×` | `LJ(Ind) = 0`, `LJ(St) = 1`, `LJ(1) = −1` (supplier §10.32 read) | holds |
| §9.3 | coefficients `1, −1` | total zero, (2) silent | holds, given S01 |
| §9.4, §10.5 | trivial representation of `GL_2`, `q = 7` | `√7·√7 = 7`, `√7/√7 = 1`, `S(T_1) = 8` | holds |
| §9.5 | `μ`-ordinary; basic `GL_2` | `J = GL_1 × GL_1`; `J = D^×` | holds |
| §9.6 | every `(n⃗′, Π^{n⃗′})` with the same `Π^{S′}` | the same `Π⁰` by strong multiplicity one, so each term vanishes; (ii) is over ordered pairs | holds |
| §10.1 | `d_v ∤ n₁`; central `γ` | `lcm_v d_v = n`, `n₁ < n`; `m_ie_i` a multiple of `lcm(d_v, e_i)`; `(X − γ)^n` | holds |
| §10.2–10.3 | `n = 1`; `GU(1,1)`; Harris–Taylor | `ep(1) = 1` (full pair `0`); `ep(1) = 2` (`K_max`: `1`); `dim = 2(n−1) + 1`; `(−1)^{q(G)}` twice | holds |
| §10.4, §10.6 | `n = 1`; `Π⁰_{𝔭_i} ≅ π_{𝔭_i}` | Shin11 (4.8) at split `v` | holds, given the declared gap |
| §11.1 | `S′ = S` | image of `𝕋^{S′}` in a finite field is a field | holds |
| §11.2(a),(b) | hyperspecial `K_p` | `E_2^{0,j₀} = (H^{j₀}(𝒮)_𝔪)^{K_p}` may vanish; only "some `j ≤ i`" | holds |
| §11.2(c) | `S = {2}`; `K ⊂ Γ(N)`; odd-type hyperspecial `K_q` | `N = 4`; `K_N = K`; no self-dual stable lattice | **S03** |
| §11.3 | all stalks zero; stalks in degrees `≥ d` | Leray | holds |
| §11.4 | `κ(𝔪^∨) ≠ 𝔽_ℓ`; `BC^{S′}` at a non-split place | one-degree concentration makes the class `±` an actual representation, so `BC^{S′}` cannot cancel it | holds |
| §11.5 | `q ∈ Ram(ϖ) ∖ S`; residue field of `𝔪` | second construction avoiding `q`; `𝔪` in the support of a finite module has finite residue field containing `ℓ` | holds |
| §11.6 | minimal `b` ordinary | `d_{b′} ≥ d_b = d ≥ d_{b′}` | holds |
| §11.7, §11.8 | `V = 𝔽_ℓ`, `K′ = K`; `𝔪 ∌ ℓ` | row `b = d` only; excluded by the Conventions | holds |
| Layer 11 Iwahori example | `n = 1`, `q₁ = 5`; `N = 4, 6, q₁, 2q₁` | `(1 + 5ℤ_5)² ⊂ Γ(5)` | **S04** |
| Worked examples | `p` split or inert in `F⁺` | `ℚ_p⁴`, `(1,1,4)`; `ℚ_{p²}²`, `(1,2,2)`; `c_1 ∈ {0, 1}` | holds |

### Counts and mechanical checks

- Declarations read: 4 of 4 (`Suggested.lean`, 98 lines: one `import Mathlib`, namespace as required, no `set_option`, no `lemma`, no sorry'd data, no `#eval`).
- Targets read: 29 (§§8.1–8.9, 9.1–9.6, 10.1–10.6, 11.1–11.8), with every API bullet; README read in full (746 lines).
- Locators verified against the cached texts this round: 31 (CS17 lines 89, 101, 131, 149, 3236, 3275–3292, 3514–3526, 3551–3587, 3679, 3714–3722, 3740, 3804, 3899, 3950, 3978–3991, 4030–4037, 4068, 4075–4078, 4082, 4102, 4244, 4326, 4339, 4363–4383, 4398–4408, 4409, 4422–4434, 4436–4441; Shin11 lines 1046–1108, 1474–1494, 1685–1716, 2894–2906). None wrong.
- Checks tested by recomputation: 33. One false in a degenerate case (S04); none vacuous. Every definition has at least three (§8.1: 9; §8.3: 5; §8.4: 4; §8.5: 7; §8.7: 7; §9.4: 4; §10.3: 4; §10.5: 4).
- Sibling citations checked at the current heads or on main: 20 roadmaps, 138 cited sections or named targets resolved by heading, all present. Statements read against the README's description this round: PELModuli §§M0.2, M0.6, M0.7, M0.13, M0.16, M0.27, M1.9, M1.13, M2.8, M2.10, M2.11, M3.3, M3.4, M5.5, M6.1; PerfectoidShimuraVarieties §§2.2, 3.5; IgusaVarietiesAndTorsionConcentration §§0.11, 3.17, 4.4, 4.5; EndoscopicTransferAndUnitaryTraceComparison §§1.8, 5.1, 6.1, 6.3, 6.6–6.10, 6.14, 6.15, 6.21, 6.22, 6.25, 7.5, 7.10, 8.11, 8.21, 8.22, 10.20, 10.21, 10.26, 10.30, 10.32, 14.2–14.5; AutomorphicGaloisRepresentationsPartII AG2.7 «Strong local decomposed genericity», «Infinitely many decomposed generic primes» and its `Suggested.lean`. Three do not support the use made of them (S01, S02, S03); one has the opposite convention (S05).
- Pinned declarations found: `Ideal.inertia`, `Ideal.primesOver`, `Ideal.LiesOver`, `IsArithFrobAt`, `NumberField.IsCMField`, `NumberField.maximalRealSubfield`, `HeckeRing`, `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset`, each in the file the README names. No Chebotarev theorem under `Mathlib/`.
- Dependency check (the command of the brief):

      depcheck: 244 roadmaps, 2287 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Declared gaps: the three slugs are in `design/plan.json` with the suppliers and sections of the README; each `needs` is one statement with its hypotheses; none asks for what its supplier states at its head. Not raised.
- Ownership: `roadmaps grep` finds none of the four Lean names in another roadmap; the sibling's `FiniteModelDecomposedGenericPrime` and `infinitelyManyDecomposedGenericPrimes` are the weak forms, cited at line 11. `scratch/overlaps.md` lists no shared roadmap, second copy or dropped id. Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the indexed heads only.
- Policy: the pull request changes only the package folder; no pull-request numbers or process words in the README or docstrings; every target has a locator; `sources.toml` has no local path.
- Arrangement. [CS17] has 74 of 88 bracketed locators. By number: Layer 8 ↔ parts of §§1, 5.1, 5.4, 6.2, 6.3, with §8.9 absent from the source; Layer 9 ↔ §§5.2–5.5 (§9.1 ↔ 5.2 and 5.3; §9.2 ↔ part of 5.4; §§9.3–9.6 ↔ 5.5); Layer 10 ↔ §5.6; Layer 11 ↔ §6.3 with the Remarks of §1. No one-to-one run: six sections of Layer 9 against four of the source, and §§2–4 and 6.1 of the source have no layer. The order is forced by the *Needs* lines (§9.3 needs §9.1; §9.6 needs §§9.2–9.5; §10.6 needs §§9.2, 9.5; §11.6 needs §§9.6, 10.6).
- Wording. Passages put beside the source: Cases 1–2 (CS17 lines 4367–4371) against §8.1; the level hypothesis (4375–4379) against §8.1; §5.1 (3275–3292) against §§8.1–8.2; the choice of `S` (3514–3517) against the Conventions; the test functions (3563–3577) against §9.1; Definition 1.9 against §8.7; Theorem 5.5.7 against §9.6; Proposition 5.6.1 against §10.1; Corollary 6.1.4 against §11.4; Remarks 1.3 and 1.7.1 against §11.8; Remark 6.3.2 against §8.8 and the first theorem's docstring; the Hochschild–Serre step (4436–4441) against §11.2; Shin11 (4.19)–(4.20) against §9.1. Longest shared run: seven words in a hypothesis the mathematics forces ("contains at most one `τ` for which"). No table, figure or list taken over.

Source independence: 13 passages compared with 2 sources (CS17, Shin11), none shared; largest share CS17, 74 of 88 locators; contents compared with CS17: independent (no one-to-one run of layers or sections; the order of Layers 9–11 is forced by the dependency lines named above).

## Not verifiable

- The mathematics behind the three declared gaps (declared contracts, not raised).
- The reindexing of ArithmeticLocallySymmetricSpaces ALS.5b.4 and AutomorphicSpectralTheory §§6.19–6.20 from `K_max` to `K_∞` for `e = 2`: the argument is the README's own; checked on `GU(1,1)` only.
- Supplier sections not listed under "Statements read" above or in the round 1 reports: existence of the heading only.
- Journal pagination of [Shin09], [Shin12] and [Shin-BCU]: only author copies are cached, and the README says so. [Shin09], [Shin12] and [Shin-BCU] were not reopened this round; their locators stand as verified in round 1.
- PELModuli §M6.1 is stated for levels inside `G(Ẑ^□)`; that its `□ = ∅` case covers the covering `S_{K_N} → S_K` of §11.2(c) at an arbitrary level in `G(𝔸_f)` was read from §§M1.9 and M6.2 there, not checked further.
- No Lean was elaborated; the signatures are those of `scratch/signatures.md`.

## Source issues

- **Misprint** in CS17 at Theorem 5.5.7, p. 747 (CS17 line 3979) and Corollary 5.6.3, p. 750 (CS17 line 4103): the source says `S_i` is defined by the composite of `ι_p` after `τ`, which is not defined for its `ι_p`; it should be `ι_p⁻¹` after `τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, p. 747 (CS17 line 3987): the source says the vanishing class is the base change at `p`; it should be the base change away from `S`, as in the proof at line 3990; affects nothing.
- **Misprint** in CS17 at Lemma 5.4.3, p. 741 (CS17 line 3722): the source says the reduction of `π_p` vanishes; it should be the reduction of the endoscopic representation of the hypothesis; affects nothing.
- **Misprint** in CS17 at Theorem 6.3.1(1), p. 757 (CS17 lines 4402, 4407): the source says the similitude factor at `q` is the `p`-adic units in the `p`-adic numbers; it should be the `q`-adic ones; affects nothing.
- **Misprint** in CS17 at §5.6, p. 749 (CS17 lines 4077–4078): the source says the Frobenius-twist lemma is Lemma 6.4 of Shin's 2011 paper; it should be Lemma 6.4 of Shin's "Counting points on Igusa varieties"; affects nothing.
- **Misprint** in CS17 at Remark 6.3.3, p. 758 (CS17 line 4432): the source says just one embedding has nonzero signature product; it should be two conjugate ones, exactly one of them in the sets `S_i`; affects nothing.
- **Error** in CS17 at §5.1, p. 730 (CS17 line 3281): the source says the group with the class of `h` is a Shimura datum in the sense of its §2.1; it should exclude data definite at every place of rank at least two; affects the proof.
- **Gap** in CS17 at proof of Theorem 5.5.7, p. 748 (CS17 line 4034): the source says the Kottwitz set of the restriction of scalars equals that of `GL_n` for the one noncentral component; it should first translate by a central power of `p`; affects the proof.
- **Gap** in CS17 at proof of Theorem 6.3.1, p. 758 (CS17 lines 4439–4441): the source says the least nonvanishing degree at level `K` is a nonvanishing degree at infinite level at `p`; it should give only some degree not above it; affects the proof.
- **Gap** in CS17 at §6.3, pp. 756–758 (CS17 lines 4377–4378): the source says any hyperspecial level away from `S` is allowed and uses a Siegel embedding with small level; it should say why such levels, which need not stabilize a self-dual lattice, lie in a principal level; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6d0579cb1e1aee23ca2a838f90a1942ed9825c9b", "job": "RT-IgusaVarietiesAndTorsionConcentrationPartII~2a", "model": "fable", "worker": "chris-x88"} -->
