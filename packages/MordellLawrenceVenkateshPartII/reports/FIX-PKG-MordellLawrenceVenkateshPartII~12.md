# FIX-PKG-MordellLawrenceVenkateshPartII~12

Findings of `REV-PKG-MordellLawrenceVenkateshPartII~11` (one review, so the ids below are unqualified). I
checked all four against the sources and the README, and all four are right. `README.md` means
`packages/MordellLawrenceVenkateshPartII/README.md`. `Suggested.lean` is unchanged: no declaration states
§§5.5, 5.8, 7.3 or 7.5.

## F01 (P2) — applied

§5.8: "fixed … `ρ^ss` and fixed residue Frobenius data, … finitely many graded types, … balanced" →
`ρ₀ : G_ℚ → G(ℚ_p)` (`G` the normalizer of `V_et/E_et`) continuous, G-completely reducible,
crystalline, pure (§5.4), with the coefficient composite. Finitely many balanced `(V₀, φ₀, F₀, f₀)`; each
`ρ` gets `f` and a `D_cris` tensor isomorphism matching one type. Both suggested Checks added.

Evidence: LS lines 3549–3561 state Lemma 8.10 without purity. Its last step (LS line 3601) applies
Lemma 8.7, which assumes the hypotheses of Lemma 8.1 (LS lines 3464–3468, 3338–3341). Witness recomputed:
the Kummer class of 2 is a `p`-adic unit class, so it is crystalline at `p` and nonzero locally. The
filtered φ-module is `⟨e₀, e₁⟩`, with `φ = 1, p` and `Fil¹ = ⟨e₁ + e₀⟩`. The two φ-stable lines give the
types (sub: `φ = 1`, degree 0) and (sub: `φ = p`, degree 0). Both are unbalanced against the average
`1/2`, and the trivial flag does not match, because `Fil¹ ≠ ⟨e₁⟩`.

Where the repair departs from the suggested text, and why:

- **The types are compared through a named map.** `(V, φ, F)` and `(V₀, φ₀, F₀)` live on different spaces
  `D_cris(ρ)` and `D_cris(ρ₀)`, so "graded type … that of one of them" needs an identification. The
  statement now asserts a tensor isomorphism between the two `D_cris` fibre functors on `Rep(G)` that
  carries one type to the other. The route explains why it exists (LS lines 3572–3581):
  `H¹(ℚ_p, P) → H¹(ℚ_p, L)` is bijective.
- **"A G-semisimplification".** §2.3 fixes `ρ^ss` only up to `G°(k̄)`-conjugacy, so the hypothesis reads
  "a G-semisimplification … `G(ℚ_p)`-conjugate to `ρ₀`".
- **The `ℚ(i)` Check.** For semisimple `ρ = ρ₀` the trivial flag is balanced, so the Check does not say
  the whole statement fails over `ℚ(i)`. It says that the §5.4 balance, on which `F₀` rests, fails there
  for the character Borels.
- **The bijection is now owned in §2.11.** The route's input `H¹(F, L ⋉ U) ≅ H¹(F, L)` (unipotent `U`,
  characteristic 0) had no owner. EndoscopicTransferAndUnitaryTraceComparison §1.13a (open head) states
  it only for rational parabolics of *connected* reductive groups. The coefficient normalizers here can
  be disconnected (`GO`, `Aut(E)`), so §2.11 now states the general form. It has a route (twisting and
  additive Hilbert 90) and two new Checks (`𝔾_a ⋊ μ₂` over `ℚ₃`; `ℤ/p` over `𝔽_p`). Scope and ownership
  item 3 says how it differs from §1.13a.

Pattern and consumers:

- **§6.1.** Its route now says why the representative `ρ₀` of each class from §2.9 meets §5.8: the
  Levi projection keeps crystallinity (as a sum of subquotients), keeps Frobenius polynomials and hence
  purity, and keeps the composite, which is trivial on `G°`. *Needs:* gains §2.3.
- **Source corrections.** New entry for LS, Lemma 8.10.
- **Supplier contract.** The LanglandsParameterStacks consumption list now includes §§2.11, 5.8 and 7.5.
- **Other purity users.** §5.4 already assumes purity; §7.5 uses a pure geometric family; §5.12 assumes
  a balanced type.

## F02 (P2) — applied

§7.3: "For a fixed smooth projective family …" → `𝒴/ℤ[S⁻¹]`, geometrically connected `Y`, `π : 𝒵 → 𝒴`
smooth projective; `V`, `GAut`, `h`, `φ_crys,ℓ` defined. §7.5: "Under the numerical inequalities of
§7.6 …" → setting of §7.3, `d ≥ 1`, monodromy ⊇ `Aut(V, ⟨ , ⟩)°`, both inequalities, `y₀`, fixed `ρ₀`;
`D_mon` sentence in the route; constant-family Check.

Evidence: LV lines 3123–3128 (Lemma 10.5) sit inside the proof of Theorem 10.1, under (10.1) (LV lines
2853–2856). The proof ends at LV lines 3337–3340 by Lemma 9.3 (LV lines 2706–2712), with codimension in
the full `H*`. I recomputed the witness: for `𝒵₀ × 𝔸¹`, every `y ∈ y₀ + ℓℤ[S⁻¹]` has the fibre `𝒵₀`, and
that set is infinite, hence dense in `𝔸¹`. `A ≥ 1` makes `Aut°` positive-dimensional (Lie `GAut` =
scalars ⊕ Lie `Aut`), so trivial monodromy fails the new hypothesis.

Where the repair departs from the suggested text, and why:

- **§7.3 keeps geometric connectedness of `Y`.** Without it `h` (and `h⁰`, which is in the conclusion) can
  differ between components of `Y` over `ℚ`. With integral points present, a connected smooth `Y` is
  geometrically connected anyway.
- **The semisimplification `ρ₀` of `y₀` is fixed.** This avoids the choice ambiguity of §2.3.
- **The `D_mon` sentence is justified.** `G_mon` is the closure of monodromy (§0.6), and
  `Aut° ⊂ G_mon° ⊂ GAut° = 𝔾_m·Aut°`. Scalars fix flags. The self-dual flag variety is one `Aut`-orbit
  whose components are `Aut°`-orbits.
- **The route checks §7.4's hypotheses.** `z ≤ h⁰` gives `A ≥ z + d`. `T` is nondecreasing on
  `[0, A + h⁰]` and `3h⁰/2 + d ≤ A + h⁰`, so `B` exceeds §7.4's bound.
- **§7.5 *Needs:*.** It also lists §§0.6 and 2.3.

Consumers:

- **§7.6.** Its route used MordellLawrenceVenkatesh §1.2 (finiteness of `GL`-classes), which does not
  give the `GAut(ℚ_ℓ)`-classes that §7.5 now fixes explicitly. It now uses §2.9 with `E = E₀ = ℚ_ℓ`, where
  the normalizer is `GAut`, and integral Frobenius polynomials from DeligneWeightsAndPurity §§4.3–4.4.
  *Needs:* updated.
- **Layer 7 Dependencies.** Now "Layers 0 and 2–5" and DeligneWeightsAndPurity §4.4.
- **Unchanged.** The first two sentences of §7.6, and §7.7 ("In the setting of §7.6").
- **Pattern search (a setting defined only later).** "Under the numerical inequalities" occurred only
  in §7.5. Every other use of §3.4 already has codimension in the monodromy orbit (§§4.4, 4.5, 5.12, 6.1).

## F03 (P3) — applied

§5.5: "…φ-stable auxiliary G-filtration `f` and the given semilinear coefficient structure" → "In the
setting of §2.1, with `G` the semilinear coefficient normalizer of `V` and `σ ∈ Aut_(E₀)(E)`, …
`φ ∈ G(E₀)` σ-semilinear, two G-filtrations (§2.5), … `f` φ-stable, that is `φ ∈ P_f(E₀)`". *Needs:*
§§2.1, 2.3, 2.5–2.6, 5.2.

Evidence: LS lines 3511–3515 (Definition 8.8). Tested: for `E = E₀` and `G = GL_n` this is a filtered
space with an automorphism and a stable flag (LS lines 3535–3539). For `E = E₀ × E₀` and `σ` the swap,
`φ` swaps the factors. The three Checks read unchanged.

Pattern: §5.11, "Fix a semisimple `φ` in the coefficient normalizer", had the same unanchored `G`. It now
reads "In the setting of §2.1, fix a semisimple `φ` in the semilinear coefficient normalizer `G`", and its
*Needs:* adds §2.1. §§2.2, 4.4 and 5.12 were already anchored.

## F04 (P3) — applied

The "How to read the build" paragraph has a new last sentence: "Inside a layer the subsections are
grouped by topic and the `*Needs:*` lines give the order: §2.11 comes before §§2.3 and 2.9, and §§8.2–8.4
come before §8.1."

Evidence: a script scanned every `*Needs:*` line after the edits. The only references to a later
subsection of the same layer are §2.3 → §2.11, §2.9 → §2.11 and §8.1 → §8.4. §2.11 names only suppliers,
§8.4 needs §8.3, §8.3 needs §8.2, and §8.2 needs only ClassicalArithmeticCompletion, so there is no cycle.
The new *Needs:* lines (§§5.5, 5.8, 5.11, 6.1, 7.5, 7.6) all point to earlier subsections. No section is
renumbered.

## Checks run

- **Elaboration.** `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the
  content checkout exits 0. Its only output is `declaration uses sorry` at 69:8 and 109:8.
- **Signatures.** I put `#check @name` for all six declarations in one scratch copy and elaborated it
  once. The output is unchanged from `signatures.md`:
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n ! ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n+1)) k → Prop`
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n+1)) ℤ → Prop`
  - the headline, as in the file

  No binder is lost, each agrees with its README statement (§§8.4, 9.1, 9.3), and the Lean file was not
  changed.
- **Dependency check** (the prescribed command), run after the last edit:

  ```text
  depcheck: 257 roadmaps, 2454 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name was found nowhere. I read
  the new citations at their heads:
  - EndoscopicTransferAndUnitaryTraceComparison §1.13a ("Cohomology of rational parabolics and Levi
    subgroups")
  - DeligneWeightsAndPurity §§4.3–4.4 (Weil theorem; integral degree factors)
  - LanglandsParameterStacks §2.3
- **Scripted scan of the added text.** It finds no LaTeX delimiter, machine path, process word or
  pull-request number.
- **`sources.toml`.** The LS `cited_for` changed from "2.1-2.10" to "2.1-2.11", since LS line 3572 is now
  cited in §2.11. No new source was needed, and `needs-references.toml` was not written.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.8, purity | `GL₂`, `ρ₀ = ℚ_p ⊕ ℚ_p(−1)`, Kummer class of 2, `p` odd | weights 0, 2 (not one `w`). Matching flags: sub `(φ=1, deg 0)`, quotient `(φ=p, deg 1)`. Averages 0 and 1 against `1/2`. The trivial flag does not match (`Fil¹ = ⟨e₁+e₀⟩ ≠ ⟨e₁⟩`) | Excluded by the hypothesis; negative-control Check |
| §5.8, base field | `y² = x³ − x` over `ℚ(i)`, `p ≡ 1 mod 4` | two characters, HT `0` and `−1` against `−1/2` | §5.4 balance fails; Check states this, not a failure of all of §5.8 |
| §5.8, `ρ₀` G-irreducible | `ρ` with `ρ^ss ~ ρ₀` | minimal `P_λ = G`, so `λ` is central in `G` (a nontrivial central cocharacter has no limit on other components), `c_λ = id`, `ρ ~ ρ₀`; `P = G` gives `M = G`, so the object is balanced | Check corrected (it said "`ρ^ss`") |
| §5.8, composite to `Aut(E_et)` | `π : G → Aut(E)` finite étale | `π(λ(t)gλ(t)⁻¹) = π(g)` since `π(G°) = 1`, so `π∘c_λ = π` | §6.1 meets the hypothesis |
| §5.8, crystalline `ρ₀` | `ρ^ss = c_λ∘ρ` | standard representation of `ρ^ss` ≅ graded of the `λ`-filtration, a sum of subquotients | crystalline; §6.1 route |
| §2.11 bijection | `𝔾_a ⋊ μ₂/ℚ₃`; Borel of `GL₂`; `ℤ/p/𝔽_p`; `L = 1` | 4 = 4; `1 = 1`; `p ≠ 1` (characteristic `p`); `H¹(F, U) = 1` | Holds in characteristic 0; characteristic `p` is a negative Check |
| §5.5 definition | `E = E₀`, `GL_n`; `E₀ × E₀`, swap; `σ = id` | flag with automorphism; `φ` swaps the factors; linear `φ` | Determines its object; Checks unchanged |
| §5.11 anchor | regular semisimple in `GL_n` | `n!` Borels, dimension `0 ≤ n` | Unchanged |
| §7.3 setting | `Y` connected over `ℚ`, geometrically disconnected | Galois-conjugate components have equal Hodge numbers. With a `ℚ`-point, connected and smooth implies geometrically connected | `h⁰` well defined |
| §7.5 monodromy | `𝒵₀ × 𝔸¹`; `V` 1-dimensional symmetric | `y₀ + ℓℤ[S⁻¹]` infinite and dense; `A ≥ 1` makes `Aut°` positive-dimensional. For `SO₁`: `A = 0`, so `A ≥ h⁰ + d` fails | Excluded; Check |
| §7.5 inequalities → §7.4 | `z ≤ h⁰`, `e = d` | `A ≥ h⁰+d ≥ z+d`; `z+d ≤ h⁰+d ≤ A+h⁰`; `h⁰/2+z+d ≤ 3h⁰/2+d ≤ A+h⁰` (as `A ≥ h⁰/2+d`); `D = h⁰+2A ≥ A+h⁰` | §7.4 applies |
| §7.5 `D_mon` | `GSp_(2g)`; `GO_n` with `n` odd and even | `GSp° = 𝔾_m·Sp`; `GO° = 𝔾_m·SO`. Even orthogonal maximal isotropic flags: two components, each an `SO`-orbit | Codimension in `D_mon` ≥ codimension in the variety |
| §7.6 route | `E = E₀ = ℚ_ℓ`, `H = GSp/GO` | §2.1 Check: `G = H = GAut`; polynomials in `ℤ[t]` of weight `r` | §2.9 applies |
| F04 order | all *Needs:* lines | 3 same-layer forward references, no cycle | Sentence added |

## For the maintainer

- **Changed names other roadmaps cite.** No section was renumbered or renamed. LogicAndDefinabilityInNumberTheory
  (a consumer) cites §7.6, which is unchanged.
- **Ownership against open pull requests.** EndoscopicTransferAndUnitaryTraceComparison §1.13a (an open
  pull request, earlier in the merge order) owns `H¹(F, M) ≅ H¹(F, P)` for connected reductive `G`.
  §2.11 here keeps the general form `P = L ⋉ U`, which disconnected coefficient normalizers need. It is
  not a supplier edge.
- **Not checked.** As in the review, ownership against LawrenceVenkateshMethod (a package on another
  branch) was not checked.
- **Source notes.** The purity omission in LS Lemma 8.10 is now listed under Source corrections.
- **Untrusted text.** The review contains no instructions addressed to the worker; nothing suspicious
  was found.
