<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6911146737 -->
Review (claude) of 35f5aa4

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.8 states neither the field, nor crystallinity, nor purity

   **Location.** `README.md:2126–2128` (§5.8): "Prove that for a fixed global coefficient-group
   semisimplification `ρ^ss` and fixed residue Frobenius data, the local bifiltered objects obtained from
   global semisimplification flags have finitely many graded types, and their induced Hodge filtrations are
   balanced."

   **Claim.** Balance holds for every global semisimplification flag. The statement names no base field, no
   group, no crystalline or purity hypothesis and no condition on the coefficient action, and "fixed residue
   Frobenius data" is not defined.

   **Witness.** `G = GL₂`, `ρ` the Kummer extension of `ℚ_p(−1)` by `ℚ_p` of the unit 2 (`p` odd), over
   `ℚ`: its only flag has graded de Rham degrees `0, 1`, average `1/2`. LS lines 3552, 3468.

   **Repair.** Replace the first sentence of §5.8 by:

   > Let `G` be the semilinear coefficient normalizer of §2.1 with `E₀ = ℚ_p`, formed for the étale fibre
   > `V_et` over `E_et`, and let `ρ₀ : G_ℚ → G(ℚ_p)` be continuous, G-completely reducible (§2.3),
   > crystalline at `p`, pure in the sense of §5.4 (there are a finite set `Σ` of primes and an integer `w`
   > such that for every prime `ℓ ∉ Σ`, `ℓ ≠ p`, it is unramified at `ℓ` and the roots of the characteristic
   > polynomial of geometric Frobenius in the standard representation are Weil `ℓ`-numbers of weight `w`),
   > and such that its composite with `G → Aut_(ℚ_p)(E_et)` is the Galois action on `E_et`. Prove that there
   > is a finite set of bifiltered objects `(V₀, φ₀, F₀, f₀)` (§5.5), depending only on `ρ₀`, in which
   > `(V₀, φ₀, F₀)` is the filtered φ-module of the restriction of `ρ₀` to `Gal(ℚ̄_p/ℚ_p)` (§2.6) and `F₀` is
   > balanced relative to `P_(f₀)` (§5.3), such that for every continuous `ρ : G_ℚ → G(ℚ_p)`, crystalline at
   > `p`, with the same composite to `Aut_(ℚ_p)(E_et)` and with G-semisimplification `G(ℚ_p)`-conjugate to
   > `ρ₀`, the filtered φ-module of the restriction of `ρ` to `Gal(ℚ̄_p/ℚ_p)` carries a φ-stable auxiliary
   > filtration `f` whose graded type is that of one of them.

   Keep the sentence "The finiteness concerns types …" and the locator. Add the Check: "Purity is needed:
   for `G = GL₂` and `ρ₀ = ℚ_p ⊕ ℚ_p(−1)` (Weil weights 0 and 2), the Kummer extension of `ℚ_p(−1)` by `ℚ_p`
   attached to a unit has the single flag `ℚ_p ⊂ V`, with graded de Rham degrees `0` and `1` against the
   average `1/2` of `V`; it is not balanced, and the hypothesis of one weight `w` excludes it. Over `ℚ(i)`
   the two characters of a CM elliptic curve at a split `p` have Hodge–Tate weights `0` and `−1`, not
   `−1/2`, which is why the group is `G_ℚ`." Write the `*Needs:*` line as `§§2.1, 2.3, 2.6, 2.10, 5.3–5.5,
   5.7.`

   Tested on the witness: weights 0 and 2 are not one weight `w`, so the instance is outside the statement
   and is the negative control; for a pure `ρ₀` every character of the Levi trivial on `Z(G)` has weight 0 by
   §5.4, so the central weights agree. The consumer §6.1 meets the hypotheses: base `ℤ[S⁻¹]`, pure system,
   `ρ` restricted to `Gal(ℚ̄_p/ℚ_p)`, constant `E` (so the composite to `Aut(E_et)` is the Galois action).

2. **F02** (P2) §7.5 omits the monodromy hypothesis its route uses; §§7.3 and 7.5 use a setting defined only in §7.6

   **Location.** `README.md:2417–2420` (§7.5): "Under the numerical inequalities of §7.6, fix `ℓ ∉ S` and a
   residue point whose crystalline semisimple Frobenius centralizer has dimension at most `h⁰`. Prove that
   the integral points in its residue disk … not Zariski dense". `README.md:2365` (§7.3): "For a fixed smooth
   projective family over `ℤ[S⁻¹]`".

   **Claim.** The two inequalities suffice. The route applies §3.4, which needs codimension in `D_mon`,
   while §7.4 gives codimension in the full self-dual flag variety; they agree only under hypothesis (10.1).

   **Witness.** Constant family `Z₀ × 𝔸¹ → 𝔸¹` over `ℤ[S⁻¹]`, `Z₀` a hypersurface with the inequalities for
   `d = 1` (§8.9) and `ℓ` from §7.3: every `y ≡ y₀ mod ℓ` has `ρ_y = ρ_(y₀)`, and `y₀ + ℓℤ` is Zariski
   dense in `𝔸¹`.

   **Repair.**

   1. §7.3, replace "For a fixed smooth projective family over `ℤ[S⁻¹]` with fixed Hodge type on primitive
      middle cohomology of degree `r` and similitude group `GAut` of the intersection pairing" by: "Let `𝒴`
      be smooth of finite type over `ℤ[S⁻¹]` and `π : 𝒵 → 𝒴` smooth projective with geometrically connected
      fibres of relative dimension `r` and a relatively ample class; let `V` be its primitive degree-`r`
      cohomology with the intersection pairing, `GAut = GAut(V, ⟨ , ⟩)` its similitude group and `h` the
      adjoint profile of the Hodge filtration in `GAut` (§2.7)". Write "every integral point
      `y ∈ 𝒴(ℤ[S⁻¹])`". No monodromy hypothesis is added: the statement does not use one.
   2. §7.5, replace the first two sentences by: "In the setting of §7.3, let the generic fibre `Y` of `𝒴` be
      smooth and geometrically connected of dimension `d ≥ 1`, assume that the Zariski closure of the
      geometric monodromy of `V` contains `Aut(V, ⟨ , ⟩)°`, and assume `A ≥ h⁰ + d` and
      `B > T(h⁰ + d) + T(3h⁰/2 + d)`. Fix a prime `ℓ ∉ S` and `y₀ ∈ 𝒴(ℤ[S⁻¹])` with
      `dim Z_GAut((φ_crys,ℓ)^ss) ≤ h⁰` at `y₀`. Prove that the set of `y ∈ 𝒴(ℤ[S⁻¹])` congruent to `y₀`
      modulo `ℓ` whose global ℓ-adic representation has semisimplification `GAut(ℚ_ℓ)`-conjugate to that of
      `y₀` is not Zariski dense in `Y`."
   3. In the route of §7.5 add: "The monodromy hypothesis makes the connected period orbit `D_mon` of §3.1 a
      connected component of the variety of self-dual flags, so the codimension of §7.4 is a codimension in
      `D_mon`, as §3.4 requires." Add the Check: "For a constant family `Z₀ × 𝔸¹` the monodromy is trivial,
      `D_mon` is a point and every integral point congruent to `y₀` has the representation of `y₀`; the set
      `y₀ + ℓℤ` is Zariski dense in `𝔸¹`, whatever the Hodge numbers of `Z₀`. The monodromy hypothesis is
      what excludes it." Write the `*Needs:*` line as `§§3.1, 3.4, 5.4, 7.3–7.4; PadicHodgeTheory §§3.5, 8.1.`
   4. §7.6: its first two sentences may stay; they now agree with §§7.3 and 7.5 word for word.

   Tested on the witness: trivial monodromy does not contain `Aut(V, ⟨ , ⟩)°` when `V ≠ 0` has `A ≥ 1`
   (`Sp` or `SO` of positive dimension), so the constant family is outside the restated §7.5. LV lines
   3123–3128 (Lemma 10.5) are stated inside the proof of Theorem 10.1, under (10.1) (LV lines 2853–2856).

3. **F03** (P3) §5.5 defines its object "with the given semilinear coefficient structure", and none is given

   **Location.** `README.md:2055–2056` (§5.5): "A **bifiltered coefficient Frobenius object** is
   `(V, φ, F, f)` with Hodge G-filtration `F`, φ-stable auxiliary G-filtration `f` and the given semilinear
   coefficient structure." `README.md:2076`: "*Needs:* §§2.3, 2.6, 5.2."

   **Claim.** The definition determines its object. `G`, `V`, the automorphism for which `φ` is semilinear and
   the meaning of "φ-stable" have no antecedent in §5.5, and §2.1 is not in its `*Needs:*` line.

   **Witness.** LS lines 3511–3515 (Definition 8.8): the groups of its §5.6, a fixed `σ ∈ Aut_(E₀)(E)`,
   `φ ∈ G` σ-semilinear, and stability meaning `φ ∈ P`. The same pattern was repaired in §§4.4 and 5.12
   ("In the setting of §2.1").

   **Repair.** Replace the sentence by: "In the setting of §2.1, with `G` the semilinear coefficient
   normalizer of `V` and `σ ∈ Aut_(E₀)(E)`, a **bifiltered coefficient Frobenius object** is `(V, φ, F, f)`
   with `φ ∈ G` σ-semilinear and two G-filtrations (§2.5), the Hodge filtration `F` and the auxiliary
   filtration `f`, the latter φ-stable, that is `φ ∈ P_f`." Write the `*Needs:*` line as `§§2.1, 2.3,
   2.5–2.6, 5.2.` Tested: for `E = E₀` and `G = GL_n` this is a filtered vector space with an automorphism
   and a `φ`-stable flag, as in LS lines 3535–3539; the three Checks of §5.5 read unchanged.

4. **F04** (P3) three `*Needs:*` lines point to a later subsection of the same layer

   **Location.** `README.md:1279–1280` (§2.3: "*Needs:* … §2.11"), `README.md:1476` (§2.9: "*Needs:* §§2.3,
   2.11"), `README.md:2567` (§8.1: "*Needs:* §§2.7, 8.4"); `README.md:573–579` ("How to read the build").

   **Claim.** The subsections of a layer can be built in the order written. §2.11 is consumed by §§2.3 and
   2.9, and §8.4 by §8.1; the paragraph on the build says nothing about the order inside a layer.

   **Witness.** A scan of every `*Needs:*` line for a subsection number not smaller than its own returns
   exactly these three; §2.11 needs only suppliers, and §8.4 needs §8.3, which needs §8.2.

   **Repair.** Append to "How to read the build": "Inside a layer the subsections are grouped by topic and
   the `*Needs:*` lines give the order: §2.11 comes before §§2.3 and 2.9, and §§8.2–8.4 come before §8.1."
   Tested: with that order no `*Needs:*` line names a subsection built after its own, and there is no cycle
   (§2.11 names neither §2.3 nor §2.9; §§8.2–8.4 do not name §8.1). No section is renumbered, so no
   citation changes.

Four findings: two P2 and two P3. The three repairs of round 10 are complete and correct.
`Suggested.lean` elaborates with `sorry` as its only warning, neither sorried theorem is padding, the
dependency check is clean and every supplier citation resolves. What remains are two theorems whose
statements omit hypotheses on which their conclusions depend (§5.8 and §7.5, each refuted as written by
an instance), one definition with no antecedent for its group (§5.5), and three `*Needs:*` lines that
point to a later subsection of the same layer. `README.md` below means
`packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~10), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) base field of §2.6 and §7.1 | `README.md:1350–1366`: "Let `G` be an algebraic group over `ℚ_p` … `ρ : Gal(ℚ̄_p/ℚ_p) → G(ℚ_p)` be continuous and **crystalline** … an inner form `G′` of `G` over `ℚ_p` … a Frobenius in `G′(ℚ_p)`"; the composite hypothesis at `1359`; the dichotomy sentence at `1361–1365`; new Check at `1384–1388`. `README.md:2308–2316`: "Let `K` be a finite unramified extension of `ℚ_p` … tensor-isomorphic over `ℚ̄_p`, after an embedding `K → ℚ̄_p`" | Repaired. The departure from the suggested sentence is right: for `K = ℚ_p(√p)`, `K₀ = ℚ_p` and `φ` is linear, so the README's two-case sentence is the true one. |
| F02 (P3) page range of LS Lemma 5.43 | `README.md:1366` "(LS, Lemma 5.43 and proof, pp. 58–60)"; `README.md:2316` "LS, Lemma 5.43 and proof, pp. 58–60, both for `K = ℚ_p`" | Repaired (page 60 begins at LS line 2750). |
| F03 (P3) §10.3 enlarges `S` | `README.md:2981–2988`: "After enlarging `S` to the set of all finite places of `K` above a finite set `S′` of rational primes that contains the primes below `S` and the primes ramified in `K`"; Check at `3000–3004`; §7.7 at `2474` "for a finite set `S′ ⊇ S` of primes" | Repaired; recomputed below. |

Pattern search: a statement without its field or its standing hypotheses — §5.8 (R01), §§7.3 and 7.5
(R02), §5.5 (R03); §§2.2, 4.4, 5.4, 5.10–5.12, 7.1–7.2, 7.4 name theirs. "Enlarge" passages (§§4.5, 7.7,
9.3, 10.2–10.4, 10.9) all enlarge `S`.

### Coverage

Read in full this round: the README (3287 lines, eleven layers, 79 subsections), `Suggested.lean`,
`metadata.toml`, `sources.toml`, the gaps of `design/plan.json`, the previous review and repair report,
the maintainer notes, and the overlap, citation, signature and library-match files. Every layer ends with
Examples and Dependencies; a count gives 79 `**Checks.**` blocks, none with fewer than three bullets;
every theorem has a locator. A scripted search finds no LaTeX delimiter, pull-request number, machine
path, HTML anchor, process word or `set_option`. The six backticked names the README attributes to this
roadmap are the six declarations of `Suggested.lean`; `ruckert_nullstellensatz`, `hilbert_quot_schemes`,
`finite_curves_goodReduction` and `VanishingCycles.lisseDirectImageTransport` are attributed to their
suppliers and occur in those READMEs (ComplexKahlerGeometry, SchemeAndStackFoundations,
FaltingsFinitenessAndIsogenyTheorems, EtaleCohomologyFoundations line 1135).

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.6 | LS lines 1916–1925 (Definition 5.6, p. 42); 2899–2901 | Differential Galois group of `V_dR`, equal to the Zariski closure of monodromy by Riemann–Hilbert and regular singularities; the Tannakian form is LS line 2900. Supported. |
| 1.1 | LS lines 2054–2069 (Definitions 5.14, 5.16, p. 45) | Pure of weight 0, `Fil⁰ = E_dR`, `Fil¹ = 0`, commutative algebra object; étale by the Betti algebra. Supported. |
| 1.4 | LS lines 2164–2186 (Definitions 5.24–5.25, Lemma 5.26, pp. 47–48) | Free of finite rank, equivalently equal dimensions over the field factors; rank passes to the other realizations. Supported. |
| 3.1 | LS lines 2902–2939 (Lemma 6.1, pp. 63–64) | One `G_mon`-orbit; complex statement by citation, transfer by the torsor and the two sections. Supported; the complex route through the two gaps is the roadmap's own. |
| 4.3 | LS lines 3139–3177 (Lemma 6.8, pp. 68–69); 3109–3137 | Orbit under `Gal_ℚ × Gal(ℚ^cyc/ℚ)`, Frobenius permutation, equal class sizes, `c` classes in each orbit. Supported. |
| 5.8 | LS lines 3549–3601 (Lemma 8.10, pp. 78–79) | `G_ℚ`, crystalline at `p`, composite to `Aut(E_et)`, finitely many `f₀`, balance by Lemma 8.7. Locator right; the README drops these hypotheses: R01. |
| 5.9 | LV lines 3722–3731, 3742–3744, 3780–3795 (Lemma 11.4, (11.12), (11.14), printed pp. 991–993); LS lines 3644–3657 | The set `W_PQ`, the two equivalences, the bijection, size `ℓ(w)`. Supported; LV line 3795 writes the inverse without the sign, as the README's correction says. |
| 5.11 | LS lines 3687–3721 (Lemma 8.15, p. 81); LV lines 3824–3840 (printed p. 994) | Bound `dim Z(φ^ss)`; finite union of `Z(φ)`-orbits (LV line 3829). Supported. |
| 7.4 | LV lines 3341–3379 (Proposition 10.6, printed pp. 981–982); 3797–3856 | `A ≥ z + e` non-strict, `B > T(z + e) + T(h⁰/2 + z + e)` strict, codimension `≥ e`. Supported. |
| 8.1 | LS lines 4076–4112 (Lemma A.1, pp. 89–90); 4228–4231 | `n ≥ 2`, `(h⁰ − t)/2 < Σ_(k>0) h^k`, equivalently `2h⁰ < dim H + t`; reduction to the Eulerian inequality. Supported. |
| 8.6 | BC lines 1341–1352 (Theorem 10.13, Remark 10.14, PDF p. 34); Theorem 10.6 at BC line 1237 (PDF p. 31) | `R(f)_((d−p)β−β₀) ≅ PH^(p, d−1−p)`; for `ℙⁿ` degree `(n − p)·deg − n − 1`. Supported, as is the README's remark on the conjugate piece. |
| 8.8 | LV lines 2980–3019 ((10.9)–(10.12), Lemma 10.3, printed pp. 972–973); 3037–3064 ((10.13), pp. 973–974) | Variance `(n+1)/12`, normal limits `1/12` and `1/6`, first moment `> A√n`, `β₀ < 40/√n`, `T(cH/√n) ≤ δH√n`. Supported. |
| 9.3 | LV lines 2885–2903 (Theorem 10.1, printed pp. 969–970); 2916–2920 (Proposition 10.2, p. 970); proof to LV line 3064 (p. 974) | Supported. |
| 10.4 | LS lines 3930–3944 (proof of Theorem 9.2, p. 86) | Component of the closure, resolution, spreading out, lifting. Supported; the README lifts only the points of `U`, which is what is true (Source issues). |
| 10.6 | LS lines 3881–3891 (Theorem 9.2, p. 85), proof to LS line 4012 (p. 87) | `n ≥ 4`, or `n = 3` and `d` not exceptional; primitive, up to translation. Supported. |

No locator is flagged by the author as unverified. Also read: LS lines 1903–1915, 3338–3350, 3397–3447,
3464–3541, 3605–3657, 3722–3752, 3812–3873, 4013–4057, 4229–4326; LV lines 2853–2880, 2941–2976,
3104–3128.

### Adversarial pass (sampled targets, headlines, targets of findings, repaired text)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.6 Checks | constant system; `SL₂`; finite group | Tannaka group of the trivial connection is 1; closure of a dense subgroup of `SL₂` has dimension 3, not 4; a finite group is its own closure | Sound |
| §1.1, §1.4 | `ℚ × ℚ`; `ℚ[ε]/(ε²)`; ranks `(2, 2)`, `(1, 3)`; `E = 0` | two idempotents, étale; nilpotent `ε`, not étale; `N = 2`; total 4 but not free; no `τ`, every `N` | Sound |
| §2.6 (repaired) | trivial character over `ℚ_p`, `ℚ_(p²)`, `ℚ_p(√p)`; unramified `PGL₂`-valued `ρ` with `Frob ↦ [[0, p], [1, 0]]` | `φ = 1`; `φ = σ` not linear; `φ = 1` but filtration over `K`; the matrix has square `p·I`, order 2 in `PGL₂`, class `val(det) = 1 mod 2 ≠ 0`, so `G′` is the quaternion form: the `PGL₂` Check is not empty | Sound |
| §3.1 Checks | `ℂ/ℤ[i]`; isotropic planes in `ℂ⁴` | `det((1, i), (1, 0)) = −i ≠ 0`; `v ∈ F¹ ∩ F̄¹` gives `Σ|v_i|² = 0` | Sound |
| §4.3 with §4.2 | `{1,2},{3,4},{5,6},{7,8}`, `σ = (13)(24)(57)(68)`; `c = 1` | orbits `{1,3},{2,4},{5,7},{6,8}`, two classes each: strongly 2-balanced, not 3; one class suffices | Sound |
| §5.3 | `GL₆`, `2+2+2`; `GL₁₂`, `4+4+4` | `det(Ad | Lie P) = det(g₀)⁴ det(g₂)⁻⁴`, so `⟨γ_P, F_M⟩ = 4(a₀ − a₂)`; `8(a₀ − a₂)`; `(1, 4, 1)` has block averages `1/4, 1, 1/4` against `1/2` | Sound |
| §5.5 | `E = E₀`, `GL_n` | reduces to a filtered space with automorphism and stable flag; the group is not named in the text | R03 |
| §5.8 | `ℚ_p ⊕ ℚ_p(−1)` with a Kummer extension; CM curve over `ℚ(i)` | graded degrees `0, 1` against `1/2`; Hodge–Tate weights `0, −1` against `−1/2` | False as written: R01 |
| §5.9 | `SL₂`, `w = s`; `SL₃`, 3-cycle; `w = 1` | `{−α} → {−α}`, `ℓ = 1`; two elements, `w ≠ w⁻¹`; empty, `ℓ = 0`; the first set is minus the inversion set | Sound |
| §5.10 | `GL₂`, weights `(1, 0)`, `c = e = 1` | `h = (1, 2, 1)`, `T(1) + T(0 + 1) = 2`, `B = 1`: hypothesis fails | Sound |
| §5.11 | regular semisimple in `GL_n` | `n!` Borels, dimension `0 ≤ n` | Sound |
| §6.1 against LS 3826–3841 | both inequalities | `A ≥ (d + dim H)/c`; `B > T((d + dim H)/c) + T((h⁰ − t)/2 + (d + dim H)/c)` | Agrees |
| §7.4 against LV | (10.23), (10.24) | `A ≥ z + e`; `B > T(z + e) + T(h⁰/2 + z + e)`; `≥ e` | Agrees |
| §7.5 | constant family over `𝔸¹` | `ρ_y = ρ_(y₀)` on `y₀ + ℓℤ`, infinite, dense in `𝔸¹`; inequalities depend on `Z₀` and `d = 1` only | False as written: R02 |
| §7.8 | `M = 1`; general `M` | `‖g_1‖² = 19`, `9/19 ≤ 3/4`; `(2M+1)²/‖g_M‖² = 3(2M+1)/(8M² + 8M + 3) ≤ 3/(4M)` since `8M² + 4M ≤ 8M² + 8M + 3`; error term `≤ 2·1.3·b²/9` over `‖g_M‖² ≥ 19` | Sound |
| §8.1 | `n = 2`: `GL₂`, `GSp₂`, `GO₂`; `n = 3`, `GO₆` | `4 < 6`; `4 < 6`; `4 < 4` false; `h⁰ = (18 − 4)/2 + 1 = 8`, `16 < 16 + 4` | Sound; parity needed |
| §8.4 and `eulerian_central_mass_le_half` | `n = 2, …, 8` (enumeration of permutations) | `4 ≤ 4`; `36 ≤ 36`; `488 ≤ 576`; `11420 ≤ 14400`; `377816 ≤ 518400`; `17405640 ≤ 25401600`; `1049776080 ≤ 1625702400`; `n = 1`: `2 > 1`; reference second moment `Σ j²/3^j = 3/2`, and `(n+1)/6 ≥ 3/2` from `n = 8` | True; `n ≥ 2` needed |
| §8.6 | `(n, d) = (2, 3), (3, 4), (4, 5), (3, 3), (5, 4)` | `(1, 1)`; `(1, 19, 1)`; `126 − 25 = 101`, so `(1, 101, 101, 1)`; `(0, 6, 0)`; `(0, 21, 141, 21, 0)` | Sound |
| §8.8 | constants | density of `N(0, 1/6)` at 1.1 is `0.977·e^(−3.63) = 0.0259 > 1/40`; `40/√n < 1/2` iff `n > 6400` | Sound |
| §9.1 | `3(x₀² + x₁² + x₂²)`, `S = {2}`; zero form | zero modulo 3, predicate false; the zero form fails `IsSmoothHypersurface` (proved on the scratch copy) | Sound |
| §9.3 headline (Lean) | `G = 1`; scaling; `S` large | `G = 1` leaves "no form has good reduction", not closed; `G(λF) = λ^e G(F)`; Fermat forms have good reduction outside the primes dividing `d`, so the hypothesis is inhabited | Not vacuous, not padding |
| §10.3 (repaired) | `ℚ(i)`, `S = {(2 + i)}`; `S′ = {2, 5}` | trace `4/5`, norm `1/5`, so `x² − (4/5)x + 1/5`; `ℤ[1/10][i]`, discriminant `−4`, a unit | Sound |
| §10.4 | nodal cubic with nonsplit node | the node is rational and has no rational point above it on the normalization: only points of `U` lift | Sound as stated |
| §§10.6, 10.9 | `D₁`; `d = 17710` | `binomial(25, 5)/6 = 53130/6 = 8855`; allowed in §10.6, excluded in §10.9 | Sound; LS lines 3885–3889, 4014–4019 |

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
exit 0; the only output is `declaration uses sorry` at 69:8 and 109:8. One import, `import Mathlib`; no
`set_option`, no `lemma`, no sorry'd data, one namespace, a docstring on every declaration. `#check @name`
for the six declarations on a scratch copy, elaborated once: `eulerian : ℕ → ℕ → ℕ`;
`eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤
n.factorial ^ 2`; `HypersurfaceMonomial : ℕ → ℕ → Type`; `@IsSmoothHypersurface : {k : Type u_1} → [inst :
Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`; `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ
→ MvPolynomial (Fin (n + 1)) ℤ → Prop`; the headline as in the file. No binder is lost and each agrees
with its README statement (§§8.4, 9.1, 9.3). Nothing changed.

One-tactic probe on both sorried theorems, fifteen attempts on the scratch copy: `simp`, `rfl`, `simp
[eulerian]`, `omega`, `positivity`, `aesop`, `decide`, `nlinarith`, `gcongr` on the Eulerian bound; `simp`,
`aesop`, `simp` with the two predicates unfolded, `exact` with the witness `G = 1`, `infer_instance`, `rfl`
on the headline. None closes. `decide` proves `eulerian 0 0 = 1`, `eulerian 3 1 = 4`, `eulerian 4 2 = 11`,
the value 488 at `n = 4` and the failure at `n = 1`. No padding. R01–R04 change no Lean declaration and no
docstring.

Headlines from the Summary: the coefficient non-density theorem (§6.1), the higher-dimensional theorem
and its finiteness clause (§§7.6–7.7) and Shafarevich finiteness (§§10.6, 10.9, 10.10) are named in the
module docstring as not statable, each with the missing carrier, as is §7.8; the hypersurface non-density
(§9.3) and the Eulerian bound (§8.4) are stated. None statable is absent.

### Library declarations opened at the pins

`Mathlib/RingTheory/Filtration.lean:432` (`Ideal.iInf_pow_eq_bot_of_isLocalRing`, with `[IsNoetherianRing
R] [IsLocalRing R] (h : I ≠ ⊤)`); `Mathlib/Data/Finsupp/Weight.lean:216` (`Finsupp.degree`);
`Mathlib/RingTheory/Regular/RegularSequence.lean:147` (`IsRegular`);
`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:164` (`isHomogeneous_one`, used in the probe);
`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` (`parabolic`, namespace `Cocharacter` at 86)
and the directory `Dynamic/LeviDecomposition`;
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188`;
`TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `LineBundle/Ample.lean:71`;
`CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45`;
`IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:74, 130`. Each exists with the cited name.
Neither pinned library has Eulerian numbers (the hits are Eulerian trails of graphs and Eulerian
velocity fields) or a smooth-hypersurface or good-reduction predicate for forms.

### Suppliers, gaps, overlaps

Every cited section was resolved this round by its heading, on main or at the open head (120 ids):
MordellLawrenceVenkatesh §§0.3, 0.4, 0.24, 1.2, 1.10, 1.12, 1.13, 2.5, 2.6, 2.8, 2.11, 3.8;
SheafConvolutionOnAbelianVarieties §§0.2, 2.4, 3.1, 3.3, 4.8, 5.2, 5.3, 6.7, 8.3 and the paragraph "8.2
Character generic in every conjugate"; ClassicalArithmeticCompletion §§2.18, 2.39, 2.56; ReductiveGroups
Layers 3, 4, 5, 6A, 7, 7b; ReductiveGroupsPartII §RG2.0.2; ArithmeticGaloisRepresentations §1.11 (the
paragraph "Complete reducibility and closed tuples" is inside it, at its line 1497);
LanglandsParameterStacks §§2.3, 2.4; RestrictedPowerSeries §§2.1, 5.2; ComplexKahlerGeometry §3.4;
ComplexComparisonPartII §§C5.2, C5.3, C5.6, C6.6; ShimuraData §§1.2–1.4, 3.1–3.7;
AbelianSchemesAndArithmeticModuliPartII §§B2.4, B2.6, Layer B3; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8;
PadicHodgeTheory §§3.3–3.6, 4.4, 5.5, 6.1, 7.3, 8.1, 8.2; CrystallineCohomology §CR.7.3;
EtaleCohomologyFoundations §F.3; ClassicalAdicEtaleCohomology §8.2; DeligneWeightsAndPurity §§0.1, 0.2,
0.7, 0.9, 0.10, 0.16, 2.2, 4.3, 4.4, 9.12; WeilConjectures Layers WC.3, WC.5;
PadicDifferentialEquationsAndRigidCohomology §RD.7.7; InverseGaloisAndArithmeticFundamentalGroups
§IG.0.T4; EtaleDualityAndPerverseSheaves §4.3; LefschetzPencilsAndVanishingCycles §§2.8, 3.4, 4.4, 4.5,
5.8, 5.10; SchemeAndStackFoundations §§0.8, 0.9, 1.16, 4.14; AlgebraicModuliForArithmeticGeometry §§2.1,
9.4; AbelianSchemesAndArithmeticModuli §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.2, A3.3, A3.6, A6.7, A6.14,
A6.30–A6.32; JacobianChallenge Layer F; Chebotarev Layer 10 (on main, under `Completed`);
ArithmeticGaloisDuality §R02.3.1; HeightsRationalPointsAndObstructions §§1.6, 1.7, 5.2;
FaltingsFinitenessAndIsogenyTheorems §R28.5.15; LogicAndDefinabilityInNumberTheory §7.6 (consumer).
Statements read and compared with the contract: SheafConvolutionOnAbelianVarieties §§3.1, 3.3 (signs and
`HT(χ_cyc) = +1`), 5.2–5.3 (pairs `(1,5), (5,20), (20,76)`, `D₁ = 8855`, index 0 excluded), 6.7 (`n > 2`,
`d ≠ D_j`) and 8.1–8.3; ClassicalArithmeticCompletion §2.18 (descents of `Equiv.Perm (Fin n)`,
`A(0, 0) = 1`).

The seven gap slugs of `design/plan.json` have the same supplier and section in the README, each under its
supplier's subsection of "Exact supplier contracts". Minimality at the heads: PadicHodgeTheory has no
Hodge-cocharacter-in-the-image statement and no Faltings association for families; ShimuraData has no
André normality; ClassicalArithmeticCompletion mentions log-concavity only as an alternative route to
§2.56 (its line 4087) and has no variance or limit law; AbelianSchemesAndArithmeticModuliPartII §B2.4 is
for geometric origin and Layer B3 for Kuga varieties. `Completed/HodgeStructures` line 412 lists the
theorem of the fixed part among later developments, not as a target. The gap
`eulerian-log-concavity-and-variance` asks one supplier section for three stated facts that one target
(§8.3) consumes; each has its hypotheses, and it was read as one precise request. An acceptance would be
conditional on all seven.

Dependency check (the prescribed command):

```text
depcheck: 254 roadmaps, 2422 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap is line 320 of the merge order, after
SheafConvolutionOnAbelianVarieties (319) and MordellLawrenceVenkatesh (161);
LogicAndDefinabilityInNumberTheory (324) is named under Downstream consumers only. No notion was moved.

Duplication by object: a search of main and of every open roadmap pull request finds
`IsSmoothHypersurface`, `HypersurfaceMonomial`, `integralHypersurfaces_not_zariskiDense`,
`eulerian_central_mass_le_half`, "coefficient normalizer" and "strongly c-balanced" nowhere else;
"Hodge–Deligne system" only in LogicAndDefinabilityInNumberTheory §7.6, a consumer;
`HasGoodReductionOutside` as a README name for curves in HeightsRationalPointsAndObstructions (line 2000),
in another namespace and in no Lean file; `eulerian` in `FiniteGroupInvariants/Suggested.lean:343`, a
different object (it takes a finite group) in another namespace. The overlap file lists no pull request
changing this roadmap, no dropped id and no revision-only id.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps, KloostermanMomentsAndPotentialAutomorphy, WeightsInEtaleCohomology,
AbelianSchemesAndArithmeticModuli and AlgebraicModuliForArithmeticGeometryPartII; character sheaves,
convolution monodromy and exceptional degrees — SheafConvolutionOnAbelianVarieties (its closing section
names a Part II of MordellLawrenceVenkatesh as consumer); Faltings's lemma, residue disks, formal
horizontal sections and the Lagrangian period variety — MordellLawrenceVenkatesh (it leaves the sections
of Lawrence–Venkatesh after §8 to another roadmap); abelian schemes and Weil restriction —
AbelianSchemesAndArithmeticModuli; nothing shared with the other four.

### Maintainer notes

1. Arrangement: confirmed independent (below); no layer has moved.
2. Worked instances without a locator: refuted at this head. The restatements carry "(LS, Example 6.7,
   p. 68)" at `README.md:1908` and "(LS, Example 8.6, pp. 75–76)" at `README.md:2241–2242` and
   `3224–3225`; the Checks of §§4.2 and 5.3 stand under statements that cite the two Examples
   (`README.md:1809`, `1988–1989`).
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording was compared at the fifteen sampled locators and at seven further passages: §4.2 against LS lines
3109–3137; §5.3 against LS lines 3397–3447 (the README's flag is increasing and its triple is defined
from the top block, the source's is decreasing); §6.1 against LS lines 3812–3841; §8.4 against LS lines
4255–4325; §10.10 against LS lines 4041–4057; the Conventions entry on the modular character against LS
lines 3434–3441; the docstring of `eulerian` against LV lines 2941–2943. No sentence follows a source
clause by clause; the shared runs are formulas and names of objects. The route of §3.1 condenses the idea
of LS lines 2913–2939 in five lines of its own and adds what the source leaves out (constructible images,
the components of the orbit). No table, figure or list of examples is taken over; the two source examples
are single instances, recomputed and cited.

Arrangement: by a count of locators (pattern "(LS," or "; LS," and likewise), LS has 90 of 123, LV 28,
Serre 2, BC 2, Beauville 1. LS's contents are §5 (5.1–5.10), §6 (6.1–6.2), §7, §8, §9 and Appendix A.
Layers 0, 1 and 2 divide §5 and add §§1.9, 2.3 and 2.11 and LV §2.3; Layer 3 takes §6.1 with LV §9; Layer 4
joins §6.2 to all of §7; Layers 5 and 6 divide §8 with LV §11; Layer 7 is LV §§10–12; Layer 8 puts
Appendix A beside LV §10.2 and Batyrev–Cox, before the applications; Layer 9 is LV §10.2 with Beauville;
Layer 10 is §9. No run of layers maps one to one, with the same scope each, onto sections of a source,
and the order of Layers 0–6 is forced: §1.1 needs §§0.3–0.4, §2.1 needs §1.5, §3.1 needs §2.5, §4.4 needs
§3.2, §5.12 needs §4.2 and §6.1 needs §§5.8, 5.12.

Source independence: 22 passages compared with 3 sources (LS, LV, BC), none shared; largest share LS, 90
of 123 locators; contents compared with LS: independent. Beauville was not re-read this round (§9.2 is
outside the sample) and its passage is unchanged since it was compared.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (§2.11): settled as uncertified; the text was not read.
  The Checks of §2.11 were recomputed (`|ℚ₃^×/ℚ₃^(×2)| = 4`, four classes of tori in `GL₂(ℚ₃)`).
- LawrenceVenkateshMethod (listed in the packages index on another pull request's branch): its files are
  not in this checkout, so ownership against it was not checked.
- Beauville (§9.2) and the LV passages for §§7.2–7.3 and 7.8 (LV Lemma 10.4 proof, Lemma 12.1) were not
  re-read this round; the numerical claims of §§7.8 and 9.2 were recomputed (table above and
  `(1 + t + t²)⁶` at `t², t⁶, t^10` = `21, 141, 21`).
- Supplier statements other than those listed as read were resolved by heading only.

## Source issues

- **Error** in LS at Lemma 8.10, preprint pp. 78–79: the source says that the filtration of the semisimple representation is balanced for the flag, with no purity hypothesis; it should assume the purity hypothesis of its Lemma 8.1, which its last step uses; affects a stated result.
- **Gap** in LS at the proof of Theorem 9.2, preprint p. 86: the source says every integral point lifts to the resolution of a component by properness; it should lift only the points over the locus where the resolution is an isomorphism; affects the proof.
- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the space of degree-d hypersurfaces in projective n-space has dimension `binomial(n+d, d−1) − 1`, of order `d^(n+1)`; it should be `binomial(n+d, d) − 1`, which is 14 for plane quartics; affects nothing.
- **Misprint** in LV at the end of the proof of Lemma 11.4, printed p. 993: the source says the maps `w` and `w⁻¹` are inverse bijections; it should be `−w` and `−w⁻¹`, as part (iii) of the lemma has; affects nothing.
- **Misprint** in LS at the proof of Lemma A.4, preprint p. 91: the source says the terms after index `j` are below `1/(2·3^j)`; it should be `1/(2·3^i)` at index `i`; affects the proof.
- **Misprint** in LS at the proof of Lemma A.5, preprint p. 91: the source says the tail sums exceed the geometric ones; it should be the reverse inequality, which gives the bound `3/2`; affects the proof.
- **Misprint** in LS at the paragraph before Lemma A.2, preprint p. 90: the source says the Eulerian distribution has variance `√n/12`; it should be variance `(n+1)/12`; affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a primitive hypersurface is invariant under no translation by a geometric point; it should exclude only nonzero points; affects a stated result.

The other entries of the README's "Source corrections" were recorded by earlier rounds and were not
re-read in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (a Springer monograph) as `uncertified` with `licence_class = "none"`; it is cited by section number only at `README.md:1505–1507`, and no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; `README.md:3279–3281` cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "35f5aa4a658b5c5793839055325b32038d8f7e86", "job": "REV-PKG-MordellLawrenceVenkateshPartII~11", "model": "fable", "worker": "chris-x29"} -->
