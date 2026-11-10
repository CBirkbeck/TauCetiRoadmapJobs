# Review of ComplexKahlerGeometry (pull request #1234 at e86d496)

**Verdict:** accepted

Incremental re-review of the 47 lines of `TauCetiRoadmap/ComplexKahlerGeometry/README.md` changed since af80ecf. The three findings of the previous review (all P3) are repaired, no repair introduced a defect, the gate passes and `Suggested.lean` (unchanged) elaborates with only its 27 `sorry` warnings. No finding remains.

## Previous findings

- R01 — repaired: `README.md:3389–3395` now states both comparisons with locators, "(Nomizu, Theorem 1, as restated in Angella, Theorem 2.1, p. 5)" and "(Sakane, Theorem 1, p. 189)"; `## References` has the Nomizu entry (`:3571–3573`).
- R02 — repaired: `README.md:2418–2419` reads "(its `dz₁∧dz₂∧dz̄₂` coefficient is `−(i/2)|z|⁻⁴z̄₁`)".
- R03 — repaired: all fifteen fused numerals are spaced ("Theorem 4.29", "item 0", "equal 1", "by 0", "avoid 0", "Dimension 0", "order 0", "at 0", "Layer 4", "from 0", "degree 0", "dimension 1"); the grep of the previous report returns nothing.

## Verified sound

**The changed passages.**
- 8.2 (`:3389–3395`), Nomizu: angella-iwasawa line 256 (Theorem 2.1, on p. 5: page marker at line 220) states that for a nilmanifold `Γ\G` the inclusion of the invariant complex `(∧•𝔤*, d)` into the forms of the quotient is a quasi-isomorphism, and attributes it to its reference [21], Theorem 1; line 973 gives that reference as Nomizu, Ann. of Math. (2) 59 (1954), no. 3, 531–538, as the new `## References` entry does. The README's sentence has the same hypotheses (simply connected nilpotent G, a lattice Γ) and the same conclusion.
- 8.2, Sakane: sakane-parallelisable line 102 (Theorem 1, printed p. 189: running head at line 95) is for a simply connected complex nilpotent G with a lattice and identifies the `(p,q)` Dolbeault cohomology with the degree-q Lie algebra cohomology of the antiholomorphic summand tensored with the p-th exterior power of the invariant holomorphic one-forms. That is the cohomology of the invariant Dolbeault bicomplex 8.2 constructs from the CE complex of `bar(𝔤)`; the nilpotent hypothesis carries over from the first half of the README's sentence. §2 of the paper begins on printed p. 188 (line 85) and the central-series step is on p. 189 (lines 106–115), so "pp. 188–189" in `## References` is right.
- 8.2, conventions: the new sentence uses left-invariant forms on `Γ\G`, Sakane uses right-invariant fields on `G/Γ`; 8.3 (`:3442–3444`) already owns the comparison of the two by inversion, so the two citations do not conflict.
- 6.1 Hopf control: recomputed, see the table.
- The three citations whose numerals were spaced resolve: demailly-agbook line 4842 is (4.29), Cartan's coherence of the ideal sheaf of an analytic set; StableReduction on main has `### Layer 4: blowups and intersection theory on arithmetic surfaces` (`TauCetiRoadmap/StableReduction/README.md:529`), the anchor the link uses; RealAnalyticGeometry on main has R3.2 with its item 0, the coherent module-sheaf carrier (`TauCetiRoadmap/RealAnalyticGeometry/README.md:728`, `:734`).
- The other spacing edits (5.2, 5.4, 6.1 normal coordinates, 7.8) change no mathematics; each sentence was read at this head.
- Seeded sample: of the fifteen sampled sections the diff touches 5.4 (`:1764`, "order 0") and 6.1 (`:2340`, `:2343`, `:2418`). Neither changed sentence carries an external locator. The locators of 6.1 next to them were opened again: demailly-agbook line 15156 ((6.4), p. 305), 15190 ((6.5), p. 306), 15221 ((6.8), p. 306, continuing on p. 307), 15353 ((6.15), p. 309), 16248, 16274, 16281 (VII (1.1)–(1.3)); ballmann-kahler line 1990 (Theorem 4.17).

**Gate, dependencies, elaboration.**
- Gate run again at this head: every scanner 0, `OK`; the worker's run also shows `build=0`.
- Dependency check: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds the same five files as on main.
- `lake env lean` on `Suggested.lean` (15 s): 27 `declaration uses sorry` warnings and nothing else. The file is byte-identical to the one read at af80ecf, so the `#check @name` comparison and the one-tactic probe of the previous report stand. The four binder leads of the signature scan are the three Dolbeault definitions and `lefschetzMap`, which the previous report already found need no finiteness, compactness or boundary hypothesis.
- Headlines: unchanged; the 27 names of the Summary are the 27 theorems of the file.

**Overlaps and the description.**
- The description's merge-order block now gives the shared-folder order "this pull request → #1807 → #1808 → #1854", which settles the description-only point carried from earlier rounds.
- Ids cited here that an open pull request drops: none. Ids only an open revision defines: none. The three former heading anchors (`#k2-…`, `#k5-…`, `#k7-…`) are covered by the old → new sentence at `:365–368`, unchanged.
- Citation scan: no unresolved cross-roadmap citation; the two Lean leads are module paths (`…Distribution.DeltaSeries`, `…AlmostComplex.Eigenbundle`), as in the previous round.
- Ownership against open pull requests: the changed passages introduce no new object; the Nomizu and Sakane comparisons were already owned by 8.2. The conclusions of the previous report on #848 and #992 are unchanged.

**Adversarial pass.** Rows for the changed statements, computed this round:

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 8.2 Nomizu comparison | real torus `ℤⁿ\ℝⁿ`; real Heisenberg; Iwasawa | abelian: CE differential 0, `H^k=∧^k`, `b_k=C(n,k)`; `de₃=−e₁∧e₂` kills one of three, `b₁=2`; `dφ₃=−φ₁∧φ₂` and its conjugate kill two of six real one-forms, `b₁=4` (angella-iwasawa §4.1) | Pass |
| 8.2 Sakane comparison | complex torus; Iwasawa `(1,0)`, `(0,1)`, `(1,1)`, `(0,2)` | `h^(p,q)=C(n,p)C(n,q)`; `H⁰·3=3`; `H¹(bar 𝔤)=2`; `2·3=6`; `H²` of the Heisenberg algebra is 2, so `h^(0,2)=2`; `h^(1,0)≠h^(0,1)` as 8.2 states | Pass |
| 8.2 hypotheses | `G=ℝ`, `Γ=ℤ`; non-nilpotent control | `H¹=ℝ` both sides; for solvable non-completely-solvable quotients the invariant complex can fail (angella-iwasawa lines 262–270), and the README assumes nilpotent | Pass |
| 6.1 Hopf control | `z=(1,0)`; `z=(0,1)` | `d(|z|⁻²)=−|z|⁻⁴Σ(z̄_k dz_k+z_k dz̄_k)`; coefficient of `dz₁∧dz₂∧dz̄₂` is `−(i/2)|z|⁻⁴z̄₁`: `−i/2`; `0`, where the `dz₂∧dz₁∧dz̄₁` coefficient is `−i/2`, so `dω≠0` at every point | Pass |
| 6.1 normal coordinates (spacing only) | `z(w)=w−½Γ(p)(w,w)` | derivative at 0 is the identity, second differential `−Γ(p)(u,v)` | Pass |

Rows carried forward from the review at af80ecf (statements the diff leaves untouched; values as recorded there):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 holomorphy test | `z̄`, `z²`, `|z|²` | `φ_z̄=1`; `0`; `z`, zero only at 0 | Pass |
| 1.3 eigenbundle convention | `u=∂_x` | `(u−iJu)/2=∂_z`, `J∂_z=i∂_z` | Pass |
| `newlander_nirenberg` (1.4) | `n=0`; standard ℂ | discrete M, constant φ; `φ=id` | Pass |
| 2.2 FiniteRankRunge | annulus `{2≤|z|≤3}` in `{|z|<4}`, `f=1/z` | `sup_L|f|=2/3`; `|∮|=2π` over length `4π` gives `≥1/2>2ε/3` iff `ε<3/4` | Pass |
| 2.2 pole pushing | W ⊄ Ω; W ⊆ Ω bounded | `b∈W∖Ω`, `(z−b)⁻¹` holomorphic on Ω; closure of W compact in Ω, excluded | Pass |
| `exists_mixed_parameter_dbar_solution` | `f=1`; `Ω=∅` | `u=z̄`; vacuous | Pass |
| `dolbeault_grothendieck_polydisc` | `r_k≤0`; `n=0` | empty domain; one point | Pass |
| 2.4 `DolbeaultCohomology` | ℂ×, `dz̄/z̄`; `q=0`; `p>n` | `=∂̄log|z|²`, class 0; coboundaries `⊥`; 0 | Pass |
| 2.5 Dolbeault theorem | ℂP¹, `(1,0)` | `h^(1,0)=0` | Pass |
| `weierstrass_preparation`, `_division` | `w²−z`, `w³`; `d=0` | `w³=w(w²−z)+zw`; `u=f` | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f(x)≠0`; `f=z²`, `g=z` | `m=1`; `m=0`; `m=2`, `h=1` | Pass |
| `riemann_extension` | `k=0`; `1/z` | `U=∅`; excluded by boundedness | Pass |
| `hartogs_extension_across_point` | ℂ; ℂ² | `1/z` excluded by `2≤finrank`; extension exists | Pass |
| 3.4 reduced ideal | `{zw=0}` vs `(zw)²` | `Sing={0}`; gradient of `(zw)²` vanishes on V | Pass |
| 4.2 Chern connection | `h=e^(−|z|²)` | `A=−z̄dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy` | Pass |
| 4.3 monodromy | `d−a dz/z` on ℂ× | `M(γ)=e^(2πia)`; inverse convention `e^(−2πia)` | Pass |
| 4.5 exponential sequences | point; elliptic curve; `ℝP²` | kernel ℤ; `H¹(𝒪)=ℂ`; Bockstein injective | Pass |
| 5.1 star and density | `*²`; `x↦−x`; `y=2x` | `(−1)^(k(m−k))`; `|dx|` fixed; `∫φdy=2∫φdx` | Pass |
| 5.2 nonextension | `φ_ε` | `≥C′ε^n exp((1+c)^(−2)ε^(−2))` against `Cε^(−N)` | Pass |
| 5.3 Montel | M a point | `𝕜^r` | Pass |
| 5.4 Bessel symbol | `‖ζ‖=2`; point delta | `5`; `s<−n/2` | Pass |
| 5.6 PlanarTwoForms | `h=1` | `u=z̄/(2i)` | Pass |
| 5.7 realification | `a_+(u,u)=Q+i‖u‖²` | `Re((1−i)a_+)=Q+‖u‖²` | Pass |
| `hodge_theorem_deRham` | S¹; `M=∅`; `m≠dim` | harmonic line; 0; no orientation | Pass |
| 5.9 K5b.0 | `f dz̄` on ℂ | `∂̄*(f dz̄)=−2f_z`, symbol `½|ξ|²` | Pass |
| `finrank_dolbeaultCohomology_serre` | Hopf; `p>n` | `h^(0,1)=1=h^(2,1)`; `hp` needed | Pass |
| 6.1 Kähler identities | `[Λ,d]`, `[L,d*]`; `[Λ,L]` on ℂ | `−(d^c)*`, `d^c`; `1`, `−1` | Pass |
| 6.1 Nakano bound | `e^(−|z|²)` | `[iΘ,Λ]u=2u` | Pass |
| 6.2 planar star | `dz`, `dz̄`; `h=x²+y²` | `*dz=−i dz`; `Δ_H h=−4` | Pass |
| `del_delBar_lemma`, `finrank_dolbeaultCohomology_symm`, `even_…_odd` | elliptic curve; Hopf; annulus | not exact; `0≠1`; `b₁=1` with boundary | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹, `k=2`; finite set | `1`; `|M|` | Pass |
| `hard_lefschetz` | `k=n`; `S²×S²` | identity; `2ab≠0` | Pass |
| Hodge–Riemann sign | `dz`, `dz̄`; `dz₁∧dz₂` | `2dx∧dy`; `4dvol` | Pass |
| 7.1 model comparison | `(3,4)`, `2i(3,4)`; `(1,i)` | `4/3`; i against `−i` | Pass |
| 7.2 Fubini–Study | `w=(1,i)/√2`; `diag(1,2)` | `h(e₁,e₂)=i/(8π)`; `4/π` | Pass |
| projective cohomology (7.3) | `n=0,1,2` | `χ=3` for `n=2` | Pass |
| 7.4 incidence blowup | chart change; `k=1` | `a′=az_k`; `F=0` | Pass |
| 7.5 rational quartic | `n=1`; `n=2` | dimension 4 of 5; `10−9=1` | Pass |
| `finrank_dolbeaultCohomology_complexTorus` | `n=0`; `n=2`; `p>n` | `1`; `6=C(4,2)`; `0` | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; `∅` | `2`, `b₁=4`; `0` | Pass |
| 7.8 FlatDegreeZero | gauge; `ρ(m+ni)=(−1)^m` | `|σ(1)|=1`; `f(z+1)=−f` | Pass |
| `finrank_deRhamCohomology_le_sum_dolbeault` (8.1) | Iwasawa; Hopf; `k>2n` | `4≤5`; `1≤1`; `0≤0` | Pass |
| 8.3 Heisenberg lattice | `x=y=z=1` | `log=X+Y+½Z` | Pass |

Remark on untouched text (no change asked): the `*Needs:*` line of 8.2 (`:3397–3398`) names Angella by §§4.1–4.2 only, while the claim above it now also cites Angella's Theorem 2.1; the line's "at the steps that cite them" covers it.

## Not verifiable

- Nomizu's 1954 paper is recorded as uncertified and was not read; its Theorem 1 is checked in the form and with the attribution of angella-iwasawa line 256.
- Webster, Hörmander, Wells, Griffiths–Harris, Raghunathan and Koszul–Malgrange are uncertified; their locators were not opened.
- The sampled sections the diff does not touch (1.3, 3.2, 3.3, 4.1, 4.4, 4.5, 5.6, 5.7, 5.8, 6.3, 7.5, 7.6, 8.1) were not re-read against their sources this round.
- #1807, #1808 and #1854 were not reopened; the order between them is taken from the description's merge-order block.
- The table rows check instances; they are not proofs.

## Source issues

- none
