# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~9

Findings of `REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~8` (three, all P3). Files edited:
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`, `design/plan.json`,
`sources.toml`. This is the design stage, so the package has no `Suggested.lean`. No Lean was
elaborated and no `#check` scratch file applies. The review's "For the human reviewers" item (the
licence of `teschl`) is not a finding, and nothing was changed because of it.

## F01 (P3) — applied

The finding is right. teschl line 3029 is the heading "2.4. Resolvents and spectra", and (2.68) is
at line 3043–3046, before the §2.5 heading at line 3242. §2.3 starts at line 2761 and contains
Theorem 2.12 (line 2914) and Theorem 2.13 (line 2960).

References `teschl` and `sources.toml` `teschl.locator`: "§2.3 (Theorems 2.12–2.13, (2.68))" →
"§2.3 (Theorems 2.12–2.13), §2.4 ((2.68))".

The same pattern elsewhere: every other item of the entry that names a section was checked against
the headings, and all are correct:
- §1.2: line 1780 lies between the §1.2 heading (1665) and the §1.3 heading (1801).
- §3.2: (3.79) at line 4319 and Lemma 3.15 at 4326 lie between 4110 and 4346.
- §3.3: Lemma 3.16 at 4354, (3.83) at 4390, (3.84) at 4392, Lemma 3.19 at 4391 and (3.85) at 4423
  lie between 4346 and the §3.4 heading (4430).
- §12.1: (12.3) at 10587, Lemma 12.1 at 10600, (12.6) at 10609 and Theorem 12.2 at 10617 lie
  between 10554 and the §12.2 heading (10688).

The body of the README (2.3) and the plan (2.3's locator) cite (2.68) by line, not by section, so
they needed no change.

## F02 (P3) — applied

The finding is right. 1.1's transport law compares the spectral measures of `A` and `UAU⁻¹` on the
whole space. In 1.7 those operators are the reduced restrictions `A = H₁|_{ℋ_ac(H₁)}` and
`A′ = H₂|_W`, where `W = Ω_±(ℋ_ac(H₁))`. Passing from `μ^A`, `μ^{A′}` to `μ^{H₁}`, `μ^{H₂}` is
exactly 1.3 (`μ^{A|_U}_u = μ^A_u`).

1.7, closing paragraph. Old: the parenthetical "(… unitarily equivalent …, by 1.1's transport
law). *Needs:* 1.1; …". New: a route sentence saying that:
- `W` reduces `H₂`, by the intertwining, as `Ω_±(D_±)` does in the second item;
- `Ω_± A Ω_±⁻¹ = A′` (`⊆` from the intertwining, and equality because both are self-adjoint);
- 1.1 gives `μ^{A′}_{Ω_± x} = μ^A_x`, and 1.3 identifies these with `μ^{H₂}_{Ω_± x}` and `μ^{H₁}_x`.

The *Needs:* line becomes "1.1, 1.3; …". `plan.json` 1.7b: `"target:1.3"` is added to
`prerequisites`. 1.3 needs only 1.1, so no cycle arises.

The same pattern elsewhere: every other use of 1.1's transport law was checked, and none needs 1.3:
- 1.4: the unitary invariance of the spectral parts compares `A` with `UAU⁻¹` on the whole space;
  `U ℋ_ac(A) = ℋ_ac(UAU⁻¹)` then gives `(UAU⁻¹)_ac = U A_ac U⁻¹`.
- 4.2: the transport law is applied to the Fourier transform on the whole of `L²`.

1.9 cites 1.7's inclusion, so it reaches 1.3 through 1.7.

## F03 (P3) — applied differently

The finding is right that ComplexCurveModuli D6 is not named. Main
`TauCetiRoadmap/ComplexCurveModuli/README.md`, line 150 (D6, item 2), owns "standard cusp/geodesic
collar coordinates and the collar-width formula".

Checking the same parenthetical turned up two further facts:
- The curvature `−1` case is not RiemannianGeometry R4's. Main `RiemannianGeometry/README.md`
  line 2739–2742 gives "a complete hyperbolic n-manifold is ℍⁿ/Γ" to GeometricTopology §7.1, and
  main `GeometricTopology/README.md` line 6685–6701 (§7.1) proves it.
- FuchsianOrbifolds Layer 3 (main, line 563–586) already holds most of the decomposition. Item 1
  gives finitely many cusp orbits for a cofinite group (Tau Ceti
  `Subgroup.IsCofinite.finite_cuspOrbit`). Item 3 gives disjoint, precisely invariant horodiscs
  whose removal leaves a compact part
  (`TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc`).

Closing section. Old: "(through RiemannianGeometry R4's Killing–Hopf classification and
FuchsianOrbifolds)". New: GeometricTopology §7.1 presents the surface as `Γ\ℍ` (the curvature
`−1` case that R4 leaves to it); FuchsianOrbifolds Layer 3, items 1 and 3, gives the cusps and the
compact part; ComplexCurveModuli D6, item 2, owns the cusp and collar coordinates.

Scope, "Not in this roadmap": one sentence names the same two owners. It adds that 3.10 takes a
standard cusp end as a hypothesis and constructs none. 3.10 itself is unchanged.

This is "applied differently" because the review's suggested wording keeps the wrong attribution
to R4.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7: `ℋ_ac(H₁) ⊆ D_± ⇒ Ω_±(ℋ_ac(H₁)) ⊆ ℋ_ac(H₂)`, route through 1.1 and 1.3 | `H₁ = H₂ = M_x ⊕ diag(5)` on `L²[0,1] ⊕ ℂ`, `x = (1,0)` | `Ω = 1`; `μ^{A′}_x = μ^A_x` (1.1); 1.3: `μ^{H₂}_x = Leb|[0,1]`, absolutely continuous | true | *Needs:* + 1.3 |
| same | `H₁ = M_x ⊕ 0`, `H₂ = M_x ⊕ 7` on `L²(ℝ) ⊕ ℂ` | on `L²(ℝ) ⊕ 0`, `Ω = 1`; on `0 ⊕ ℂ`, `e^{7it}` diverges, so `D_± = L² ⊕ 0 = ℋ_ac(H₁)`; `W = L² ⊕ 0`; `Q_W` commutes with `P_{H₂}(B) = P_{M_x}(B) ⊕ 1_B(7)`; `A = A′ = M_x` | true; 1.3's commuting hypothesis met | none |
| same | `H₁ = diag(1,2)` (`ℋ_ac = 0`) | `W = 0`; 1.3 at `U = 0` gives the zero measures; inclusion `0 ⊆ ℋ_ac(H₂)` | true | none |
| same | `H₁ = M_x` on `L²(ℝ)`, `H₂ = H₁ + c`, `c ≠ 0` | `e^{itc}` diverges, so `D_± = 0 ⊉ ℋ = ℋ_ac(H₁)`; the hypothesis fails and nothing is claimed | consistent with 1.7's Check | none |
| equality step `ΩAΩ⁻¹ = A′` | `S ⊆ T`, both self-adjoint | `T = T* ⊆ S* = S ⊆ T` | `S = T` | none |
| `W` reduces `H₂` | invariance under `e^{−isH₂}` for every `s ∈ ℝ` | `e^{−isH₂}Ωx = Ω e^{−isH₁}x ∈ W`; with `U(s)* = U(−s)`, `W^⊥` is invariant too, so `Q_W` commutes with the group | reduces, as for `Ω_±(D_±)` (teschl line 10615–10620) | none |
| Closing-section attribution | Γ(2)'s image in `PSL₂(ℝ)` (torsion-free, three cusps); a genus-2 surface group; `⟨z ↦ z+1⟩` | area `2π·(2g − 2 + n) = 2π·(0 − 2 + 3) = 2π`, three horodiscs removed leave a compact part; area `4π`, no cusps, quotient compact; area `∫_0^1 dy/y² = ∞`, not cofinite, outside "cofinite `Γ`" | the "cofinite" qualifier is needed and present | R4 → GeometricTopology §7.1 |
| `teschl` locator (2.68) | headings of §2.3 (2761), §2.4 (3029), §2.5 (3242) | `3029 < 3046 < 3242` | §2.4 | §2.3 → §2.4 |

## Checks

Dependency gate (prescribed command), output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Other checks:
- `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean name found
  nowhere. The round-start lead `CompactFormPair.eigenvalue_eq_rayleighMinMax` no longer appears;
  it is VariationalMethods' name and is attributed to it.
- `plan.json` parses as JSON, and the diff adds exactly one line.
- `sources.toml` parses as TOML.

No source was fetched, and no `needs-references.toml` was written.

## Ownership and overlap

The new text cites only roadmaps on main: GeometricTopology §7.1, FuchsianOrbifolds Layer 3,
ComplexCurveModuli D6 and RiemannianGeometry R4. None of them is a supplier of a target here (the
citations are in the Scope list and the closing section), and no *Needs:* line or contract row was
added. Open pull requests that touch these roadmaps:
- #1797 (GeometricTopology): its head keeps §7.1 with the same statement.
- #1791 (draft, GeometricTopology): its head is a much older README (1174 lines against 8265 on
  main) with no §7.1. It appears to predate §7.1 rather than delete it, since RiemannianGeometry
  on main also cites GeometricTopology §7.1. The maintainer may want to confirm this when #1791 is
  rebased.

No open pull request changes FuchsianOrbifolds, ComplexCurveModuli or RiemannianGeometry; only
FuchsianOrbifoldsPartII, a new folder, is open. This roadmap owns nothing new in this round.

## For the maintainer

- No name that other roadmaps cite changed. 1.7b gains one prerequisite inside this roadmap.
- One correction may matter elsewhere: RiemannianGeometry R4 states the Killing–Hopf
  classification only in curvature 0 and 1. A roadmap citing "R4's Killing–Hopf classification"
  for hyperbolic surfaces should cite GeometricTopology §7.1 instead.
