# Review of PositiveMass (pull request #2247 at 6d2d7e4)

**Verdict:** needs changes

## R01 (P3) — the 8.4 rewrite leaves Layer 8's title and 8.4's *Needs:* on the removed Green corollary

**Location:** `TauCetiRoadmap/PositiveMass/README.md:1134`: "## Layer 8: theorems and conformal applications". `:1187`: "*Needs:* 8.1–8.3; 0.4."

**Claim:** With the Green clause removed, Layer 8 no longer states any conformal application, so its title names content the layer does not have. 8.4 now cites 0.2 for both of its facts, but its *Needs:* line omits 0.2. The line still lists 0.4, whose conformal law only the removed clause used.

**Witness:** `:1183`–`1185` cite "(0.2)" and "(0.2; Lee–Parker, …)". 0.2 states isometry invariance and the lifting of ends to finite covers at `:291`–`293`. Conformal blow-ups appear only in Examples (`:1199`) and as Yamabe Y6–Y8's work (`:1208`).

**Repair:** At `:1134`, write "## Layer 8: the positive mass theorems and their invariance". At `:1187`, write "*Needs:* 8.1–8.3; 0.2." No roadmap on main or at an open head cites the Layer 8 heading or 8.4.

## Previous findings

- R01 — repaired: `:1183`–`1185` "8.1–8.3 are invariant under isometries, which preserve the mass of each end (0.2), and pass to finite Riemannian covers…"; the section is retitled; `:1200` no longer has `m = 2A`. The title and *Needs:* it left behind are R01 above.
- R02 — repaired: `:671` "k-manifold, k≥1"; `:145` "of positive dimension"; `:679` "(Lee–Parker, equation (1.1))"; `:1233` no longer lists Theorems 2.6 and 4.1, and no other passage cites them.
- R03 — repaired: `:1152`–`1154` "Theorem 3.1 … p. 13–15, for nonnegativity, and Theorem B, p. 3, with its proof on p. 18, for the rigidity".
- R04 — repaired: `:257`–`259` "order t>(n−2)/2 … plus an `O_2(|x|^(1−t+ε))` error for some small ε>0"; `:289` reads "`O_2(|x|^(1−t+ε))` errors".
- R05 — repaired: `:975` "`ψ = λf` with `0≤f≤1`, where Scal≥0: `θ ≥ λ²f² − λ|df| ≥ −λ|df|`".

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 uniqueness bullet (`:257`–`259`) | n=3 with t=3/4 and t=1/4; radial shift `x + r^(1−t)x/r` | LP 9.5 needs τ>1/2, so t=3/4 is covered with error `O(r^(1/4+ε))` and t=1/4 is excluded; the shift has `dψ−I = O(r^(−t))` | holds |
| 0.2 invariance bullet (`:288`–`290`) | n=3, t=3/4, with ε=1/8 and ε=1/2 | quadratic flux term `∝ r^(1−2(t−ε))`: `r^(−1/4) → 0` at ε=1/8, but `r^(1/2)` at ε=1/2; LP's "small ε" (proof of 9.6, line 1694) | holds |
| R5c item 1 contract (`:145`–`147`) | RiemannianGeometry at the #2222 head `90a5c6a` | standing `m≥1` at `README.md:3403`; item 1 gives the closed case with the least Rayleigh quotient (`:3541`–`3553`) | matches |
| 3.0 (`:671`–`679`) | S¹ (k=1), a=1, V=c; S³, a=8, V=6; k=0 | λ₁=c; `8μ₁(Δ⁺+3/4)=6`; LP (1.1) at p=6: `φ^(−5)·6φ = 6φ^(−4)`, so Scal 6 at φ=1; k=0 excluded | holds |
| 5.2 Check (`:975`) | flat ℝ³, f=1/2, `|df|=1`, λ=2; Scal=−4 with f≡0 | θ = −1 = `λ²f²−λ|df|` ≥ −2; the Scal<0 case is now excluded; θ_ψ as in CZ (2.7), line 358 | holds |
| 8.2 locators (`:1150`–`1154`) | ψ=0 with empty boundary; flat ℝⁿ | `θ̄_0 = nScal/(4(n−1)) ≥ 0`, so Thm 3.1 gives m≥0; at m=0 it gives only θ̄≡0; Thm B (lines 113–116) gives flat and isometric | holds |
| 8.4 (`:1181`–`1187`) | two-ended Schwarzschild, n=3, end swap; its quotient by `ι(x) = −(m/2)²x/|x|²` | `u(ιx)⁴(a/r)⁴ = (1+m/(2r))⁴`, a=m/2, and ι has no fixed point; quotient: one end of mass m; its double cover: two ends of mass m | statement holds; *Needs:* is R01 |
| Layer 8 title (`:1134`) | contents of 8.1–8.4 | three theorems and one invariance statement; no conformal statement (blow-up only in Examples, and as Yamabe Y6–Y8's per `:1208`) | R01 |

The rows for untouched statements (0.4, 1.3, 1.4, 2.1–2.3, 3.3, 4.2, the 5.2 estimate, 6.2, 7.1, 8.1, 8.3) stand as in the previous review, of `56522b9`.

- **Source locators read against the text: 9.**
  - `LeeParker1987`: (1.1) at line 73; Theorem 9.5 at lines 1675–1678; Theorem 9.6 and its proof at lines 1691–1696; the remark after Theorem 10.3 at lines 1802–1809.
  - `CecchiniZeidler2021`: Theorem B at lines 113–116 (p. 3); its proof at lines 800–821 (p. 18); Theorem 3.1 at lines 592–596 (p. 13) with its proof at lines 662–673 (p. 15); (2.7) at line 358 (p. 9).
- **Cross-roadmap citations resolved.**
  - R5c item 1 is at the #2222 head `90a5c6a`. It is absent from main (`7342e8f`), and the description names #2222 as a supplier that merges first.
  - VariationalMethods §2.3 (`:494`) and §5.1 (`:839`) are on main. These are the resolver's two leads.
  - UO-D06 is at UnboundedOperators `:703`, and K5a at ComplexKahlerGeometry `:61`.
  - `roadmaps grep` finds no citation of PositiveMass 8.4 or of the Layer 8 heading.
- **Gate and dependency check.** I re-ran the gate on this head: every check returned 0, and it ended `OK`. The worker's gate records `build=0`. The dependency check printed `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Lean.**
  - `lake env lean` exits 0, with `sorry` warnings only at `:128` and `:154`.
  - `#check @name` for all 7 declarations matches README 8.1, with no binder lost.
  - `Suggested.lean` has not changed since `56522b9`.
- **Headline theorems.**
  - 8.1 is stated.
  - The docstring names 8.2, 8.3 and 3.1's torus obstruction as not statable at the pins.
  - 8.4 is now a corollary of 0.2 and 8.1–8.3, not a headline.
- **Pull request text.** I read the title and every bullet of the description against the head and against the diff from main. Each edit it lists is present, and nothing in the diff is left unstated.
- **Overlap check:** I read Yamabe (main and #2248), RiemannianGeometry (main and #2222), MinimalSurfaces (#2226) and GeometricCurrents (main).
  - The closed-manifold first eigenfunction is owned by RiemannianGeometry R5c.
  - The Green constant A and `m_ADM = 2A` are owned by Yamabe Y6 (`README.md:241`, on main and at #2248).
  - The conformal law is owned by PositiveMass 0.4.
  - The lifting of ends to finite covers is owned by PositiveMass 0.2.
- **Remark (untouched in substance).** At `:1199`–`1200`, the blow-up example uses a G it does not define. Yamabe Y6–Y8 carry its hypotheses (`:1208`).

## Not verifiable

- Witten 1981 (8.2): behind the Springer paywall, and marked uncertified.
- Bartnik 1986 (the attribution in 0.2): waived in the manifest, and cited only by its locator.

## Source issues

- none
