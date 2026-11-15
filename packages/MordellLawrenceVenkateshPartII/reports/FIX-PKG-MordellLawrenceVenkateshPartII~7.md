# FIX-PKG-MordellLawrenceVenkateshPartII~7: repair report

The review `REV-PKG-MordellLawrenceVenkateshPartII~6` has three findings, all P3. I checked each one against
LS and LV in the cached texts and against the roadmap's own §§6.1, 7.7 and 10.4–10.6. All three are correct.
F01 is applied with one part done differently, explained in its section. F02 and F03 are applied as
asked. The F02 pattern search found six more LV page ranges with the same kind of error, and I corrected
those too.

Files changed: `packages/MordellLawrenceVenkateshPartII/README.md` only. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-MordellLawrenceVenkateshPartII~6/F01 (P3) — applied differently

**Verified.** §6.1 needs a smooth *geometrically connected* generic fibre (`README.md`, §6.1). §10.4 only
delivered a smooth `C̃`, and §10.5 consumed it as given. The reviewer's witness is right:

- `x² − 2y²` does not factor over ℚ.
- Over `ℚ(√2)` it splits as `(x − √2y)(x + √2y)`.
- The normalization is `Spec ℚ(√2)[t]`. It is connected as a ℚ-scheme. Base change to `ℚ̄` gives
  `ℚ̄[t] × ℚ̄[t]`: two components.
- `x² = 2y²` with `x, y ∈ ℚ` forces `x = y = 0`.

**Old → new.**

- **§10.4 statement:** "a proper birational `C̃ → C` with `C̃` smooth" → "`C` is geometrically irreducible
  over ℚ, and … `C̃` smooth and geometrically connected over ℚ". `C` is now given its reduced structure
  and taken as a component of the closure in the generic fibre.
- **§10.4 route:** a new argument for geometric irreducibility.
  - Galois permutes the geometric components transitively.
  - A ℚ-point lies on every conjugate of its component, so with two or more components the ℚ-points lie
    in a proper Galois-stable closed subset. That subset descends to ℚ, which contradicts density.
  - `C̃` has the function field of `C`, and ℚ is algebraically closed in that field. So `C̃` is
    geometrically integral.
- **§10.4 Checks:** the negative control with `x² − 2y² = 0` is added.
- **§10.5:** "smooth positive-dimensional" → "smooth geometrically connected positive-dimensional".

**Applied differently.** The review also asked for an API bullet "`C̃` is smooth and geometrically
connected". §10.4 is a theorem target, not a definition, and theorem targets in this README have
statements and Checks, not API lists. So the property went into the statement itself, which is binding
for §10.5.

**Pattern search.** No other place hands a resolved base to §6.1 or §7.6 without geometric
connectedness:

- §7.7's route already proves geometric irreducibility from density, with the same argument.
- §9.3 applies §7.6 to `Y_(n,d)`, which is open in projective space.
- §10.6 reaches §6.1 only through §§10.4–10.5.
- Conventions already require a geometrically connected `X/ℚ` for the rational-base theorems.

## REV-PKG-MordellLawrenceVenkateshPartII~6/F02 (P3) — applied

**Verified.** LV's printed page is 892 plus the page marker of the cached file, as `sources.toml`'s
`version_note` records.

- **LS, Example 5.8:** begins at LS line 1935. Page 42 runs from LS line 1895 to line 1939, so it is on p. 42.
- **LS, Remark 5.9:** at LS line 1950, on p. 43. It is a remark, not an example.
- **LS, Definition 5.13:** at LS line 2009, on p. 44.
- **LV, `α_p`, (10.7) and (10.8):** `α_p` at LV line 2945, (10.7) at LV line 2959 and (10.8) at LV line
  2970, all on printed p. 971.
- **LV, (10.9) and (10.10):** at LV lines 2988 and 2992, on printed p. 972.
- **LV, proof of Proposition 10.2:** ends at LV line 3064. §10.3 begins at LV line 3065, both on
  printed p. 974.

**Old → new**, the four places the review names:

1. §0.4: "LS, Examples 5.8–5.9, p. 43" → "LS, Example 5.8 and Remark 5.9, pp. 42–43".
2. §8.2: "LV, §10.2, printed pp. 972–974" → "LV, §10.2, (10.7) and (10.10), printed pp. 971–972".
3. §8.9: "printed pp. 970–975" → "printed pp. 970–974".
4. §9.3: "printed pp. 969–975" → "printed pp. 969–974".

**Same pattern elsewhere**, checked against the LV text and corrected:

- **§7.1:** "footnote 11, printed pp. 977–978" → "printed p. 977". The footnote runs from LV line 3196 to
  line 3211, all on p. 977.
- **§7.6:** "proofs §§10.3–10.5, printed pp. 975–982" → "pp. 974–982". §10.3 starts at LV line 3065,
  printed p. 974. LV §11 starts on p. 983 (LV line 3406).
- **§8.3:** "(10.9)–(10.10), printed pp. 972–973" → "printed p. 972".
- **§8.7:** "(10.6)–(10.8), printed pp. 971–972" → "printed pp. 970–971". (10.6) is at LV line 2933, on
  p. 970.
- **§8.8:** "Lemma 10.3 and (10.9)–(10.12)" → "Lemma 10.3, (10.9)–(10.12) and the proof of (10.13)". The
  pages 972–974 stay. The `o(√n)` claim is (10.13), at LV line 3038, proved through LV line 3064.
- **§9.2:** "LV, §10.2, printed p. 971" → "printed p. 970". LV's appeal to Beauville for large monodromy
  is at LV line 2920.

**Checked and left unchanged:**

- §5.3, "Definition 8.4 and Example 8.6, pp. 74–76".
- §1.2, "Examples 5.15 and 5.17–5.21, pp. 45–47": items 5.15 and 5.17–5.21 are all examples, at LS lines
  2064–2136.
- LV, Lemma 10.4: statement p. 975, proof pp. 976–978.
- LV, Lemma 10.5: statement p. 975.
- LV, Proposition 10.6: pp. 981–982.
- LV, (10.2)–(10.3): pp. 968–969.

## REV-PKG-MordellLawrenceVenkateshPartII~6/F03 (P3) — applied

**Verified.**

- LS line 3133 (Example 6.7, p. 68) has:
  - the four classes `{1,2}, {3,4}, {5,6}, {7,8}`;
  - `σ = (13)(24)(57)(68)`;
  - c-balanced for `c ≤ 4`;
  - strongly c-balanced only for `c ≤ 2`.
- LS lines 3417–3448 (Example 8.6, pp. 75–76) have:
  - the `2 + 2 + 2` flag in `GL₆` with `dim F¹ = 3`;
  - `(1,1,1)` as the balanced triple;
  - weak balance as `a₀ = a₂`;
  - semibalance as `a₀ ≤ a₂`;
  - the generic triple `(2,1,0)`.

**Old → new:**

- **Layer 4 Examples:** "… not strongly 4-balanced." → "… not strongly 4-balanced (LS, Example 6.7, p. 68)."
- **Layer 5 Examples:** "(LS, Example 8.6, pp. 75–76)" is added after the `GL₆` sentence.
- **Worked examples, "Semibalance in `GL₆`":** the same locator is added after the `GL₆` sentence.

In both Layer 5 and the worked examples the locator sits right after the `GL₆` sentence. The `4 + 4 + 4`
instance in `GL₁₂` follows the locator and carries no source, so it reads as the roadmap's own. The
review's parenthesis "the `4 + 4 + 4` instance is this roadmap's" is not needed with that placement.

## Checks

- **`lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean`** (run from the content
  checkout): exit 0, about 5 s. The only output is `declaration uses sorry` at 69:8 and 106:8. The file
  is unchanged this round.
- **`#check @name` on a scratch copy**, for all six declarations, elaborated once. No binder is lost. The
  types are the same as last round and agree with the README:
  - `eulerian : ℕ → ℕ → ℕ`;
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n ! ^ 2`;
  - `HypersurfaceMonomial : ℕ → ℕ → Type`;
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n+1)) k → Prop`;
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n+1)) ℤ → Prop`;
  - `integralHypersurfaces_not_zariskiDense : ∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e,
    G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval (coeff F) G = 0`.

  Nothing changed.
- **Dependency check** (the prescribed `gate --depcheck` command):

  ```text
  depcheck: 245 roadmaps, 2253 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- **`roadmaps resolve` lead.** `VanishingCycles.lisseDirectImageTransport` is the target named at
  `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:707` on main, and the README cites it as that.
- **Gate failures:** none were listed for this round.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §10.4, geometric irreducibility | `x² − 2y² = 0` | Over `ℚ(√2)`: 2 components, meeting in `{(0,0)}`, which is Galois-stable and descends to the origin; `C(ℚ) = {(0,0)}` is not dense | Hypothesis fails, so the statement does not apply | Negative-control Check added |
| §10.4, lift and connectedness | nodal `y² = x²(x+1)` | Parametrized by `t ↦ (t² − 1, t³ − t)`; integral points for `t ∈ ℤ` are dense; normalization `𝔸¹_ℚ` is geometrically connected; the node has preimages `t = ±1` | Statement holds | none |
| §10.4, non-split node | `y² = x²(x + 2)` | Normalization `t ↦ (t² − 2, t(t² − 2))`; the node lies under the degree-2 point `t² = 2`, so the rational node does not lift rationally | Agrees with Check 1 (restrict to `U`) | none |
| §10.4, degenerate cases | `C` a ℚ-point; `C = 𝔸¹_ℚ` with `ℤ[S⁻¹]`-points | Point: `C̃ = C`, one geometric component. `𝔸¹`: `C̃ = C`, geometrically irreducible | Holds | none |
| §10.5 → §6.1 | base `C̃` from §10.4 | §6.1 needs smooth, geometrically connected, `d ≥ 1`; §10.4 now gives the first two, and §10.5 requires positive dimension | Hypotheses match | §10.5 hypothesis made explicit |
| §4 Examples (F03) | `σ = (13)(24)(57)(68)`, 4 classes of size 2 | Orbits `{1,3}, {2,4}, {5,7}, {6,8}`, each meeting 2 classes | c-balanced for `c ≤ 4`; strongly c-balanced for `c ≤ 2`; agrees with LS line 3136 | Locator added |
| §5 Examples and worked example (F03) | `GL₆`, `2 + 2 + 2`, `dim F¹ = 3` | Three off-diagonal blocks of dim 4 give `γ_P = t^(8(a₀ − a₂))` on block scalars; with `w_M = (a_k/2)` the pairing is `4(a₀ − a₂)`; `(2,1,0) ↦ 8 > 0`, `(0,1,2) ↦ −8`, `(1,1,1) ↦ 0` with block averages `1/2 = 3/6` | Matches the README and LS Example 8.6 | Locator added |
| `4 + 4 + 4` in `GL₁₂` | `(1,4,1)`, `(2,2,2)` | Blocks of dim 16 give `32(a₀ − a₂)` on scalars; with `w_M = a_k/4` the pairing is `8(a₀ − a₂)`; `(1,4,1)` gives averages `1/4, 1, 1/4` against `6/12 = 1/2`; `(2,2,2)` gives `1/2` each | Weakly balanced but not balanced; balanced | none (the roadmap's own instance) |
| F02 locators | 13 LV and LS locators | Page map `k ↦ 892 + k`. LV line numbers: (10.6) 2933 → p. 970; (10.7) 2959 → 971; (10.8) 2970 → 971; (10.9) 2988 → 972; (10.10) 2992 → 972; (10.13) 3038 → 973; end of proof 3064 → 974; §10.3 3065 → 974; footnote 11 3196–3211 → 977; Beauville citation 2920 → 970. LS: Example 5.8 at 1935 → p. 42; Remark 5.9 at 1950 → p. 43; Example 6.7 at 3133 → p. 68; Example 8.6 at 3417–3448 → pp. 75–76 | 10 locators corrected | see F02 |

## Ownership and suppliers

- **New targets:** none. The geometric-irreducibility argument in §10.4 is a step of the route, not a
  target.
- **Search for an owner:** `roadmaps grep` over main and the open heads for a "dense rational points ⇒
  geometrically irreducible" statement found no match, so there is no owner to cite.
- **Suppliers:** no supplier row, `*Needs:*` line or gap changed.
- **Open pull requests:** the overlap file lists no open pull request that changes this roadmap and no
  dropped id.

## For the maintainer

- **`design/plan.json`:** its target locators still carry the old page ranges, for example "§10.2,
  pp. 972–974", "Proposition 10.2 and proof, pp. 970–975" and "Footnote 10, pp. 977–978". This job may
  edit only the plan's top-level `gaps` list, so they are unchanged. The README is the roadmap, and its
  locators are the corrected ones.
- **Names:** no Lean name and no section id changed, so no other roadmap is affected.
