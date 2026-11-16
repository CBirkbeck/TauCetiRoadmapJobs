# FIX-RT-MordellLawrenceVenkateshPartII~2

This round settles the three findings of the red-team reviews `RT-MordellLawrenceVenkateshPartII~2a`
(F01, F02) and `RT-MordellLawrenceVenkateshPartII~2b` (F01). The findings do not overlap. `README.md`
means `packages/MordellLawrenceVenkateshPartII/README.md`. `Suggested.lean`, `metadata.toml` and
`sources.toml` are unchanged. `design/plan.json` changed only in its top-level `gaps` list.

## RT-MordellLawrenceVenkateshPartII~2a/F01 (P1) — applied differently

Old → new: §2.9's route went from Hermite to the "connected refinement" to GL-classes with no
GL→G step. §2.3 now proves the geometric finiteness inside a linear class: any `Γ`, any closed
`G ⊂ GL_M`, semisimple `ρ₀`, transporter route, three Checks. §2.9's route is Faltings over `K`,
then §2.3, then §2.11. The G-cr⇒reductive step is gap:complete-reducibility-reductive-criterion.

**The finding holds.**

- MordellLawrenceVenkatesh §1.2, at its open head, is for `GL_d` only.
- LV Lemma 2.6 (LV lines 536–569) is owned by no roadmap. I searched main, the open heads and the
  board packages, by object: transporter, Richardson finiteness, "finitely many G-classes in a
  GL-class".
- The reviewer's witness was recomputed. In `GL₂ × GL₂ ⊂ GL₄`, the elements `(diag(1,2), diag(3,4))` and
  `(diag(1,3), diag(2,4))` are `GL₄`-conjugate. They are not `G`-conjugate: the eigenvalue sets on the
  first factor are `{1,2}` and `{1,3}`. The `GL₄`-class of `diag(1,2,3,4)` meets `G` in
  `binomial(4,2) = 6` classes.

**Why the suggested repair was changed.**

- The reviewer's route keeps Hermite, a restriction to `G_L` and an extension step from `G_L` to
  `G_K`. That extension step would itself be unowned.
- These steps are only needed when the image closure must be connected. The geometric finiteness
  holds for a disconnected closure `L`: the tangent argument needs only linear reductivity of `L`.
- So the route is Faltings's lemma over `K`, then §2.3 with `Γ = G_K`, then §2.11.
- Hermite is no longer used. ArithmeticGaloisDuality §R02.3.1 is removed from §2.9's *Needs:*, from the
  Layer 2 Dependencies, from the supplier contracts and from Scope. Its contract heading is now
  "From TauCetiRoadmap.Chebotarev".

**A second unowned step, repaired with the pattern.**

- Every version of the route, LS's included (LS line 2823), needs this: a G-completely reducible
  representation has a semisimple standard representation. That is LS Lemma 5.37 (LS lines
  2574–2577): in characteristic zero, G-cr is equivalent to `H°` reductive.
- No roadmap states this criterion. LanglandsParameterStacks §2.3 owns G-complete reducibility for
  groups with reductive identity component but does not prove the criterion. ArithmeticGaloisRepresentations
  §1.11 does not state it either.
- It is declared as `gap:complete-reducibility-reductive-criterion` on LanglandsParameterStacks §2.3, in
  the README contract and in `plan.json`. The script comparison of slugs, suppliers and `needs` texts
  between the two is identical.
- The consequence is in §2.3: with ReductiveGroups Layer 6, such an `H` is linearly reductive, so the
  composite with a faithful representation is semisimple.

**Other edits for this finding.**

- ReductiveGroups contract: added Layer 3A (orbits are locally closed and open in their closure) and
  Layer 6 (in characteristic zero, linearly reductive exactly when `G°` is reductive; ReductiveGroups
  README, Layer 6). Both are named in Scope and in §2.3's *Needs:*.
- Scope item 3 and the LanglandsParameterStacks scope bullet now name the new §2.3 statement.
- New §2.9 Check: in the coefficient normalizer `GL₂² ⋊ C₂`, the `GL₄`-class of `diag(1,2,3,4)` gives
  three `G`-classes.
- New Source correction for LV, proof of Lemma 2.6 (LV lines 555–559): the double cosets are for the
  centralizer, and passing to `L°` fails. Witness: `diag(1,1,−1,−1)` gives three classes while `L°` is
  trivial. There are infinitely many `(G, L)`-double cosets, because one `G × Z` orbit has dimension
  `12 > 8`.
- The LS Lemma 5.49 correction (LS line 2830) now describes the new route.

## RT-MordellLawrenceVenkateshPartII~2a/F02 (P2) — applied differently

Old → new: `gap:polarized-fixed-part` on AbelianSchemesAndArithmeticModuliPartII §B2.4 → a citation of
MappingClassGroupsAndCanonicalRepresentations §5.4. There is a new contract subsection with the
admissibility of pure polarizable variations and the passage from real to rational flat sections.
§3.1's route and *Needs:*, the Layer 3 Dependencies and Scope are updated. The gap is deleted from the
README and from `plan.json`.

**The finding holds.** I read MappingClassGroupsAndCanonicalRepresentations §5.4 at its open head. It
proves the theorem of the fixed part for admissible graded-polarizable real variations on a smooth
quasi-projective `X`: `H⁰(X, W)` carries a real mixed Hodge structure, and `H⁰ ⊗ ℝ → W` is a morphism
of variations. It also proves the limit theorem without quasi-unipotence.

**Why the gap's request follows from §5.4.**

- A pure polarizable real variation is admissible. For a one-step `W`, the two admissibility
  conditions are the second and third assertions of that limit theorem along each disc.
- An injective morphism of mixed Hodge structures into a pure Hodge structure is strict. So the flat
  sections form a real sub-Hodge structure.
- The flat sections are defined over `ℚ`, so they form a rational sub-Hodge structure, constant after
  transport.
- A smooth variety that is not quasi-projective is handled on a dense affine open subset, whose
  fundamental group surjects onto that of the variety.

MappingClassGroupsAndCanonicalRepresentations is at merge-order line 291; this roadmap is at line 320.

**Why the suggested repair was changed.** The reviewer kept the §B2.4 contract bullet, "consumed in
§3.1". Once §5.4 supplies the general fixed part, §3.1 uses nothing from §B2.4. Its other clause,
semisimplicity of `G_mon°`, follows in §3.1 from the normality gap. So §B2.4 is removed everywhere,
because a *Needs:* line lists only what is used. MixedHodgeModulesAndIrregularHodgeTheory §5.6 is not
cited, because it is not consumed.

## RT-MordellLawrenceVenkateshPartII~2b/F01 (P1) — applied differently

Old → new: "balanced: `w_M(F_M) = ι_(GM)(w_G(F))`" → `⟨χ, F_M⟩ = 0` for every character `χ` of `M`
over `k` trivial on `Z(G)`. The equality is now proved equivalent only for connected `G`. §5.4's route
follows LS line 3478. Added: two Checks, a GSp/GO API line, and an LS 8.4/8.7 correction. §5.10 and
§7.4 now use weak balance.

**The finding holds.** The witness was recomputed.

- Setting: `y² = x³ − x`, `p ≡ 1 mod 4`, `V = H¹ ⊗ E_et`, and `G = GL₂² ⋊ C₂`.
- The `E_et`-line (`ψ`-line, `ψ^c`-line) is `G_ℚ`-stable, because complex conjugation swaps both the
  lines and the factors.
- `F_M = (0,1|1,0)`, while `ι(w_G) = (½,½|½,½)`. So the old definition fails.
- `M` has a component that swaps the factors. Its characters trivial on `Z(G)` (the diagonal scalars)
  are the powers of `x₁x₂/(y₁y₂)`, up to finite order. These pair to `(0+1) − (1+0) = 0`.
- LS proves only the vanishing for characters of `P` over `ℚ_p` trivial on `Z(G)` (LS line 3478).
  Definition 8.4 tests all of `X^*(S⁰)` (LS line 3384).

**Why the suggested repair was changed.**

- The reviewer's sentence "When `M` is connected and all its characters are defined over `k`, balance
  is the equality in `a_M`" is false for disconnected `G`.
- Counterexample: in `GL₂² ⋊ C₂`, take `λ = (diag(t,1), 1)`. Then `M = T × GL₂` is connected, but `Z(G)`
  is smaller than `Z(G°)`. The equality says `a = b`, while balance says `a = b = (c+d)/2`, through
  `x₁²/det₂`.
- The repair therefore assumes `G` connected. The new second Check records this counterexample. The
  sentence on disconnected `G` says that the two notions differ in both directions.

**Pattern.**

- §7.4 applies §5.10's balanced clause, for a single group, in `GAut°`. A `GSO₂` middle block has a
  character of `M°` that is not a character of `M`.
- Global purity gives only `GAut`-balance, that is, equal block averages.
- LV's proof of Proposition 11.3 uses only (11.14), the vanishing of the modular character (LV lines
  3740–3749). So §5.10 now states that clause for weakly balanced filtrations.
- §7.4's route derives weak balance from the block averages. Its *Needs:* gains §5.3.
- §§5.8, 5.12 and 6.1 use balance only through weak balance and need no change.

## Checks run

- **Lean elaboration.** `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean`, run from
  the content checkout: exit 0. The output is two warnings, `declaration uses 'sorry'`, at lines 69 and
  109, and no errors. The file is unchanged this round.
- **Signature check.** A scratch file with `#check @name` for all six declarations elaborated with exit 0.
  The elaborated types are identical to the worker's signature transcript:
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n ! ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n+1)) k → Prop`
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n+1)) ℤ → Prop`
  - `integralHypersurfaces_not_zariskiDense`, with quantifiers `∃ n₀ ∀ n ≥ n₀ ∃ D₀ ∀ d ≥ D₀ ∀ S ∃ G`.

  No binder was lost and nothing changed. No README change touches a Lean name.
- **Dependency check** (the brief's command):

      depcheck: 263 roadmaps, 2567 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolution** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
  is found nowhere. The worker's earlier lead `VanishingCycles.lisseDirectImageTransport` is a target
  name in EtaleCohomologyFoundations' README on main (its §F.3), and this run finds it.
- **Gaps.** The nine README slugs and the nine `plan.json` entries agree in slug, supplier and `needs`
  text (script comparison). No `gap:` citation lacks a contract line.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 geometric finiteness | `Γ` trivial; `G = GL_M`; `G = SL₂`, `ρ₀ = diag(2,3)`; `GL₂×GL₂`, `diag(1,2,3,4)` | `X = GL_M`, one class; one class; `det = 6 ≠ 1`, `X = ∅`, zero classes; closure `{diag(a,b,c,b²)}`, `Z = T`, `X = ∪_w G·w`, `24/4 = 6` cosets, each of dim 8 = `dim X` | true, all orbits open |
| §2.3 semisimplicity needed | `U₃`, `1 ↦ J₃` | `(u−1)² = ab·E₁₃ ≠ 0` iff `ab ≠ 0`; `(a,b)` conjugation-invariant via `U₃^ab = 𝔾_a²` | infinitely many classes; the hypothesis is needed and present |
| §2.3 disconnected `L` | `ℤ/2`, `diag(1,1,−1,−1)`, `GL₂×GL₂` | `−1`-eigenspace dimension on factor 1: `0, 1, 2`, so 3 classes; `L° = 1` gives 1; orbit through `(2 3)`: `16 − dim T = 12 > 8` | needs the centralizer cosets; LV's `(G, L)` version fails |
| §2.3 tangent step | `g = 1`, `L = T ⊂ GL₂×GL₂` | `T_1X = {Y : Y − Ad(t)Y ∈ 𝔤} = 𝔤 + 𝔱 = 𝔤`; orbit tangent `𝔤 + 𝔷 = 𝔤`, dim 8 | equal |
| gap:complete-reducibility-reductive-criterion | `H = 1`; `H = G`; `⟨U⟩ ⊂ SL₂`; LanglandsParameterStacks `SL₂²⋊C₂` tuple | G-cr with reductive `H°`; `P_λ ⊇ G` forces `U_λ ⊂ R_u(G°) = 1`; neither G-cr nor reductive (`𝔾_a`); contains `⟨U⟩`, so not reductive, not G-cr | both directions consistent with the existing Checks |
| §2.9 route | `K = ℚ(i)`, `GL₁`, `w = 0` | Faltings: one class (`t − 1`); §2.3 and §2.11 trivial | true |
| §2.9 new Check | `GL₂²⋊C₂`, `diag(1,2,3,4)` | `G°`: 6 classes, swap `S ↔ Sᶜ` gives 3 orbits; `((a,b)s)² = (ab, ba)`, eigenvalues `±√μ` | 3 classes |
| MappingClassGroupsAndCanonicalRepresentations contract | trivial monodromy; Legendre `H¹`; `End(H¹)` Legendre | `H⁰ =` whole fibre, constant; `H⁰ = 0`; `H⁰ = ℚ·id`, type `(0,0)` | sub-Hodge structures as claimed |
| §5.3 balance, `GL` | `GL₆` `2+2+2`; `GL₁₂` `(1,4,1)` | `det₀^a det₁^b det₂^c`, `a+b+c = 0`, vanish iff `(1,1,1)`; `det₀/det₁ ↦ 1 − 4 = −3`, `γ_P ↦ 8(1−1) = 0` | unchanged |
| §5.3 CM witness | `(0,1|1,0)` | `x₁x₂/(y₁y₂) ↦ 0`; `x₁/y₁ ↦ −1`; `χ∘ρ` for the first is `ψψ^c/(ψ^cψ)`, of finite order | balanced; not `G°`-balanced |
| §5.3 `G` connected needed | `GL₂²⋊C₂`, `λ = (diag(t,1),1)` | swap: `λsλ⁻¹ = (λ₁, λ₁⁻¹)s`, no limit, so `P ⊂ G°`; `x₁²/det₂ ↦ 2a−(c+d)` | equality `a = b`, balance `a = b = (c+d)/2` |
| §5.3 `O₂ = 𝔾_m ⋊ C₂` | `λ(t) = t` | `P = M = SO₂`, `Z(G) = μ₂`; `x² ↦ 2 ≠ 0`; old: `w_M = ι(w_G)` | old balanced, new not; global `ρ = (χ, χ⁻¹)` pure forces weight 0 |
| §5.3 `P = G`, torus `G` | — | characters trivial on `Z(G)` have finite order, so pair to 0; `γ_P = 1` for a torus | balanced, consistent with §5.8's Check |
| §5.3 GSp/GO API | `GSp₄`, Lagrangian flag; `GO₄`, `ℓ ⊂ ℓ^⊥` | `det₁²ν⁻² ↦ 2s₁ − 2⟨ν,μ⟩`; `x²ν⁻¹ ↦ 2deg ℓ − ⟨ν,μ⟩`; the `GSO₂` character is not tested | averages `⟨ν,μ⟩/2` |
| §5.4 route | CM witness; Kummer case of §5.8 | `|χ(Frob)|^e = ∏|λ_i|^(−e_i) = ℓ^(−(w/2)Σe_i) = 1`; `det_L/det_Q ↦ −1` (impure `ρ₀`, excluded) | true; the purity hypothesis is used |
| §5.10 c = 1 for weak balance | `GL₁₂` `(1,4,1)` | LV (11.14) is used alone (LV lines 3740–3749); the bad-`w` dichotomy depends only on `⟨γ_P, wμ⟩` | clause holds |
| §7.4 route | `GSp₂ = GL₂`, `r = 1`, Borel | `⟨γ_P, μ⟩ = 1 − 2d`; average `½` impossible for a line, so no proper flag | consistent |

## Ownership and suppliers

- **§2.3 geometric finiteness.** No roadmap on main, at an open head or in the board packages states it.
  This roadmap owns it, under Scope's "disconnected-group statements of Layer 2".
- **Declaration names.** No declaration of `Suggested.lean` changed.
- **New supplier edges.**
  - MappingClassGroupsAndCanonicalRepresentations §5.4 (merge-order line 291).
  - ReductiveGroups Layers 3A and 6 (on main).
  - LanglandsParameterStacks §2.3, through the new gap (line 81).
- **Removed edges.**
  - ArithmeticGaloisDuality §R02.3.1.
  - AbelianSchemesAndArithmeticModuliPartII §B2.4. Layer B3 and the Ax–Schanuel gap remain.
- **Notions moved down.** None.

## Notes for the maintainer

- **New gap.** LanglandsParameterStacks is asked for one statement:
  `gap:complete-reducibility-reductive-criterion`, at §2.3. It is the characteristic-zero criterion
  "G-cr ⟺ `H°` reductive" for groups with reductive identity component.
- **Withdrawn gap.** AbelianSchemesAndArithmeticModuliPartII is no longer asked for
  `gap:polarized-fixed-part`.
- **`plan.json` nodes.** The `nodes` of `design/plan.json` still describe §2.9 with "Hermite–Minkowski"
  (its line 1819). This job may edit only the `gaps` list there; the README is the roadmap.
- **Which MappingClassGroupsAndCanonicalRepresentations text was read.** The contract's description of
  §5.4 follows that roadmap at its open head. That head proves the limit theorem without
  quasi-unipotence. The board package copy of that roadmap is older, and its §5.4 states the fixed part
  without that limit theorem.
- **Unchanged.** No id that another roadmap cites was renamed or dropped. No `Suggested.lean` name
  changed.
