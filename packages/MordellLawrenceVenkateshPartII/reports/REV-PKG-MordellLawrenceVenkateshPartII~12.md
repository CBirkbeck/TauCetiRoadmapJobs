<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6913309455 -->
Review (claude) of abba9ce

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) four "consumed in" lists of the supplier contracts disagree with the `*Needs:*` lines

   **Location.** `README.md:296–298` (From TauCetiRoadmap.MordellLawrenceVenkatesh): "§1.2: Faltings's
   finiteness lemma … consumed in §§2.9, 7.3 and 7.6." Also `README.md:325–326` ("§6.7 … consumed in
   §10.5"), `README.md:327–328` ("§§8.2–8.3 … consumed in §§1.7 and 4.3") and `README.md:458–462`
   ("§§8.1–8.2 … Consumed in §§0.5, 0.7, 1.2 and 7.5").

   **Claim.** Each list names the sections that consume the supplier section. §7.6 no longer consumes
   MordellLawrenceVenkatesh §1.2, and three lists omit a section whose `*Needs:*` line names the supplier
   section.

   **Witness.** `README.md:2540` (§7.6): "*Needs:* §§2.7, 2.9, 7.3, 7.5; DeligneWeightsAndPurity §§4.3–4.4."
   `README.md:1869` (§4.3) names SheafConvolutionOnAbelianVarieties §6.7; `README.md:3147–3148` (§10.5)
   names its §8.3; `README.md:630` (§0.1) names PadicHodgeTheory §§8.1–8.2.

   **Repair.**

   1. `README.md:298`: replace "§§2.9, 7.3 and 7.6" by "§§2.9 and 7.3, and through §2.9 in §7.6".
   2. `README.md:326`: replace "consumed in §10.5" by "consumed in §§4.3 and 10.5".
   3. `README.md:328`: replace "consumed in §§1.7 and 4.3" by "consumed in §§1.7, 4.3 and 10.5".
   4. `README.md:462`: replace "Consumed in §§0.5, 0.7, 1.2 and 7.5" by "Consumed in §§0.1, 0.5, 0.7, 1.2
      and 7.5".

   Tested: a script collected, for every `*Needs:*` line, the supplier sections it names. After the four
   replacements each "consumed in" list of the contracts equals the set of subsections whose `*Needs:*` line
   names that supplier section (MordellLawrenceVenkatesh §1.2: §§2.9, 7.3; SheafConvolutionOnAbelianVarieties
   §6.7: §§4.3, 10.5; §8.3: §§1.7, 4.3, 10.5; PadicHodgeTheory §§8.1–8.2: §§0.1, 0.5, 0.7, 1.2, 7.5). The
   other contract lists already agree. No statement, `*Needs:*` line or Lean declaration changes.

One finding, P3. The four repairs of round 11 are complete and correct, `Suggested.lean` elaborates with
`sorry` as its only warning, neither sorried theorem is padding, the dependency check is clean and every
supplier citation resolves at the current heads. What remains is a bookkeeping disagreement inside the
README: four "consumed in" lists of the supplier contracts no longer agree with the `*Needs:*` lines, one
of them because the round-11 repair of §7.6 changed its route. `README.md` below means
`packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~11), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) §5.8 without field, crystallinity, purity | `README.md:2148–2165`: "`ρ₀ : G_ℚ → G(ℚ_p)` be continuous, G-completely reducible (§2.3), crystalline at `p` (§2.6), pure in the sense of §5.4 … composite with `G → Aut_(ℚ_p)(E_et)` is the Galois action"; two Checks at `2183–2192`; Source corrections entry at `3337–3341`; §2.11 owns the bijection at `1526–1529` | Repaired. The added tensor isomorphism between the two `D_cris` fibre functors is needed for "the same type" to have a meaning, and exists (row §5.8 below). |
| F02 (P2) §7.5 without monodromy; §§7.3, 7.5 without a setting | `README.md:2419–2429` (§7.3 names `𝒴`, `π`, `V`, `GAut`, `h`, `φ_crys,ℓ`); `2476–2485` (§7.5: "assume that the Zariski closure of the geometric monodromy of `V` contains `Aut(V, ⟨ , ⟩)°`"); route `2488–2495`; Check `2502–2508` | Repaired. |
| F03 (P3) §5.5 "the given semilinear coefficient structure" | `README.md:2075–2078`: "In the setting of §2.1, with `G` the semilinear coefficient normalizer of `V` and `σ ∈ Aut_(E₀)(E)` … `φ ∈ G(E₀)` σ-semilinear … `φ ∈ P_f(E₀)`"; `*Needs:*` at `2098`; §5.11 anchored at `2250` | Repaired. |
| F04 (P3) forward `*Needs:*` inside a layer | `README.md:582–584`: "Inside a layer the subsections are grouped by topic and the `*Needs:*` lines give the order: §2.11 comes before §§2.3 and 2.9, and §§8.2–8.4 come before §8.1." | Repaired. A scan of all 79 `*Needs:*` lines finds exactly these three forward references, no cycle and no reference to a missing subsection. |

Pattern search on the repaired patterns. A statement without its setting: none left (§§2.2, 4.4, 5.5,
5.11, 5.12 say "In the setting of §2.1"; §§7.5, 7.7 name §7.3, §7.6). A route input with no owner: the
new §2.11 bijection is consumed only in §5.8, which lists §2.11. A stale consumer list left by a changed
route: R01.

### Coverage

Read in full this round: the README (3371 lines, eleven layers, 79 subsections), `Suggested.lean`,
`metadata.toml`, `sources.toml`, the gaps of `design/plan.json`, the previous review and repair report,
the maintainer notes, and the overlap, citation, signature and library-match files. Every layer ends
with Examples and Dependencies; all 79 subsections have a `*Needs:*` line and a `**Checks.**` block of at
least three bullets. A scripted search finds no LaTeX delimiter, pull-request number, machine path, HTML
anchor, process word, `set_option` or `lemma` declaration (the six hits of "lemma" are prose). The six
backticked names the README attributes to this roadmap are the six declarations of `Suggested.lean`.

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.2 | LS lines 1903–1915 (Definitions 5.3–5.5, p. 42) | Lattice on the Betti system, polarization of the pure variation, integral Weil numbers at the étale and crystalline points. Supported; the README's three separate predicates are its own arrangement. |
| 0.3 | LS lines 1981–2005 (Definition 5.11, pp. 43–44; Lemma 5.12, p. 44) | Four compatible maps; Tannakian with the Betti fibre at a complex point. Supported; the README's route through strictness of mixed Hodge structures is its own. |
| 0.6 | LS lines 1916–1925 (Definition 5.6, p. 42), 2899–2901 | Differential Galois group of `V_dR`, the Zariski closure of monodromy. Supported. |
| 1.6 | LS lines 2249–2260 (Lemma 5.28, p. 49) | Rank-one `ℚ[μ_r]`-module system on the abelian scheme over the splitting ring. Supported. |
| 1.7 | LS lines 2205–2218 (§5.5, p. 48), 2261–2365 (Lemma 5.29 and proof, pp. 49–51) | Orbit under `Gal_ℚ × Gal(ℚ[μ_r]/ℚ)`, decomposition after base change, polarization and lattice by restriction and intersection. Supported; concentration in degree `n − 1` is the README's added hypothesis for the rank (see Source issues for the rank of `E_I`). |
| 2.11 | LS lines 3572–3574 (proof of Lemma 8.10, p. 78); Serre not read (uncertified) | The bijection `H¹(ℚ_p, P) → H¹(ℚ_p, L)` is the step cited. The two Serre locators are settled. |
| 3.3 | LS lines 2958–2978 (Lemma 6.3, pp. 64–65); LV lines 2673–2690 (Corollary 9.2, printed p. 964) | Codimension at least `dim X` gives components inside proper subvarieties; LS takes `(G_mon/P)_ℂ` as compact dual. Supported. |
| 3.4 | LS lines 2979–3077 (Theorem 6.4, pp. 65–67); LV lines 2706–2712 (Lemma 9.3, printed p. 965) | Number field `K`, residue disk, codimension at least `dim X`, not Zariski dense. Supported. |
| 5.1 | LS lines 3382–3396 (pp. 74–75; `ι_GM` at line 3391); LV §§11.1–11.2 at lines 3470, 3535 (printed pp. 984, 986) | `a_S`, the weight class, the inclusion from centres, the modular character as inverse determinant on `Lie P`. Supported. |
| 5.2 | LS lines 3366–3381 (Lemma 8.2, Definition 8.3, p. 74); LV Lemmas 11.1–11.2 at lines 3559, 3590 (printed pp. 986–987) | A splitting cocharacter in `P`, independence of the projection. Supported. |
| 5.7 | LS lines 3668–3684 (Lemma 8.14, p. 80) | Semisimple `φ` normalizing `P` is `P`-conjugate into the normalizer of `M`; equivalently a `U`-conjugate of `M` is φ-stable. Supported, with the README's restriction to `Z_U(φ^r)`. |
| 7.2 | LV lines 3182–3220 (proof of Lemma 10.4 and footnote 11, printed pp. 977–978) | The Zariski closure of the local image contains a group becoming the Hodge torus; Sen, Wintenberger, Pink. Supported, as a gap asked of PadicHodgeTheory. |
| 7.3 | LV lines 3113–3122 (Lemma 10.4, printed p. 975), proof 3144–3251 (printed pp. 976–978) | `ℓ ≤ L`, `ℓ ∉ S`, centralizer of the semisimplified crystalline Frobenius at most `dim Z_(G′(ℂ))(φ₀) = h⁰`. Supported. |
| 8.7 | LV lines 2929–2971 ((10.6)–(10.8), printed pp. 970–971) | `h^(p,q) ∼ dⁿA(n, p)/n!`, `h^p ∼ d^(2n)β_p/2`, `dim Y/h⁰ → 0`. Supported, with the parameter dimension corrected. |
| 10.8 | LS lines 3900–3902 (p. 85), 4003–4012 (p. 87), 4022–4024 (p. 87) | Finitely many `A(K)`-orbits for primitive hypersurfaces; isogeny and quotient defined over `K`. Supported for primitive `H`; the cokernel statement for `T ≠ 0` is the README's own and is proved by its route (row below). |

No locator is flagged by the author as unverified. Also read: LS lines 2187–2204, 2366–2420, 3330–3350,
3460–3472, 3505–3520, 3545–3601, 3605–3657, 3687–3700, 3876–4057; LV lines 2853–2920, 2980–3064,
3095–3143, 3255–3345.

### Adversarial pass (sampled targets, headlines, repaired text, target of the finding)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.2 | unit; `ℚ(−1)`, `ℚ(1)`; rank one on `𝔾_m` with monodromy 2 | eigenvalue 1; `q` integral, `q⁻¹` not; a lattice stable under `2` and `1/2` would be a finitely generated `ℤ[1/2]`-module of rank 1: none | Sound |
| §0.3 | `ℚ(0) ⊕ ℚ(−1) → ℚ(−1)`; identity `ℚ(0) → ℚ(−1)`; two components | `dim(im ∩ F¹) = dim f(F¹) = 1`, `dim(im ∩ W₀) = dim f(W₀) = 0`; `1` against `0`, and `W₀ = ℚ` sent into `W₀ = 0`; fibre at one component kills a map supported on the other | Sound |
| §0.6 | constant system; `SL₂`; finite group | group 1; dimension 3, not 4; finite group is its own closure | Sound |
| §1.6 | trivial `χ`; order 3; `p = 5`, order 4 | rank one constant; `[ℚ(μ₃) : ℚ] = 2`; `[r]_*ℚ` has rank `r^(2g)` = number of characters of `A[r]`, one rank-one summand each | Sound |
| §1.7 | singleton orbit; two idempotents, `N = 6`; trivial `χ` | `E_I = ℚ`, rank `N`; `2·6 = 12`; `|I| = [K : ℚ]`, not `[K : ℚ]·φ(r)` | Sound |
| §1.9 Check | `C₃`, `e = (2 − γ − γ²)/3` | `e² = (6 − 3γ − 3γ²)/9 = e`; `(γF)² = γ·γ⁻¹·F² = F²` | Sound |
| §2.3 Check | `O₂ = O(xy)` over `ℚ₃` | `diag(a, a⁻¹) r_b diag(a, a⁻¹)⁻¹ = r_(a²b)`; classes of `b` in `ℚ₃^×/ℚ₃^(×2)`: 4 | Sound |
| §2.11 finiteness | `μ₂`; tori of `GL₂` over `ℚ₃` | `ℚ₃^×/ℚ₃^(×2) = {1, −1, 3, −3}`, 4 classes; `ℚ₃ × ℚ₃`, `ℚ₃(√2)`, `ℚ₃(√3)`, `ℚ₃(√6)`: 4 = `|H¹(ℚ₃, N)|`, while `H¹(ℚ₃, T) = 1` | Sound |
| §2.11 bijection (new) | `𝔾_a ⋊ μ₂` over `ℚ₃`; Borel of `GL₂`; `ℤ/p` over `𝔽_p`; `L = 1` | 4 = 4; 1 = 1; `p` against 1 in characteristic `p`; `H¹(F, U) = 1` | Holds in characteristic 0; negative control present |
| §3.3 | `W = X × Z`; curve with varying plus constant elliptic `H¹` | `dim U ≤ (d + dim Z) + d − (d + dim D_mon) = d − codim Z ≤ 0`; in `X × D_mon`: `1 ≥ 0 + 1`; in `X × LGr`: `3 ≥ 2 + 3` false | Sound; the ambient must be `X × D_mon` |
| §3.4 | `Z = D_mon`; `d = 0`; germ ideal `(xy)` | `Φ_p⁻¹(Z) = Ω`, dense; a point is dense; `x^m ↦ x^m ≠ 0` in `ℂ{x, y}/(y)`, so no power of `x` is in `(xy)` | Sound |
| §5.1 | Borel of `GL₂`, `μ = diag(t, 1)`; `GL₂ ⊃ T` | `det(Ad | Lie B) = a/b`, `γ_P = a⁻¹b`, pairing `−1`; `ι(a) = (a, a)`, `pr(x, y) = (x + y)/2`, `pr ∘ ι = id` | Sound |
| §5.2 | two `P`-valued splittings `μ`, `μ′` of `F` | `μ′ = p⁻¹μp` and `μ′ = q″μq″⁻¹` give `p ∈ P ∩ Q`, whose image in `M` lies in `P_M(μ̄)`: same filtration on `M`; `SL₂`: the two fixed points of `ℙ¹` lie in different Borel orbits | Sound |
| §5.5 (repaired) | `E = E₀`, `GL_n`; `E₀ × E₀`, swap | filtered space with automorphism and stable flag; `φ` swaps the factors | Determines its object |
| §5.7 | `diag(2, 1)` in the Borel of `GL₂`; central `φ` | `(2^r − 1)u = 0` forces `u = 0`, `Z_U(φ^r) = 0`; Levi already stable | Sound |
| §5.8 (repaired) | `GL₂`, `ℚ_p ⊕ ℚ_p(−1)`, Kummer class of 2; `ρ₀` G-irreducible; lifting of a torsor isomorphism | weights 0, 2: outside the hypothesis; degrees 0, 1 against `1/2`; minimal parabolic is `G`, one object; `Isom_P → Isom_L` has fibres torsors under a twist of `U`, with a rational point since `H¹(ℚ_p, U_c) = 1`: the tensor isomorphism can be taken to match the Levi data | True as stated |
| §6.1 route | Levi projection of `ρ` | `π(λ(t)gλ(t)⁻¹) = π(g)` on `G → Aut(E)`; same characteristic polynomials | `ρ₀` meets §5.8 |
| §7.2 Check | ordinary elliptic curve; `ℚ_p(−1)` | `H¹`: unramified sub of weight 0, quotient of weight `−1`; closure of inertia contains `diag(1, s)` up to unipotent conjugacy; `χ_cyc⁻¹(G_(ℚ_p)) = ℤ_p^×`, dense in `𝔾_m` | Sound |
| §7.3 (repaired) | `GSp_(2g)` regular; `r = 2` | torus of dimension `g + 1`; `λ ↔ ℓ²/λ`; `GL`-finiteness suffices here: "very regular" is a `GL`-conjugation invariant (LV line 3153) | Sound; §1.2 is rightly kept in §7.3 |
| §7.5 (repaired) | `z ≤ h⁰`, `e = d`; constant family over `𝔸¹` | `A ≥ h⁰ + d ≥ z + d`; `h⁰/2 + z + d ≤ 3h⁰/2 + d ≤ A + h⁰` since `A ≥ h⁰/2 + d`; `T` flat on `[A, A + h⁰]`; `y₀ + ℓℤ[S⁻¹]` infinite, dense, excluded because `Aut°` has positive dimension when `A ≥ 1` | Sound; agrees with LV (10.4)–(10.5) |
| §7.6 route (repaired) | `E = E₀ = ℚ_ℓ`; primitive part | normalizer is `GAut`; `P_r(t)/P_(r−2)(ℓt)` is a quotient of integer polynomials with constant term 1 and algebraic-integer roots: in `ℤ[t]` | §2.9 applies |
| §7.7 | `dim C = d′ ≤ d` | `T(h⁰ + d′) + T(3h⁰/2 + d′) ≤ T(h⁰ + d) + T(3h⁰/2 + d) < B` | Sound |
| §8.4, `eulerian_central_mass_le_half` | `n = 1, …, 12` by the recurrence | `2 > 1`; `4 ≤ 4`; `36 ≤ 36`; `488 ≤ 576`; `11420 ≤ 14400`; `377816 ≤ 518400`; `17405640 ≤ 25401600`; `1049776080 ≤ 1625702400`; `80786169900 ≤ 131681894400`; then `7.7·10¹² ≤ 1.3·10¹³`, `8.9·10¹⁴ ≤ 1.6·10¹⁵`, `1.2·10¹⁷ ≤ 2.3·10¹⁷`; second moments `1/2, 2/3, 1, 5/3` at `n = 2, 3, 5, 9` equal `(n + 1)/6` | True; `n ≥ 2` needed |
| §8.6 | `(n, d) = (2, 3), (3, 4), (4, 5), (3, 3), (5, 4)` | `(1, 1)`; `(1, 19, 1)`; `(1, 101, 101, 1)`; `(0, 6, 0)`; `(0, 21, 141, 21, 0)` | Sound |
| §8.7 | `n = 2, 3, 4`, `d = 50, 400`; plane quartics and cubics | ratios `h·n!/(dⁿA(n, p))`: `0.941 → 0.993` (`n = 2`), `0.884, 0.941 → 0.985, 0.993` (`n = 3`), `0.814, 0.912 → 0.975, 0.989` (`n = 4`); `binomial(6, 4) − 1 = 14` against 19; cubics 9 and 9 | Sound |
| §9.3 headline (Lean) | `G = 1`; `G = 0`; zero form | `G = 1` leaves "no form has good reduction", not closed; `G = 0` refused by `G ≠ 0`; the zero form fails `IsSmoothHypersurface` (proved on the scratch copy) | Not vacuous, not padding |
| §10.8 | `T = 0`; `T = ⟨P⟩` of order 2; `T = E[2]` | identity, trivial quotient; `[m]` on `A/T` is `π ∘ π′` for `m = |T|`, so `m(A/T)(K) ⊂ π(A(K))` and the quotient is a quotient of `(A/T)(K)/m(A/T)(K)`, finite; `E(K)/2E(K)` | Sound |
| §§10.6, 10.9 | `D₁`; `d = 17710` | `binomial(25, 5)/6 = 8855`; `6D_j | φ³ = 6d` iff `D_j | d`; `17710` allowed in §10.6, excluded in §10.9 | Sound; LS lines 3885–3889, 4014–4019, 4036 |
| R01: contract lists | all 79 `*Needs:*` lines | MordellLawrenceVenkatesh §1.2 named by §§2.9, 7.3 only; SheafConvolutionOnAbelianVarieties §6.7 by §§4.3, 10.5; §8.3 by §§1.7, 4.3, 10.5; PadicHodgeTheory §§8.1–8.2 by §§0.1, 0.5, 0.7, 1.2, 7.5 | Four lists differ: R01 |

Further Checks recomputed while reading: §0.5 `((1 − τ)/2)² = (1 − τ)/2`; §1.2 `ℚ[C₃] ≅ ℚ × ℚ(ζ₃)`; §2.2
`(x, y)` commutes with `(a, b)∘swap` iff `y = a⁻¹xa` and `x` commutes with `ab`; §2.5 adjoint weights
`1, 1, 2` and `1, 4, 5`; §2.7 `T(1/2) = 1`, `T(1) = T(2) = 2`, `T(3) = 0`; §2.10 thirteen ordered set
partitions of three elements; §3.2 `(3 ± 4i)/5` has minimal polynomial `x² − (6/5)x + 1`; §5.6
`ψ(v) − v = (2, 0)` for `v = (−1, 0)`; §8.2 `β = (1/36, 2/9, 1/2, 2/9, 1/36)` at `n = 3`; §8.5 `c > 2(e + 4)`
suffices for `GL₂`, so `c ≥ 5(e + 4)` works; §9.2 threshold `(n − 1)d/2 ≥ n + 1`; §10.5 `B = ζ²B` forces
`B = 0`; §10.10 `2g − 2 = φ²`.

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
the only output is `declaration uses sorry` at 69:8 and 109:8. One import, `import Mathlib`; no
`set_option`, no `lemma`, no sorry'd data, one namespace, a docstring on every declaration. `#check @name`
for the six declarations on a scratch copy, elaborated once: `eulerian : ℕ → ℕ → ℕ`;
`eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤
n.factorial ^ 2`; `HypersurfaceMonomial : ℕ → ℕ → Type`; `@IsSmoothHypersurface : {k : Type u_1} → [inst :
Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`; `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ
→ MvPolynomial (Fin (n + 1)) ℤ → Prop`; the headline as in the file. No binder is lost and each agrees
with its README statement (§§8.4, 9.1, 9.3). Nothing changed; the file is the one reviewed in round 11.

One-tactic probe on both sorried theorems, sixteen attempts on the scratch copy: `simp`, `rfl`, `decide`,
`omega`, `positivity`, `simp [eulerian]`, `nlinarith`, `aesop` and an `exact` with one library lemma on the
Eulerian bound; `simp`, `rfl`, `infer_instance`, `aesop`, `simp` with the two predicates unfolded, and
`exact` with the witnesses `G = 1` and `G = 0` on the headline. None closes. `decide` proves
`eulerian 0 0 = 1`, `eulerian 3 1 = 4`, `eulerian 4 1 = 11` and the failure at `n = 1`. No padding.

Headlines from the Summary: the coefficient non-density theorem (§6.1), the higher-dimensional theorem
and its finiteness clause (§§7.6–7.7) and Shafarevich finiteness (§§10.6, 10.9, 10.10) are named in the
module docstring as not statable, each with the missing carrier, as is §7.8; the hypersurface non-density
(§9.3) and the Eulerian bound (§8.4) are stated. None statable is absent and none is forced through a
stand-in.

### Library declarations opened at the pins

Mathlib: `Mathlib/RingTheory/Filtration.lean:432` (`Ideal.iInf_pow_eq_bot_of_isLocalRing`, with
`[IsNoetherianRing R] [IsLocalRing R] (h : I ≠ ⊤)`); `Mathlib/Data/Finsupp/Weight.lean:216`
(`Finsupp.degree`); `Mathlib/RingTheory/Regular/RegularSequence.lean:147` (`IsRegular`, namespace
`RingTheory.Sequence` at 110); `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:164`. Tau Ceti:
`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` (`parabolic`, namespace `Cocharacter` at 86) and the
directory `Dynamic/LeviDecomposition`; `Representation/Tannaka/Equivalence.lean:188`;
`Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `LineBundle/Ample.lean:71`;
`CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45`;
`IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:74, 130`. Each exists with the cited name at
the cited line. Neither pinned library has Eulerian numbers (the hits are Eulerian trails of graphs and
Eulerian velocity fields) or a smooth-hypersurface or good-reduction predicate for forms.

### Suppliers, gaps, overlaps

Every cited section was resolved this round by its heading, on main or at the open head (122 ids, 33
roadmaps): MordellLawrenceVenkatesh §§0.3, 0.4, 0.24, 1.2, 1.10, 1.12, 1.13, 2.5, 2.6, 2.8, 2.11, 3.8;
SheafConvolutionOnAbelianVarieties §§0.2, 2.4, 3.1, 3.3, 4.8, 5.2, 5.3, 6.7, 8.3 and the paragraph "8.2
Character generic in every conjugate"; ClassicalArithmeticCompletion §§2.18, 2.39, 2.56; ReductiveGroups
Layers 3, 4, 5, 6A, 7, 7b; ReductiveGroupsPartII §RG2.0.2; ArithmeticGaloisRepresentations §1.11 (the
paragraph "Complete reducibility and closed tuples" is inside it); LanglandsParameterStacks §§2.3, 2.4;
RestrictedPowerSeries §§2.1, 5.2; ComplexKahlerGeometry §3.4 in its Layer 3 (K3), with
`ruckert_nullstellensatz`; ComplexComparisonPartII §§C5.2, C5.3, C5.6, C6.6; ShimuraData §§1.2–1.4,
3.1–3.7; AbelianSchemesAndArithmeticModuliPartII §§B2.4, B2.6, Layer B3; MotivesAndAlgebraicCycles
§§6.1–6.3, 6.8; PadicHodgeTheory §§3.3–3.6, 4.4, 5.5, 6.1, 7.3, 8.1, 8.2; CrystallineCohomology §CR.7.3;
EtaleCohomologyFoundations §F.3 (with `VanishingCycles.lisseDirectImageTransport`);
ClassicalAdicEtaleCohomology §8.2; DeligneWeightsAndPurity §§0.1, 0.2, 0.7, 0.9, 0.10, 0.16, 2.2, 4.3, 4.4,
9.12; WeilConjectures Layers WC.3, WC.5; PadicDifferentialEquationsAndRigidCohomology §RD.7.7;
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; EtaleDualityAndPerverseSheaves §4.3;
LefschetzPencilsAndVanishingCycles §§2.8, 3.4, 4.4, 4.5, 5.8, 5.10; SchemeAndStackFoundations §§0.8, 0.9,
1.16, 4.14 (`hilbert_quot_schemes`); AlgebraicModuliForArithmeticGeometry §§2.1, 9.4;
AbelianSchemesAndArithmeticModuli §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.2, A3.3, A3.6, A6.7, A6.14,
A6.30–A6.32; JacobianChallenge Layer F; Chebotarev Layer 10; ArithmeticGaloisDuality §R02.3.1;
HeightsRationalPointsAndObstructions §§1.6, 1.7, 5.2; FaltingsFinitenessAndIsogenyTheorems §R28.5.15
(`finite_curves_goodReduction`); EndoscopicTransferAndUnitaryTraceComparison §1.13a (named in Scope, not a
supplier); LogicAndDefinabilityInNumberTheory §7.6 (consumer). `roadmaps resolve` on the README lists
nothing found nowhere.

Statements read and compared with the contract this round: LanglandsParameterStacks §2.3 (R-parabolics
`P_λ` and R-Levis `Z_G(λ)` for cocharacters of `G⁰`); EndoscopicTransferAndUnitaryTraceComparison §1.13a
(connected reductive `G`, an `F`-parabolic and an `F`-Levi: narrower than §2.11 here, as Scope item 3
says); DeligneWeightsAndPurity §§4.3–4.4; ClassicalArithmeticCompletion §2.18 (descents of
`Equiv.Perm (Fin n)`, `A(0, 0) = 1`, the object `eulerian` restates) and its §§2.57, 2.71, 2.77–2.78
(bounds of another kind: no central mass, difference law or variance).

The seven gap slugs of `design/plan.json` have the same supplier and section in the README, each under its
supplier's subsection of "Exact supplier contracts", and each `needs` sentence carries its hypotheses.
ClassicalArithmeticCompletion mentions log-concavity only as an alternative route inside §2.56; nothing
asked is provided at the heads read. An acceptance would be conditional on all seven.

Dependency check (the prescribed command):

```text
depcheck: 258 roadmaps, 2469 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No notion was moved.

Duplication by object: a search of main and of every open roadmap pull request finds
`IsSmoothHypersurface`, `HypersurfaceMonomial`, "coefficient normalizer", "strongly c-balanced",
"semibalanced", "primitive Hodge number" and "Jacobian ring" nowhere else; "Hodge–Deligne system" only in
LogicAndDefinabilityInNumberTheory, a consumer; `HasGoodReductionOutside` as a README name for curves in
HeightsRationalPointsAndObstructions, in another namespace; `H¹(F, P)` for parabolics only in
EndoscopicTransferAndUnitaryTraceComparison §1.13a, whose difference the README states in one clause.
GaloisSectionsPadicPeriodMaps asks MordellLawrenceVenkatesh for a symplectic variant of Faltings's lemma
(bounded-degree eigenvalues, `GSp`-irreducible); it is a request on another roadmap, not a statement, and
§2.9 here is the coefficient-normalizer form with integer polynomials. The overlap file lists no pull
request changing this roadmap, no dropped id and no revision-only id.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps, AbelianSchemesAndArithmeticModuli and (by object search)
KloostermanMomentsAndPotentialAutomorphy, PotentialAutomorphyDworkMotivesPartII and
AlgebraicModuliForArithmeticGeometryPartII; character sheaves, convolution monodromy and exceptional
degrees — SheafConvolutionOnAbelianVarieties; Faltings's lemma, residue disks, formal horizontal sections
and the Lagrangian period variety — MordellLawrenceVenkatesh; abelian schemes and Weil restriction —
AbelianSchemesAndArithmeticModuli; Eulerian numbers and their identities — ClassicalArithmeticCompletion;
nothing shared with the others.

### Maintainer notes

1. Arrangement: confirmed independent (below); round 11's repairs moved no layer.
2. Worked instances without a locator: refuted at this head. The restatements carry "(LS, Example 6.7,
   p. 68)" at `README.md:1928` and "(LS, Example 8.6, pp. 75–76)" at `README.md:2292–2293` and
   `3303–3304`; the Checks of §§4.2 and 5.3 stand under statements that cite the two Examples
   (`README.md:1829`, `2008–2009`).
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording was compared at the fifteen sampled locators and at six further passages: the new paragraph of
§2.11 against LS lines 3572–3574; §5.8 against LS lines 3549–3601; §7.5 against LV lines 3123–3128 and
3255–3340; §10.9 against LS lines 4013–4040; §8.8 against LV lines 2993–3019; the docstring of `eulerian`
against LV lines 2941–2943. No sentence follows a source clause by clause; the shared runs are formulas,
names of objects and lists of hypotheses (the longest, "an abelian variety of dimension n over", seven
words). The route of §3.4 uses the steps of the proof at LS lines 3000–3077 and adds what the source
leaves out (the affine reduction, the product over all components before the Nullstellensatz). No table,
figure or list of examples is taken over.

Arrangement: by a count of locators, LS has 90 of 123, LV 28, Serre 2, BC 2, Beauville 1. LS's contents
are §5 (5.1–5.10), §6 (6.1–6.2), §7, §8, §9 and Appendix A. Layers 0, 1 and 2 divide §5 and add §§1.9, 2.3
and 2.11 and LV §2.3; Layer 3 takes §6.1 with LV §9; Layer 4 joins §6.2 to all of §7; Layers 5 and 6 divide
§8 with LV §11; Layer 7 is LV §§10–12; Layer 8 puts Appendix A beside LV §10.2 and Batyrev–Cox, before the
applications; Layer 9 is LV §10.2 with Beauville; Layer 10 is §9. No run of layers maps one to one, with the
same scope each, onto sections of a source, and the order of Layers 0–6 is forced: §1.1 needs §§0.3–0.4,
§2.1 needs §1.5, §3.1 needs §2.5, §4.4 needs §3.2, §5.12 needs §4.2 and §6.1 needs §§5.8, 5.12.

Source independence: 21 passages compared with 2 sources (LS, LV), none shared; largest share LS, 90 of
123 locators; contents compared with LS: independent. BC and Beauville were not re-read this round (§§8.6
and 9.2 are outside the sample and unchanged since they were compared); Serre could not be read.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (§2.11): settled as uncertified; the text was not read.
  The Checks of §2.11 were recomputed.
- LawrenceVenkateshMethod (listed in the packages index on another pull request's branch): its files are
  not in this checkout, so ownership against it was not checked.
- Beauville (§9.2), Batyrev–Cox (§8.6) and LV Lemma 12.1 (§7.8) were not re-read this round; the numerical
  claims of §§8.6 and 9.2 were recomputed (table above), and §7.8 rests on round 11's row.
- Supplier statements other than those listed as read were resolved by heading only.

## Source issues

- **Error** in LS at Lemma 8.10, preprint pp. 78–79: the source says that the filtration of the semisimple representation is balanced for the flag, with no purity hypothesis; it should assume the purity hypothesis of its Lemma 8.1, which its last step uses; affects a stated result.
- **Gap** in LS at the proof of Lemma 5.29, preprint p. 51: the source says the orbit algebra is the pushforward of the cyclotomic unit system from `K` to `ℚ`; it should be the descent of the sum over the orbit, of rank the orbit's cardinality (`[K : ℚ]` for the trivial character); affects the proof.
- **Gap** in LS at the proof of Theorem 9.2, preprint p. 86: the source says every integral point lifts to the resolution of a component by properness; it should lift only the points over the locus where the resolution is an isomorphism; affects the proof.
- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the space of degree-d hypersurfaces in projective n-space has dimension `binomial(n+d, d−1) − 1`, of order `d^(n+1)`; it should be `binomial(n+d, d) − 1`, which is 14 for plane quartics; affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a primitive hypersurface is invariant under no translation by a geometric point; it should exclude only nonzero points; affects a stated result.

The other entries of the README's "Source corrections" were recorded by earlier rounds and were not
re-read in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (a Springer monograph) as `uncertified` with `licence_class = "none"`; it is cited by section number only at `README.md:1510–1512`, and no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; `README.md:3363–3365` cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "abba9ce2e4247fa415ec8c2942e8d801cf0bff90", "job": "REV-PKG-MordellLawrenceVenkateshPartII~12", "model": "fable", "worker": "chris-x29"} -->
