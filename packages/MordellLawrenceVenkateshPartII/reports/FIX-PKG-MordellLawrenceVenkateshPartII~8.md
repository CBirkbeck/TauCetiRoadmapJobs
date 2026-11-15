# FIX-PKG-MordellLawrenceVenkateshPartII~8: repair report

The review `REV-PKG-MordellLawrenceVenkateshPartII~7` has four findings: two P2 and two P3. I checked
each one against the cached LS and LV texts, the roadmap's own §§0.2, 0.6 and 3.1–3.4, and the supplier
roadmaps at their heads. All four are correct:

- F02, F03 and F04 are applied.
- F01 is applied with one sentence worded differently, for a mathematical reason given in its section.
- The pattern searches found more instances, and I repaired them too: two more LV page ranges (F03),
  one more Check that dropped integrality (F02), and one more missing supplier section plus several
  incomplete "Consumed in" lists (F04).

Files changed: `packages/MordellLawrenceVenkateshPartII/README.md` only. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No gap was added.

## REV-PKG-MordellLawrenceVenkateshPartII~7/F01 (P2) — applied differently

**Verified.**

- LogicAndDefinabilityInNumberTheory is an open roadmap at merge-order line 324. This roadmap is at
  line 320, so it comes first.
- Its §7.6, "Complex period codimension consequence", states LS Lemma 6.3. It takes the
  Bakker–Tsimerman theorem as hypothesis (I-BT) and cites LS §6.1, Lemma 6.3, pp. 64–65.
- Neither README cited the other before this round.
- Since this roadmap is earlier in the merge order, it owns the result.

**Old → new.**

- Scope item 4: "the codimension consequence of Ax–Schanuel" → "… (§3.3; Lawrence–Sawin, Lemma 6.3)".
- Downstream consumers: new paragraph. It says LogicAndDefinabilityInNumberTheory §7.6 states §3.3's
  consequence with Bakker–Tsimerman as a named hypothesis, and that the objects it names are owned
  here (§§0.1–0.2, 0.6, 3.1, 3.2).

**Why differently.** The suggested sentence called §3.3 "the unconditional target". That is not
accurate: §3.3 rests on gap:period-map-ax-schanuel, owed by AbelianSchemesAndArithmeticModuliPartII.
The new text says instead that §3.3's Ax–Schanuel input is a supplier theorem, not a hypothesis. I also
added §0.6 (`G_mon`) to the list of owned objects, because LDNT §7.6 names `G_mon/P`. In Scope item 4
I left out "owned here", since that list is already headed "This roadmap owns".

LDNT §7.6 should cite this roadmap rather than restate it. That change belongs to that roadmap's pull
request, not this package.

## REV-PKG-MordellLawrenceVenkateshPartII~7/F02 (P2) — applied

**Verified.**

- LS Lemma 6.2 (LS lines 2940–2954, p. 64) works in the setting of LS Theorem 6.4, which assumes a
  "polarized, integral" system (LS line 2979).
- Its normality input is André's theorem (LS line 2947), which this roadmap takes from
  gap:andre-monodromy-normality. That gap is stated for polarized integral variations.
- `G_mon` is defined only for systems (§0.6).

**Old → new.**

- §3.2: "For a polarized pure variation, prove that the stabilizer in the identity component of
  `G_mon` …" → "For a polarized integral Hodge–Deligne system on `X` (§0.2) with differential monodromy
  group `G_mon` (§0.6) and connected monodromy period orbit `D_mon` (§3.1), prove that the stabilizer in
  `G_mon°` of a Hodge filtration in `D_mon` …; a polarized system is pure of one weight (§0.2)."
- New Check: a nonintegral polarized variation for which the normality input fails.
- Needs: "§3.1" → "§§0.2, 0.6, 3.1".

**New Check, computed.**

- Take a rank-two weight-0 variation of type `(0, 0)` on `𝔾_m`, polarized by `x² + y²`, with monodromy
  `R = [[3/5, −4/5], [4/5, 3/5]]`.
- `R` preserves `x² + y²`, since `(3/5)² + (4/5)² = 1`.
- The minimal polynomial of `R` over ℤ is `5t² − 6t + 5`. Its leading coefficient is 5, so the
  eigenvalues are not algebraic integers. Hence there is no stable lattice, and `R` has infinite order.
- So the connected monodromy group is `SO(2)`. The Mumford–Tate group is trivial, and normality fails.
- The conclusion still holds here: the stabilizer of `F⁰ = V` is all of `SO(2)`. Only the route fails
  to apply.

**Pattern.** I searched every "polarized" passage without "integral".

- One Check relied on the fixed-part theorem without integrality. In §0.4, "A nonisotrivial polarized
  variation has nontrivial geometric monodromy" → `H¹` of the Legendre family over `ℙ¹ ∖ {0,1,∞}`, a
  polarized integral variation with local monodromy `[[1, 2], [0, 1]]` at `λ = 0`.
- §§3.1, 3.3 and 3.4 already said "polarized integral".

## REV-PKG-MordellLawrenceVenkateshPartII~7/F03 (P3) — applied

**Verified** against the cached texts. LV printed page = page marker + 892.

1. **§2.3.** LV §2.3 heading is at LV line 468 (p. 904). The semisimplification text is at LV lines
   488–505 (p. 905), Lemma 2.4 at LV line 507 (p. 905) and Lemma 2.5 at LV line 527 (p. 906). LV §2.4
   "Friendly places" is at LV line 575 (p. 907).
2. **§3.3.** LV Corollary 9.2 and its proof are at LV lines 2673–2690, all on p. 964.
3. **§5.1.** LV §11.1 is at LV line 3470 (p. 984) and §11.2 at LV line 3535 (p. 986).
4. **§5.7.** LS Lemma 8.14 is at LS lines 3668–3684. The page marker for p. 81 is at LS line 3685, so
   the lemma is on p. 80.
5. **§5.11.** LS Lemma 8.15 is at LS lines 3687–3721, on p. 81. The next marker is at LS line 3732.
6. **§8.6.** LV (10.6) is at LV line 2933 (p. 970), and its explanation at LV lines 2941–2945 (p. 971).

**Old → new.**

1. "LV, §2.4 and" → "LV, §2.3 and".
2. "Corollary 9.2, pp. 963–965" → "p. 964".
3. "§§11.1–11.2, pp. 985–986" → "pp. 984–986".
4. "Lemma 8.14, pp. 80–81" → "p. 80".
5. "Lemma 8.15, pp. 81–82" → "p. 81".
6. "(10.6), printed pp. 971–972" → "pp. 970–971".

**Pattern.** I swept all LV locators against a page map of LV §§9–12.

- LV §11.6 runs from LV line 3796 (p. 993) to LV line 3856. Page 995 starts at LV line 3858 with §12.
  So "§11.6, pp. 993–995" → "pp. 993–994", in §5.11 and §7.4.
- Every other LV locator agrees with the page map, for example Lemma 9.3 pp. 965–968, Proposition 11.3
  pp. 990–993 and Lemma 11.4 with (11.14) pp. 991–993.
- The LS statements I spot-checked (Lemmas 6.5, 6.8, 7.2, 8.10–8.16, Theorems 8.17 and 9.2–9.6,
  Lemmas A.1–A.6) agree with the README.

## REV-PKG-MordellLawrenceVenkateshPartII~7/F04 (P3) — applied

**Verified.** Each section exists at its supplier's head, and each is consumed by the README section
the review names:

- AbelianSchemesAndArithmeticModuli §A3.2 "Multiplication maps and prime-to-characteristic torsion
  density".
- ReductiveGroups Layer 3 "subgroups, quotients, components".
- DeligneWeightsAndPurity §2.2.
- PadicHodgeTheory §5.5, which contains the local torsor theorem `H¹(F, G) ≃ (π₁(G)_(Γ_F))_tors`.
- ShimuraData §3.2, which covers kernels and images as subvariations, and §§1.3–1.4.

**Old → new.** The contracts now add:

1. §A3.2, consumed in §1.6; the list becomes "Layers 1, 2 and 10".
2. ReductiveGroups Layer 3, consumed in §2.1; the list becomes "Layers 2, 3, 4 and 5".
3. A DeligneWeightsAndPurity §2.2 item, consumed in §9.2; the list becomes "Layers 0, 1, 7 and 9".
4. PadicHodgeTheory §5.5's local torsor theorem, consumed in §2.11; the torsor in §§2.6 and 7.1.
5. ShimuraData §3.2 (§0.3) and §§1.3–1.4 (§3.1).

The Scope bullets gain §A3.2, Layer 3, §§2.2 and 9.12, and §5.5.

**Pattern.** I compared every `*Needs:*` and Dependencies line mechanically against the contracts.

- **Missing section:** PadicHodgeTheory §4.4, the Sen operator, consumed in §7.2. It is added.
- **Incomplete "Consumed in" lists:**
  - PadicHodgeTheory §§3.3–3.6 and §§8.1–8.2: §7.5 added.
  - CrystallineCohomology: §0.5 added.
  - SchemeAndStackFoundations: Layer 7 added.
  - AlgebraicModuliForArithmeticGeometry: §§7.7 and 9.1 added.
- **Claimed consumer that does not consume:** the WeilConjectures list named §1.9, but §1.9 separates
  weights with DeligneWeightsAndPurity §4.4. It now reads "WC.3 in §0.5, WC.5 in §7.8".
- **Needs line:** §10.6's statement uses `D_j`, but its Needs line omitted SheafConvolutionOnAbelianVarieties
  §5.3. It is added.

## Checks

- **`lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean`** (run from the content
  checkout): exit 0, about 4 s. The only output is `declaration uses sorry` at 69:8 and 106:8. The file
  is unchanged.
- **`#check @name`**, all six declarations, in one scratch file elaborated once. The types are the
  same as last round, and no binder was lost:
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n+1)) k → Prop`
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n+1)) ℤ → Prop`
  - `integralHypersurfaces_not_zariskiDense : ∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e,
    G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval (coeff F) G = 0`

  All agree with the README.
- **Dependency check** (the prescribed `gate --depcheck` command):

  ```text
  depcheck: 244 roadmaps, 2259 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The new mention of LogicAndDefinabilityInNumberTheory, which is later
  in the order, is in Downstream consumers only. It is not a supply edge.
- **`roadmaps resolve`:** no cross-roadmap citation and no Lean name is unresolved. Last round's lead,
  `VanishingCycles.lisseDirectImageTransport`, now resolves.
- **Gate failures:** none were listed for this round.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §3.2 (restated) | Legendre `H¹`, `G_mon° = SL₂` | Stabilizer of a Hodge line is a Borel of dim 2; `dim D_mon = 3 − 2 = 1`, `D_mon = ℙ¹`, closed | Holds | Hypothesis restated |
| §3.2 | Constant system; rank 0 | `G_mon` trivial; the stabilizer is the whole (trivial) group, which is parabolic; `D_mon` is a point | Holds | none |
| §3.2 | Nonintegral `R = [[3/5, −4/5], [4/5, 3/5]]` | `det R = 1`, `tr R = 6/5`; minimal polynomial `5t² − 6t + 5`, discriminant `−64`; not integral, so infinite order and closure `SO(2)`; MT trivial | Normality input fails; conclusion holds trivially | New Check |
| §3.2 | Diagonal torus of `SL₂` on `ℙ¹` | Orbit `𝔾_m`, dim 1, not closed | Excluded: not normal in a derived MT group | none (existing Check) |
| §0.4 Check | Legendre family at `λ = 0` | Monodromy `[[1, 2], [0, 1]] ≠ I`; a constant system has trivial geometric monodromy | Not constant, as stated | Check made concrete |
| §3.3 against §3.2 | Varying plus constant elliptic `H¹` on a curve | `X × D_mon`: `1 ≥ 0 + 1`; `X × LG(2,4)`: `3 ≥ 2 + 3` false | Ambient `X × D_mon` still needed | none |
| PadicHodgeTheory §5.5 as used in §2.11 | `GL_n`; norm-one torus of quadratic `L/F`; `PGL₂` | `π₁ = ℤ`, trivial action, torsion 0, so `H¹ = 1`; `X_* = ℤ` with `−1`, coinvariants `ℤ/2`, 2 classes `= F^×/N L^×`; `π₁ = ℤ/2`, 2 classes | Agrees with §2.11 Checks (Hilbert 90) | Contract text added |
| §A3.2 as used in §1.6 | Elliptic `E`, `r = 2`; `r = p` in char `p` | `[2]` finite locally free of rank `2² = 4`, étale where 2 is invertible; `[p]` not étale | Agrees with the §1.6 Check "`r` must be invertible" | Contract text added |
| DWP §2.2 in §9.2 | `dim V = 0`; `V` of dim 2 | `Sp(0)` trivial; `Sp₂ = SL₂`, an open subgroup of `SL₂(ℚ_ℓ)` has full Lie algebra, dim 3 | Holds | Contract item added |
| PadicHodgeTheory §4.4 in §7.2 | `ℚ_p(−1)` | Sen eigenvalue = HT weight `−1` (`HT(χ_cyc) = +1`); cocharacter image `𝔾_m` for both `t ↦ t` and `t ↦ t⁻¹` | Agrees with §7.2 Check | Contract item added |
| ReductiveGroups Layer 3 in §2.1 | `E = E₀ × E₀`, `H = GL_N` | `G/B ≅ Aut_(E₀)(E) = ℤ/2` as fppf quotient; swap in `G ∖ B` | Agrees with §2.1 Check | Contract item added |
| F03 locators | 8 locators | LV: 468→904, 488–505→905, 507→905, 527→906, 575→907; 2673–2690→964; 3470→984, 3535→986; 2933→970, 2941–2945→971; 3796→993, 3856→994, 3858→995. LS: 3668–3684 on p. 80 (marker 3685); 3687–3721 on p. 81 (next marker 3732) | 8 corrected | see F03 |

## Ownership and suppliers

- **New targets:** none. **New gaps:** none. `design/plan.json` is unchanged.
- **§3.3:** owned here, since this roadmap comes before LogicAndDefinabilityInNumberTheory. That
  roadmap is now named as a downstream restatement.
- **New supplier items:** DeligneWeightsAndPurity §2.2 and PadicHodgeTheory §§4.4, 5.5. Both roadmaps are
  earlier in the merge order, and all three sections were already consumed in `*Needs:*` lines. Only their contract
  entries are new.
- **Open pull requests:** the overlap file lists no open pull request that changes this roadmap and no
  dropped id.

## For the maintainer

- **LogicAndDefinabilityInNumberTheory §7.6** restates LS Lemma 6.3. Its pull request should cite
  MordellLawrenceVenkateshPartII §§0.1–0.2, 0.6 and 3.1–3.3 instead of restating them. No edit of this
  package can make that change.
- **`design/plan.json`** target locators still carry old page ranges, for example "Corollary 9.2,
  pp. 963–965". This job may edit only the plan's `gaps` list, so they are unchanged. The README has the
  corrected locators.
- **Names:** no Lean name and no section id changed, so no other roadmap's citation is affected.
- **No suspicious instructions** were found in the review text or in the fetched roadmaps.
