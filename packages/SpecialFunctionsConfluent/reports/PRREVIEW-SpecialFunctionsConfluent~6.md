# Review of SpecialFunctionsConfluent (pull request #1995 at d2983b2)

**Verdict:** needs changes

## R01 (P2) — The negative control of 5.3 is false

**Location:** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:1097–1098`, "Without the restriction `|b + n| ≥ δ`, the statement fails along `b = −n + 1/n²` at `a = 1`, `z = 1`, where `M(1, b, 1)` is unbounded by 13.2.5 (1.1)."

**Claim:** `M(1, b, 1)` is unbounded along `b = −n + 1/n²`, so 13.8.1 fails there.

**Witness:** The residue at `−n` is `(−1)ⁿ e/n!` (README:1431–1432), so the polar part is `e n²/n! → 0`. Computed: `M(1, −n + 1/n², 1)` = 0.90989, 0.95249, 0.97562 at `n` = 10, 20, 40; `b (M − 1)` = 0.9002, 0.9501, 0.9750.

**Repair:** Replace the bullet by: "Without the restriction `|b + n| ≥ δ`, the statement fails along `b = −n + 1/(n! n²)` at `a = 1`, `z = 1`: by 13.2.5 (1.1) `M(1, b, 1)` has the residue `(−1)ⁿ e/n!` at `−n`, so `M(1, b, 1) = (−1)ⁿ e n² + O(1)` there." Computed on that sequence: −67.157, 272.738, 1088.265 at `n` = 5, 10, 20 (`(−1)ⁿ e n² + 1` = −66.957, 272.828, 1088.313).

## R02 (P3) — `Suggested.lean` does not state every conclusion the README attaches to a Lean name

**Location:** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:105–106`, "`Suggested.lean` states the headlines that carry a Lean name, each with every conclusion the README attaches to it".

**Claim:** Each named declaration carries all the conclusions its README bullet states.

**Witness:** README:874–876: `regularizedHGFun_eq_kummerU_add` "for every `z ≠ 0` and both signs"; `Suggested.lean:256–262` states the upper sign only. Likewise README:654–655 (`whittakerW_equation`), 666–667 (`differentiable_regularizedWhittakerMLog`), 535, 1245.

**Repair:** Either add the missing statements (the lower sign of 13.2.41, Whittaker's equation for `regularizedWhittakerM`, `Differentiable` for `whittakerWLog`), or replace the sentence by: "`Suggested.lean` states the headlines that carry a Lean name, each in the form its docstring gives; the further conclusions a bullet attaches to the same name are targets stated in prose."

## R03 (P3) — 1.3 uses the Wronskians of 3.2, which need 2.1, which needs 1.3

**Location:** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:562–565`, "The bases are those whose Wronskians (3.2) do not vanish. *Needs:* 1.1, 1.4; AsymptoticExpansions §10.2."

**Claim:** 1.3 needs only 1.1, 1.4 and AsymptoticExpansions §10.2.

**Witness:** README:866: 3.2 "*Needs:* 1.3–1.5, 3.1, 2.1". README:719–720: the proof of 2.1 uses the basis of 1.3 ("so by 1.3 it is `c₁ 𝐌(a, b, z) + c₂ z^{1−b} 𝐌(…)`"). README:732: 2.1 "*Needs:* 1.1–1.4".

**Repair:** Move 13.2.33 into 1.3 (it follows from the two series at `0` and the constancy of `z^b e^{−z} 𝒲`, so it needs 1.1 only) and state there the basis `𝐌`, `z^{1−b} 𝐌(a − b + 1, 2 − b, ·)` for `b ∉ ℤ`. Move the basis `𝐌`, `U` for `a ∉ {0, −1, …}` to 3.2, after 13.2.34. Then 1.3 "*Needs:* 1.1; AsymptoticExpansions §10.2" and 3.2 keeps its line.

## R04 (P3) — A digit of the first Check of 5.3

**Location:** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:1094–1095`, "at `b = 100` the left side is `0.01009 99010…`".

**Claim:** `M(1, 100, 1) − 1 = 0.01009 99010…`.

**Witness:** `M(1, 100, 1) − 1 = 1/100 + 1/(100·101) + 1/(100·101·102) + … = 0.01009 99901 0191…`.

**Repair:** Write `0.01009 99901…`.

## Verified sound

Values are computed at 30 digits from the bodies of the definitions in `Suggested.lean` (bracket, `deriv` in `b` at integer `b`, logarithmic coordinate), not from a library `U`.

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| Definition `kummerULog` (1.4), against an independent `U` | `(a,b,z)` = `(0.3,2,1.7)`, `(1.2,0,0.8)`, `(0.7,−1,2.5)` | 0.949853020452, 0.357409337276, 0.332296919821 | same to 12 digits | holds; `(−1)ⁿ` needed at `b = −1` | none |
| `kummerUBracket_intCast` | `a = 0.3+0.2i`, `w = 0.4+1.1i`, `n` = −2, 0, 1, 3 | `|F|` ≤ 1.3e−31 | 0 | holds | none |
| `regularizedHGFun_neg_nat` (13.2.5) | `a = 0.3+0.2i`, `n = 3`, `z = 1.1−0.4i` | 0.510794190297−0.544830580444i | same | holds | none |
| 1.2 confluence (sampled) | `(0.3+0.2i, 1.4−0.5i, 1.1+0.7i)`, `t = 10⁴` | 1.15645257068+0.469213155779i | limit 1.15647920433+0.469211500418i | README values right | none |
| `kummerU_neg_nat` (1.5, sampled) | `(m,b,z)` = `(2, 0.4+0.3i, −1.3)`, `(3,2,−0.7)`, `(2,−3,−2)` | 5.8+1.32i, −55.423, 2 | same | holds for `z < 0` and integer `b` | none |
| `kummerULog_add_two_pi_mul_I`, integer form (1.5, sampled) | `a = 0.3`, `z = 1.1+0.7i`; `b = 0.45`, `m` = 1, −2; `b = n` ∈ {2, −1, 0, 1} | `b=0.45,m=1`: 3.93639685832+4.03737001331i; `n=2,m=1`: 1.26581137036−1.98384144896i; `n=−1,m=−2`: −7.65731861206−1.14935197621i | same | holds, both signs of `m` | none |
| `whittakerW_equation`, `whittakerW_neg`, `whittakerW_eq_whittakerM_add` (1.6, 3.4, sampled) | `(κ,μ,z) = (0.3+0.2i, 0.35−0.1i, −0.6+0.8i)`; `(0.2, 1, 0.5+0.5i)` | residual 2.9e−31; `W` = 0.864288339651+0.125276240918i | 0; same for `W_{κ,−μ}` and 13.14.33 | holds, integer `2μ` included for the symmetry | none |
| 13.14.7 (1.6) | by 13.2.5 at `b = −n` | `z^{−n/2} 𝐌(−n/2−κ, −n, z)` | `(−n/2−κ)_{n+1} z^{n/2+1} 𝐌(n/2+1−κ, n+2, z)` | equal | none |
| `regularizedHGFun_eq_integral`, `kummerU_eq_integral` (2.1, sampled) | `(0.8+0.3i, 1.9−0.2i, −0.7+1.1i)`; `(1.8+0.3i, 1.7−0.4i, 0.9+0.6i)` | 0.607227012021+0.178539036486i; 0.0766572537418−0.37313405175i | quadrature: same | holds | none |
| `regularizedHGFun_neg_eq_barnes_integral` (2.2, sampled) | `a = 1.3+0.2i`, `b = 0.7+0.4i`, `z = 0.8+0.5i`, `c = −0.6` | 0.0909136792505+0.0562834004442i | line integral: same | holds; factor `(2π Γ(a))⁻¹` right | none |
| 2.3 loops (sampled) | 13.4.10 and 13.4.14 prefactors on the stated phases | `e^{−aπi} Γ(1−a)(e^{2πia} − 1)/(2πi)` | `1/Γ(a)` | reduce to 13.4.1 and 13.4.4 | none |
| `whittakerW_eq_integral` (2.4, sampled) | `(κ,μ,z) = (−1.4, 0.35, 1.1+0.7i)` | 0.0886732829163−0.0785981841837i | quadrature: same | holds; `t ↦ t − 1` gives AutomorphicSpectralTheory §0.26's integral | none |
| Wronskians 13.2.33, 13.2.38; regularized 13.14.25, 13.14.26 (3.2, 3.4, sampled) | `a=0,b=½,z=½`; `(0.4+0.2i, 1.3+0.1i, −0.5+0.8i)`; `(κ,μ,z)=(0.2+0.1i, 0.3−0.2i, 0.7+0.4i)` | 0.7421853304033; 0.0457379602665+0.589504112708i; −0.57491512469−0.158806152399i; −0.711385994265+0.320007234631i | `sin(πb) z^{−b} e^z/π`; `e^{(a−b)πi} z^{−b} e^z`; `−sin(2πμ)/π`; `−1/Γ(½+μ−κ)` | hold | none |
| `tendsto_kummerU_nhdsWithin_zero` | `(a,b)` = `(1, ½)`, `(0.7, 0)`, `(0.7, −2)`, `(−2, 0.3)`, `(−0.5, −1.5)` at `z = 10⁻⁹` | 1.99989, 1.1005474, 0.47954135, 0.39, 1.3293404 | `Γ(1−b)/Γ(a−b+1)`: 2, 1.1005474, 0.47954135, 0.39, 1.3293404 | holds in both exceptional cases | none |
| `regularizedHGFun_eq_kummerU_add`, and the lower sign | `(0.3, 0.45, 1.1±0.7i)`, `(0.3+0.2i, 1.45+0.1i, −1.1+0.7i)`, `(0.3, 2, −1.3)`, `(−1, 1, 0.4+0.3i)` | 0.94558255456±0.602358436009i; 0.861689027841−0.0194453745987i; 0.848706219845; 0.6−0.3i | same, each sign | holds on all of `z ≠ 0` | R02 |
| `kummerU_eq_cpow_mul_kummerU`, `hasDerivAt_kummerU`, `kummerU_kummer_equation` | `(0.3+0.1i, 2, −0.5+0.9i)`, `(0.7, 0.2+0.3i, −1−0.2i)`, `(1.2, 0, 0.8+0.1i)` | `U′`: 0.387504988367−0.00970878189781i; equation residual ≤ 5.5e−32 | `−a U(a+1,b+1,z)`: same; 0 | hold | none |
| 4.2: 13.15.24 at `n = 1`; Buchholz (5.43) (sampled) | `κ=½, μ=0`; `(0.2+0.1i, 0.3−0.2i, 0.7+0.4i)` | `−e^{−z}`; −0.155500323842+0.038478798659i | `−e^{−z/2} z^{−1} W_{1,1/2}`; `−z^{κ−1} e^{−z/2} W_{κ+1,μ}`: same | hold | none |
| `tendsto_convs_regularizedHGFun_div` (4.3, sampled) | `(−2, ½, 1)`, `(0, 1, 1)`, `(0.3+0.4i, −0.5+0.2i, −2+1.5i)`, `(0.7, 2.5, −6)`; 80 convergents | −5, 0.581976706869, −0.772274573176−0.396488487138i, 2.85115241064 | same | holds; terminating cases are DLMF's excluded ones and hold | none |
| `isBigO_kummerULog_sub_sum` | `a = 0.4+0.3i`, `b = 1.2−0.5i`; `Im w` = 0, 1.4π; `N` = 0, 2, 4; `|z|` = 20, 40 | ratio to `e^{−(a+N)w}`: 1.007, 1.004; 0.394, 0.409; 1.92, 2.08; at 1.4π: 1.018, 1.008; 0.760, 0.442; 123, 2.63 | bounded | consistent | none |
| `isBigO_regularizedHGFun_sub_sum_cobounded` (5.3, sampled) | `a = z = 1`, `n = 1`; `b = 100`; `b = −m + 1/m²`; `b = −m + 1/(m! m²)` | 0.0100999901019; `b(M−1)` → 0.9002, 0.9501, 0.9750; `M` = −67.2, 272.7, 1088.3 | `1/b + O(b^{−2})`; bounded; unbounded | statement right; two Checks wrong | R01, R04 |
| 6.1 real forms | `s = 2`, `x = 1.3`; `x = 1` | 2.3; 0.757872156141 | `e^x Γ(2, x)` = 2.3; `√π e erfc 1` | hold | none |
| `kummerU_airyAi`, `airyAi_eq_whittakerW` | `z` = 0.8+0.4i, −0.3+0.9i, −0.4−1.2i (`ph z` = ±0.602π) | 13.6.11: −0.558533451566−0.69655277734i; `Ai`: 0.469543158766−0.280052650469i | same; the local `airyAi` agrees with `Ai` | hold up to near the edge `2π/3` | none |
| `whittakerW_zero_eq_besselK`, `besselK_eq_kummerU` | `(ν,z)` = `(0.3, 0.8+0.4i)`, `(0.3+0.6i, −0.8+0.4i)`, `(1, −0.2−0.9i)`, `(0, 0.5+0.1i)`, `(−2, 0.5+0.6i)` | 0.393257052191−0.156124529415i; 3.1218473731−0.696847734897i; 0.412003496238+1.25689226644i; … | same; the local `besselK` agrees with `K_ν` at integer `ν` | hold on the slit plane | none |
| `hasSum_regularizedHGFun_buchholz`, `buchholzCoeff` | `(0.2−0.5i, 1.4+0.4i, −1.2+0.3i)`, `(0.65+0.2i, −2, 1.3−0.4i)`, `(−1, 0, 2.5)`; 100 terms | 1.18529228393+0.467812162689i; 3.20500522734−2.77772827304i; −2.5 | `𝐌(a,b,z)`: same | holds at `b ∈ {0, −1, …}` too | none |
| 6.3 `p_s^{(μ)}` | `μ = 0.3`, `z = 1.7`, Taylor coefficients of 13.24.3 | 0.481666666667, −0.0766652777778, −0.166977554784 | README's `p₁`, `p₂`, `p₃`: same | hold | none |
| `kummerU_parabolicCylinderU`, `parabolicCylinderU_eq_whittakerW`; 13.6.14, 13.6.18, 13.18.17 | `(a,z)` = `(0.7+0.2i, 0.9+0.8i)`, `(−1.5, 0.3−2i)`, `(−0.5, 1+1.7i)`; `α=0.4, n=2, z=0.7+0.2i` | 0.804997627836−0.486304640597i; 0.212132034356−1.41421356237i; 1; 0.289109831941−0.357947547805i (three members) | same; the local `parabolicCylinderU` agrees with Weber's `U` | hold | none |
| `kummer_quadratic_relation` | `(0.3, 0.45, 0.8+0.5i)`, `(0.3+0.7i, −1.45+0.2i, −2.8+0.5i)` | 1 − 4.9e−32 i; 1 − 2.0e−31 i | 1 | holds; the `+z` variant gives 1.15220492813−0.302662749008i | none |
| `integral_cpow_mul_regularizedHGFun_neg`, 13.10.11 (8.1, sampled) | `(a,b,s) = (1.6+0.3i, 0.4−0.7i, 0.7+0.2i)`; `(1,2,½)`; `a=b=1, λ=½` | −2.36024945562−0.57943710031i; 3.544907701811; 5.568327996832 | same; `2√π`; `π^{3/2}` | hold | none |
| 8.2 (sampled) | 13.10.12–13.10.16 against DLMF's hypotheses | `Re a > 0` (13.10.12); `x > 0` and the parameter ranges of 13.10.13–13.10.16 | README: "for `x > 0` with DLMF's hypotheses" | agree | none |
| Zero counts 13.9.1–13.9.6 as stated in `Suggested.lean` | sign changes of `𝐌(a,b,·)` on `(0, 80]` at 16 pairs | `(−2.5,0.7)` 3; `(0.5,−0.5)` 1; `(0.5,−2.5)` 1; `(0.5,−3.5)` 0; `(1.7,−4.3)` 1; `(−1.5,−2.5)` 1; `(−2.3,−5.4)` 1; `(−2,−4.5)` 0 | corrected formulas: same; printed 13.9.6 gives 1 at `(−2,−4.5)` | hold; the exclusion `a ∉ −ℕ` is needed | none |
| 9.1 `b`-zeros; 9.2 counterexample | zero of `M(1, ·, 1)` near −10; `U(½+i, 1+2i, 2x)` at `x = 0.37` | −10.0000008232662703; 0.4080610216+0.126722331i | README: −10.00000 08232 66…; `π^{−1/2} e^x (2x)^{−i} K_i(x)`: same | hold | none |
| `kummerU_ne_zero` (Wimp) | `a = −1`: zero `z = b < −1`; `a = −2`: zeros `(b+1) ± √(b+1)`, `b < −3`; 400 random samples in the sector | `ph z = π`; real part `b + 1 < −2`; no sign of a zero | outside `|ph z| ≤ π/2` | consistent | none |
| 9.3 (sampled) | §13.22 | zeros of `M_{κ,μ}` away from `0` | zeros of `M(½+μ−κ, 1+2μ, ·)` | as DLMF §13.22 | none |

- Previous finding R01 (LaguerreJacobi labels `A1`, `B3`): repaired. README:406–407 now reads "The Laguerre polynomials `L_n^{(α)}` (§1.1) and their orthogonality for `−1 < α` (§2.3)"; lines 186, 1280 and 1467 and the description cite §1.1 and §2.3, which exist at that roadmap's head (`### 1.1 Definition and degree`, `### 2.3 The orthogonality relation`).
- Source locators checked against the text: about 90 DLMF equations and passages of Release 1.2.8 (§§13.2, 13.4–13.6, 13.8–13.11, 13.14–13.18, 13.20, 13.22, 13.24), all agreeing with the README's hypotheses; 7 Whittaker–Watson locators (§§16.11, 16.2, 16.3, 16.31, 16.41, 16.5, 17.71, with pages and the `cos nπ` factor of `K_n`) against the public-domain 1920 third edition, whose section numbers and pages agree with those cited.
- Library declarations opened at the pins: `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:82, 192, 414, 428, 485`; `TauCeti/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:47, 53`; `IncompleteGamma.lean:115` (unregularized, `0` for `s ≤ 0`); `Erf.lean:61, 64`; `BesselI.lean:81`. Neither pin has Kummer's `U`, a Whittaker function, `K_ν`, `Ai` or Weber's `U`. The 52 `#check` lines elaborate.
- Cross-roadmap citations resolved (34): QuantumFoundations §§9.4, 9.5 and AutomorphicSpectralTheory §§0.26–0.28, LaguerreJacobi §§1.1, 2.3, SpecialFunctionsBessel Conventions, Layer 1, 5.1, 8.1, 10.1 at their open heads; on main AsymptoticExpansions Conventions, §§4.2, 4.3, 8.1, 8.2, 8.6, 10.2–10.4, SpecialFunctionsParabolicCylinder §§1.1–1.6, 6.7 and Conventions, SpecialFunctionsEiLiErfIncompleteGamma §§2.2, 4.1, 11.4, SpecialFunctionsHypergeometric (README:1136–1138). The four local copies `besselI`, `besselK`, `airyAi`, `parabolicCylinderU` agree with the suppliers' pinned definitions and, numerically, with the functions.
- Gate at `d2983b2`: every counter `0`, `build=0 OK`; `depcheck: 254 roadmaps, 2402 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; no file outside the folder is changed. `lake env lean` on `TauCetiRoadmap/SpecialFunctionsConfluent/Suggested.lean`: exit 0, 43 warnings, all `declaration uses sorry`. One-tactic probe (`simp`, `simp` with the definitions unfolded, `rfl`) on a scratch copy: none of the 43 theorems closes. The file has no section variable; the 56 elaborated signatures were compared with the README (differences: R02).
- The pull request's title and description read against the head: 9 layers, 43 theorems and 43 warnings, the three Tau Ceti imports, the supplier paragraphs (LaguerreJacobi §§1.1, 2.3 included) and the six corrections to DLMF agree with it; it says that it adds the roadmap.
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsStruve, SpecialFunctionsGeneralizedHypergeometric (open) and SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry, SpecialFunctionsHypergeometric (main); shared objects: `I_ν`, `K_ν`, 10.39.5, Sturm comparison owned by SpecialFunctionsBessel; `𝐌` basics and Weber's `U` by SpecialFunctionsParabolicCylinder; Kummer's second transformation by SpecialFunctionsAiry 1.7; all cited here. The confluence `₂F₁ → ₁F₁` is also the case `p = q = 1` of SpecialFunctionsGeneralizedHypergeometric §2.1 (its README:477–482, for `b ∉ {0, −1, …}`); this roadmap is earlier in the merge order and owns the regularized form 1.2 for every `c`.
- Source independence: 11 passages compared with 2 sources (DLMF Chapter 13, Whittaker–Watson), none shared beyond formulas and phrases of under six words; largest share DLMF Chapter 13, about 530 of about 715 locators; contents compared with DLMF Chapter 13: independent (Layers 1–9 correspond to §§13.2(i)+13.14(i), 13.4+13.16, 13.2(ii)–(vii)+13.14, 13.3+13.5+13.15+13.17, 13.7+13.19, 13.6+13.11+13.18+13.24, 13.12+13.13+13.25+13.26, 13.10+13.23, 13.9+13.22: neither one to one nor in the source's order). The contents of the eight books that could not be read were not compared.

## Not verifiable

- Buchholz, Olver, Temme, Lebedev, Andrews–Askey–Roy, Beals–Wong, Kristensson, Magnus–Oberhettinger–Soni: no legal copy found (the sources service reports paywalled or no source); their about 180 page locators, among them those of the sampled 1.2, 1.5, 1.6, 2.1–2.4, 3.2, 3.4, 4.2, 4.3, 5.3, 8.1, 8.2, 9.3, were not read. Each sampled statement was checked against DLMF instead.
- Whittaker–Watson, fourth edition (1927): read in the third edition (1920) only.
- Wimp (1965): the AMS archive page did not serve the text; the statement was checked against DLMF §13.9(ii), which states it with the same hypotheses. Gautschi (1967): paywalled.
- The printed Bessel form of 13.11.3 at the README's counterexample (README:1210–1212): only the left side, `1.18529 22839… + 0.46781 21627… i`, was recomputed.

## Source issues

- **Error** in DLMF Chapter 13 (Release 1.2.8) at 13.9.3 and 13.9.4, §13.9(i): the source gives a positive number of positive zeros for `a ≥ 0`; it should be `a > 0`, since `M(0, b, x) = 1`; affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at 13.9.6, §13.9(i): the source imposes only `⌈−b⌉ > ⌈−a⌉ > 0`; it should also exclude negative integers `a` (`M(−2, −4.5, ·)` has no positive zero, the formula gives 1); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(i), last sentence: the source says `M(a, b, z)` has finitely many `b`-zeros; it should restrict to `b` away from the poles (`M(1, b, 1)` vanishes near `−10.00000082`, and near every large even `−n`); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(ii), first sentence: the source says `U(a, b, z)` has finitely many zeros in the sector for complex `a`, `b`; it should bound `|z|` away from `0` (`U(½+i, 1+2i, 2x)` is a multiple of `K_i(x)`); affects a stated result.
- **Error** in DLMF Chapter 13 (Release 1.2.8) at §13.9(i), the paragraph after 13.9.9: the source extends the closed zero-free regions to the partial sums; it should take the interior (`1 + z` vanishes at the vertex `−1` of `P₁`); affects a stated result.
- **Gap** in DLMF Chapter 13 (Release 1.2.8) at 13.9.1 and 13.9.2, §13.9(i): the source allows `b = 0`, where `M(a, 0, x)` is not defined; it should be `b > 0`; affects a stated result.

## For the human reviewers

- **Licence.** README:1544–1570 and the description name B. Braams' `lean-DLMF` (Apache-2.0, the pull request author's repository) as source material for most layers; `Suggested.lean` was not compared with that repository.
- **Not tested.** Eight of the ten books the README cites could not be read (listed under "Not verifiable"); the wording and the arrangement were compared with DLMF Chapter 13 and Whittaker–Watson only.
