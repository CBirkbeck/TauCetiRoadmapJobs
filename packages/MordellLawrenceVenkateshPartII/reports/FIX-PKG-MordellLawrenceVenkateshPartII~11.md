# FIX-PKG-MordellLawrenceVenkateshPartII~11

Findings of `REV-PKG-MordellLawrenceVenkateshPartII~10` (one review; ids unqualified below). All three
were verified against the sources and are right. `README.md` means
`packages/MordellLawrenceVenkateshPartII/README.md`.

## F01 (P2) — applied

§2.6: "For a crystalline local Galois representation with values in `G` …" → `G` over `ℚ_p` with reductive
identity component and a faithful `G → GL_N`, `ρ : Gal(ℚ̄_p/ℚ_p) → G(ℚ_p)` crystalline; `G′` over `ℚ_p`,
Frobenius in `G′(ℚ_p)`; `G₁ → G₂` over `ℚ_p`; the coefficient case carries the hypothesis of LS line 2709;
a sentence why the base is `ℚ_p`; new Check (`K = ℚ_(p²)`). §7.1 restated for finite unramified `K`.

Evidence: LS lines 2675–2677 and 2686–2690 work over `ℚ_p` and `Gal_(ℚ_p)` only; LS lines 2709–2711 add the
hypothesis on the composite to `Aut(E_et)`; LV lines 3196–3204 (footnote 11) work with `G_(ℚ_p)`-modules.

Where the repair departs from the suggested text, and why:

- The suggested sentence "over `K ≠ ℚ_p` the functor `D_cris` takes values in `K₀`-vector spaces with a
  Frobenius that is only semilinear" is false for totally ramified `K` (e.g. `K = ℚ_p(√p)`: `K₀ = ℚ_p`,
  `D_cris` of the trivial character is `ℚ_p` with `φ = 1`, linear). What fails there is that the Hodge
  filtration lives on `D_dR = K ⊗_(K₀) D_cris`, a `K`-space. The README now states the dichotomy: either
  `K₀ ≠ ℚ_p` and `φ` is not linear, or `K₀ = ℚ_p ≠ K` and the filtration is only defined over `K`.
- The suggested Check's last sentence ("a larger unramified field enters only through the coefficient
  algebra of §2.1") was not added: it is not needed and was not verified. The Check instead names the
  consumers that use §2.6 with a global representation, §§5.4 and 5.8, which restrict `G_ℚ` to
  `Gal(ℚ̄_p/ℚ_p)` (§5.4 at `README.md`, "Let `ρ : G_ℚ → G(ℚ_p)` be continuous and crystalline at `p`").
  §5.5 needs only the notion and has base `E₀` (LS Definition 8.8, LS line 3511).
- In the coefficient case the README's own notation is used: the étale fibre `V_et` over `E_et`
  (semilinear normalizer of §2.1 with `E₀ = ℚ_p`), and the de Rham fibre `V_dR` over `E_dR`.

§7.1 (item 4 of the repair): now "Let `K` be a finite unramified extension of `ℚ_p` and `V` a crystalline
representation of `Gal(K̄/K)` on a finite-dimensional `ℚ_p`-vector space …; `D_cris` is a fibre functor
with values in `K`-vector spaces … become tensor-isomorphic over `ℚ̄_p`, after an embedding `K → ℚ̄_p`".
The locator now says that LV and LS treat `K = ℚ_p`. The route takes MotivesAndAlgebraicCycles §6.8 with
`R = K` (its contract allows any `R`) and "a nonempty scheme of finite type over `K`". The Checks say
"over `K`" and "`K`-rational", and the `ℚ_p(1)` Check gives its reason (`H¹(K, 𝔾_m) = 0`). A new Check
(`K = ℚ_(p²)`, trivial `V`) shows the Frobenius does not enter §7.1, unlike §2.6. This matches §7.2 and
gap:hodge-tate-image-cocharacter, which are already over a finite unramified `K`. PadicHodgeTheory §§3.5
and 5.5 (at its open head) treat `D_cris` over finite `K` and the tensor torsor over any field and any
`R`, so no `*Needs:*` line changes.

Pattern search (a crystalline representation or `D_cris` with no base field): §1.2 (over `K_v`, `φ`
already called semilinear, `φ^f` formula) is correct as written. §0.7 already has `φ` semilinear for the
residue Frobenius. §5.5's `φ` is semilinear for the coefficient automorphism over `E₀`, as in LS line 3511,
which is a different notion. §§3.4 and 0.7 cite MordellLawrenceVenkatesh §2.6, not this §2.6. §§5.4, 7.2,
7.3 and 7.5 name their fields. No other occurrence.

## F02 (P3) — applied

§2.6: "(LS, Lemma 5.43 and proof, pp. 58–59)" → "(LS, Lemma 5.43 and proof, pp. 58–60)". §7.1: "LS,
Lemma 5.43, pp. 58–59" → "LS, Lemma 5.43 and proof, pp. 58–60". Verified: statement LS lines 2688–2711,
page-60 marker LS line 2750, proof ends LS line 2759. No other citation of Lemma 5.43 is in the README,
`Suggested.lean` or `sources.toml`.

## F03 (P3) — applied

§10.3: "After enlarging a finite set `S′` of rational primes so that …" → "After enlarging `S` to the set of
all finite places of `K` above a finite set `S′` of rational primes that contains the primes below `S` and
the primes ramified in `K`, so that `O_K[S⁻¹] = O_K ⊗ ℤ[S′⁻¹]` is finite étale over `ℤ[S′⁻¹]`, …". Also
one sentence on why enlarging `S` is harmless, and the reviewer's witness as a Check.

Evidence: LS line 3905 enlarges `S`. "Primes below `S`" is added to the suggested wording: the enlarged set
must contain the given `S`. Pattern search: §1.7 (`README.md`, "with `O_K[S⁻¹]` finite étale over
`ℤ[S′⁻¹]`") takes the relation as a hypothesis and is unchanged. §7.7 used `ℤ[S′⁻¹]` without
introducing `S′`; it now reads "for a finite set `S′ ⊇ S` of primes". `S′ ⊇ S` is the direction the
argument needs, because `ℤ[S⁻¹]`-points must be `ℤ[S′⁻¹]`-points. Other "enlarge `S`" passages (§§4.5,
9.3, 10.2, 10.4, 10.9) enlarge `S` and are correct.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.6, base field | trivial character over `ℚ_p`; over `K = ℚ_(p²)`; over `K = ℚ_p(√p)` | `D_cris = ℚ_p`, `φ = 1 ∈ GL₁(ℚ_p)`, `G′ = GL₁`; `D_cris = K`, `φ(a) = σ(a) ≠ a` for `a ∈ K ∖ ℚ_p`; `D_cris = ℚ_p`, `φ = 1` linear, but `D_dR = K` (2-dimensional over `ℚ_p`) carries the filtration | `ℚ_p` statement holds; both extensions fail, for different reasons | Base `ℚ_p`; reason sentence states the dichotomy; Check added |
| §2.6, `GL_N` and `PGL₂` Checks | `G = GL_N`; `G = PGL₂` | `H¹(ℚ_p, GL_N) = 0`, so `G′ = GL(D_cris V) ≅ GL_N`; `H¹(ℚ_p, PGL₂) = Br(ℚ_p)[2] = ℤ/2`, nontrivial class gives `D^×/ℚ_p^×`, `D` the quaternion division algebra | Checks hold over `ℚ_p` | none |
| §2.6, coefficient hypothesis | `E_et = ℚ_p × ℚ_p` with trivial Galois action, `ρ` whose composite to `Aut(E_et) = ℤ/2` is an unramified quadratic character | `D_cris(E_rep) = (ℚ̂_p^ur × ℚ̂_p^ur)^(Gal) = {(a, σ(a)) : a ∈ ℚ_(p²)} ≅ ℚ_(p²)`, a field, while `E_dR = D_cris(E_et) = ℚ_p × ℚ_p` | without the hypothesis `G′` is a normalizer over a different algebra; with it, `D_cris(E_rep) = E_dR` | hypothesis of LS line 2709 added |
| §2.6, functoriality | identity `G → G`; `GL₁ → GL₁`, `t ↦ t²` | twist of the identity is the identity of `G′`; `G′ = GL₁` (commutative, no twist), map `t ↦ t²` | holds; "over `ℚ_p`" added to `G₁ → G₂` | — |
| §7.1, over finite unramified `K` | `K = ℚ_p`; `K = ℚ_(p²)`, `V` trivial; `V = ℚ_p(1)`; `PGL₂` torsor | recovers LV's statement; trivial group, trivial torsor, fibres `K` and `K`; Tannaka group `𝔾_m` (image of `χ_cyc` open in `ℤ_p^×`), `H¹(K, 𝔾_m) = 0`, isomorphic over `K`; `H¹(K, PGL₂) = Br(K)[2] = ℤ/2`, no `K`-point, `ℚ̄_p`-point exists | holds; `dim_K D_cris V = dim_(ℚ_p) V` since `K₀ = K` | restated; Checks over `K`; one Check added |
| §7.1, ramified `K` | `K = ℚ_p(√p)` | `D_cris` over `K₀ = ℚ_p`, `D_dR` over `K` | not claimed (hypothesis "unramified"); §7.2 and the gap are unramified too | none |
| §7.2 consumer | §7.2 over finite unramified `K` | §7.1's field equals §7.2's | consistent | none |
| §10.3 | `K = ℚ(i)`, `S = {(2+i)}`; `S′ = {2, 5}`; `K = ℚ`; `K = ℚ(√2)`, `S = ∅` | `1/5 ∉ O_K[S⁻¹]`; min. poly of `1/(2+i)` is `x² − (4/5)x + 1/5`, not over `ℤ[S′⁻¹]` if `5 ∉ S′`; `O_K[S⁻¹] = ℤ[1/10][i]`, disc `−4` a unit; identity; `2` ramified, so `S′ ∋ 2`, `ℤ[√2][1/2]` disc `8` a unit in `ℤ[1/2]` (without `2`, disc `8` is not a unit, not étale) | old wording impossible for the first; new wording holds in all four | clause replaced; Check added |
| §7.7, `S′ ⊇ S` | `S = {2}`, `S′ = {3}` | `1/2 ∈ ℤ[1/2]`, `1/2 ∉ ℤ[1/3]`: a `ℤ[S⁻¹]`-point need not be a `ℤ[S′⁻¹]`-point | `S′ ⊇ S` needed | stated |
| New §2.6 Check against §2.6 Checks | "unramified character in `GL₁`" Check | trivial character is unramified; `G′ = GL₁` over `ℚ_p`, `φ = 1` | agree | — |

## Checks

- Elaboration: `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content
  checkout: exit 0. The only output is `declaration uses sorry` at 69:8 and 109:8. `Suggested.lean` is
  unchanged in this round.
- Signatures: `#check @name` for all six declarations, in one scratch copy, elaborated once:
  `eulerian : ℕ → ℕ → ℕ`;
  `eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`;
  `HypersurfaceMonomial : ℕ → ℕ → Type`;
  `@IsSmoothHypersurface : {k : Type u_1} → [inst : Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`;
  `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`;
  `integralHypersurfaces_not_zariskiDense` as in the file (`∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e, G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval … G = 0`).
  No binder is lost, and each agrees with its README statement (§§8.4, 9.1, 9.3). No change.
- Dependency check (the prescribed command):

  ```text
  depcheck: 251 roadmaps, 2403 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- Citations: `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found
  nowhere.
- Scan of the added lines: no LaTeX delimiter, process word, pull-request number or machine path.

## For the maintainer

- No Lean name, layer, section number or gap changed. `design/plan.json`, `metadata.toml` and
  `sources.toml` are unchanged (`LS` is already cited for 2.1–2.10, 7.1 and 10.1–10.10, and `LV` for
  7.1–7.8).
- §7.1 is now stated over a finite unramified `K/ℚ_p`, which is more general than its sources (`ℚ_p`). The
  README says so at the locator. The extra generality matches §7.2 and gap:hodge-tate-image-cocharacter
  (PadicHodgeTheory), which were already over such `K`. No other roadmap cites §2.6 or §7.1 of this
  roadmap.
- No new construction was introduced, so no ownership question arises. The suppliers cited by the
  changed text (PadicHodgeTheory §§3.3–3.6 and 5.5, MotivesAndAlgebraicCycles §§6.3 and 6.8) were
  re-read at PadicHodgeTheory's open head (via `roadmaps show`) and in this README's contract for
  MotivesAndAlgebraicCycles §6.8. They cover the `K`-valued fibre functor and the torsor over `K`.
- The review's "For the human reviewers" section (the Serre and LV licence remarks) lists no finding.
  Nothing was changed because of it.
