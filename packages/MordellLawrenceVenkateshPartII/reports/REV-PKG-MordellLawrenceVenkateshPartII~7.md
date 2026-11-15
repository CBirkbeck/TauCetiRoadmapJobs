<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6900156245 -->
Review (claude) of 8198d96

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The period-codimension consequence (§3.3) has a second owner

   **Location:** `README.md:1596–1605`, "### 3.3 Algebraic degeneracy from period codimension … (LS, Lemma
   6.3, pp. 64–65 …)"; Scope item 4, `README.md:48–50`; `README.md:3098–3105` (Downstream consumers).

   **Claim:** §3.3 is this roadmap's target and nobody else states it.

   **Witness:** the open roadmap LogicAndDefinabilityInNumberTheory (pull request 2276, merge-order line
   324, after this roadmap at line 320), `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md:1920–1926`,
   "### 7.6 Complex period codimension consequence", states the same theorem (LS, Lemma 6.3) "in
   Lawrence–Sawin's polarized integral Hodge–Deligne system", with Bakker–Tsimerman as a named hypothesis;
   its `Suggested.lean:27` lists it as a headline. It cites no owner of Hodge–Deligne systems or of `G_mon/P`.
   Neither README names the other.

   **Repair** (this package; this roadmap is earlier in the merge order, so it is the owner):

   1. Scope item 4 (`README.md:48–50`): after "the codimension consequence of Ax–Schanuel" insert
      "(Lawrence–Sawin, Lemma 6.3, owned here as §3.3)".
   2. `## Downstream consumers`: add the sentence "LogicAndDefinabilityInNumberTheory §7.6 states the
      consequence of §3.3 with the Bakker–Tsimerman theorem as a named hypothesis; the unconditional
      target is §3.3 here, and the Hodge–Deligne systems (§§0.1–0.2), the monodromy orbit (§3.1) and its
      parabolic (§3.2) that the statement names are owned here."

   The other half (LogicAndDefinabilityInNumberTheory §7.6 citing MordellLawrenceVenkateshPartII §§0.1,
   3.1–3.3 instead of restating them) is outside this package and is for that roadmap's pull request.
   Tested on the witness: with the two sentences the object has one stated owner and a named consumer.

2. **F02** (P2) §3.2 drops the integrality hypothesis its only input requires

   **Location:** `README.md:1578–1579`: "For a polarized pure variation, prove that the stabilizer in the
   identity component of `G_mon` of a Hodge filtration is a parabolic subgroup, so the orbit `D_mon` is
   projective."

   **Claim:** the statement holds for every polarized pure variation.

   **Witness:** the route's one input, gap:andre-monodromy-normality (`README.md:396`), is "for a polarized
   integral variation of Hodge structure"; LS Lemma 6.2 (LS lines 2940–2954) is stated for the system of
   LS Theorem 6.4, "polarized, integral" (LS line 2979); `G_mon` and `D_mon` are defined only for systems
   (§§0.6, 3.1). §§3.1, 3.3, 3.4 all say "polarized integral".

   **Repair:** replace the first sentence by "For a polarized integral Hodge–Deligne system (§0.2) with
   differential monodromy group `G_mon` (§0.6) and connected monodromy period orbit `D_mon` (§3.1), prove
   that the stabilizer in `G_mon°` of a Hodge filtration is a parabolic subgroup, so `D_mon` is
   projective." Add the Check "Integrality is a hypothesis: the normality input is stated for polarized
   integral variations, and no nonintegral extension is claimed (as in §3.3)." Tested: the repaired
   hypothesis is exactly that of the gap and of LS Lemma 6.2, and the `SL₂` Check (Borel of dimension 2,
   orbit `ℙ¹` of dimension `3 − 2 = 1`) still applies.

3. **F03** (P3) Six locator slips against the cached texts

   Each was read at the cited place (LV printed page = page marker + 892).

   1. `README.md:1192` (§2.3): "LV, §2.4 and Lemmas 2.4–2.5, pp. 905–906". G-semisimplification is in LV
      §2.3, "Global Galois representations" (heading at LV line 468, text at LV lines 488–505); LV §2.4 is
      "Friendly places" (LV line 575, printed p. 907). Repair: "LV, §2.3 and Lemmas 2.4–2.5, pp. 905–906".
   2. `README.md:1605` (§3.3): "LV, Corollary 9.2, pp. 963–965". Statement and proof are LV lines
      2673–2690, all on printed p. 964 (p. 963 has Theorem 9.1, p. 965 starts at LV line 2701). Repair:
      "LV, Corollary 9.2, p. 964".
   3. `README.md:1865` (§5.1): "LV, §§11.1–11.2, pp. 985–986". §11.1 begins at LV line 3470, printed p. 984
      (p. 985 starts at LV line 3485). Repair: "pp. 984–986".
   4. `README.md:2038` (§5.7): "LS, Lemma 8.14, pp. 80–81". The lemma (LS line 3668) and its proof end
      before the page marker at LS line 3685; Lemma 8.15 opens p. 81. Repair: "p. 80" (as the Source
      corrections entry already has).
   5. `README.md:2130–2131` (§5.11): "LS, Lemma 8.15, pp. 81–82". Statement and proof are LS lines
      3687–3721; Lemma 8.16 begins at LS line 3722, still on p. 81. Repair: "p. 81".
   6. `README.md:2577` (§8.6): "this justifies LV (10.6), printed pp. 971–972". (10.6) is at LV line 2933,
      printed p. 970, its explanation at LV lines 2941–2945, p. 971; the previous round corrected the same
      locator in §8.7 only. Repair: "printed pp. 970–971".

4. **F04** (P3) Supplier contracts omit sections that Needs lines consume

   **Location and witness** (`## Exact supplier contracts` against the `*Needs:*` lines; every section
   below exists at its supplier's head):

   1. AbelianSchemesAndArithmeticModuli §A3.2 ("Multiplication maps and prime-to-characteristic torsion
      density"): consumed at `README.md:991–992` (§1.6) and `README.md:1111`; absent from the contract
      (`README.md:511–518`, which also says "Consumed in Layers 2 and 10") and from the Scope bullet.
   2. ReductiveGroups Layer 3 ("subgroups, quotients, components"): consumed at `README.md:1150` (§2.1) and
      `README.md:1504`; the contract (`README.md:332–338`) and Scope bullet list Layers 4, 5, 6A, 7, 7b.
   3. DeligneWeightsAndPurity §2.2 ("Open subgroups of `Sp(V)(ℚ_ℓ)` are Zariski-dense"): consumed at
      `README.md:2747`, `2778`, `2812`; absent from the contract (`README.md:465–471`), which says "Consumed
      in Layers 0, 1 and 7" although §9.12 and §2.2 are consumed in Layer 9.
   4. PadicHodgeTheory §5.5: the contract (`README.md:425`) describes only the tensor-isomorphism torsor,
      "Consumed in §7.1"; §2.11 (`README.md:1474`, `1493`) consumes its local torsor theorem (the Kottwitz
      description of `H¹(F, G)` for connected reductive `G` over a finite extension of `ℚ_p`), and §2.6
      (`README.md:1342`) the torsor.
   5. ShimuraData §3.2 and §§1.3–1.4: consumed at `README.md:680` (§0.3) and `README.md:1572` (§3.1); the
      contract (`README.md:391–395`) lists §§3.1, 3.3–3.7 and 1.2 only.

   **Repair:** add to each contract the missing item with what is assumed: (1) "§A3.2 (`[r]` is finite
   étale where `r` is invertible); consumed in §1.6", and "Consumed in Layers 1, 2 and 10"; (2) "Layer 3
   (subgroups, quotients, component groups); consumed in §2.1"; (3) "§2.2 (an open subgroup of
   `Sp(V)(ℚ_ℓ)` is Zariski dense); consumed in §9.2", and "Consumed in Layers 0, 1, 7 and 9"; (4) "§5.5:
   the finite-type tensor-isomorphism torsor, and the local torsor theorem describing `H¹(F, G)` for
   connected reductive `G` over a finite extension of `ℚ_p`. Consumed in §§2.6, 2.11 and 7.1"; (5) "§3.2
   (morphisms, kernels and images of variations), §§1.3–1.4 (connectedness and reductivity of
   Mumford–Tate groups); consumed in §§0.3 and 3.1". Add §A3.2, Layer 3 and §§2.2, 9.12 to the matching
   Scope bullets.

Four findings: two P2 (blocking), two P3. The three repairs of the previous round are complete.
`Suggested.lean` elaborates with `sorry` as its only warning and neither headline is padding. No
mathematical error was found in the statements; the findings are an object with two owners, one
dropped hypothesis, locator slips and incomplete supplier contracts. `README.md` below means
`packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~6), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P3) §10.4 geometric connectedness | `README.md:2908–2909`: "Prove that `C` is geometrically irreducible over ℚ, and that there is a proper birational `C̃ → C` with `C̃` smooth and geometrically connected over ℚ"; route `README.md:2914–2920`; Check `README.md:2930–2933`; §10.5 `README.md:2939`: "smooth geometrically connected positive-dimensional" | Repaired. The API bullet was folded into the statement, which binds §10.5; accepted. |
| F02 (P3) four locator slips | `README.md:691–692` "Example 5.8 and Remark 5.9, pp. 42–43"; `2488` "(10.7) and (10.10), printed pp. 971–972"; `2652–2653` "pp. 970–974"; `2787` "pp. 969–974" | Repaired; each re-read (LS lines 1935, 1950; LV lines 2959, 2992, 3064–3065). The six further corrections of the repair (§§7.1, 7.6, 8.3, 8.7, 8.8, 9.2) are right. The same pattern survives in six other places: R03. |
| F03 (P3) restated examples without locator | `README.md:1841` "(LS, Example 6.7, p. 68)"; `2169–2170` and `3113–3114` "(LS, Example 8.6, pp. 75–76)" | Repaired. |

### Coverage

Read in full: the README (3176 lines, 11 layers), `Suggested.lean`, `metadata.toml`, `sources.toml`,
`design/plan.json` (gaps), the previous review and repair report, the maintainer notes, the overlap,
citation, signature and library-match files. Every layer ends with Examples and Dependencies; every
definition has an API list and at least three Checks; no LaTeX delimiters, process words, pull-request
numbers, machine paths, `lemma`, `set_option` or sorry'd data (grep over both files). The six backticked
names the README attributes to this roadmap are all declared in `Suggested.lean`.

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Text read | Result |
|---|---|---|
| 1.1 | LS lines 2054–2069 (Definitions 5.14, 5.16, p. 45) | Weight 0, `Fil⁰ = E_dR`, `Fil¹ = 0`, commutative algebra object; étale = étale singular ℚ-algebra. Supported. |
| 2.8 | LS lines 2776–2806 (Definition 5.46 p. 60, Lemma 5.48 p. 61) | Uniform = adjoint numbers independent of the embedding; `h_Res = c·h_H`, `T_Res(cx) = c·T_H(x)`. Supported. |
| 3.2 | LS lines 2940–2954 (Lemma 6.2, p. 64) | Parabolic `P ∩ G_mon` from a lift of a power of the Hodge cocharacter. Supported for the integral polarized system; R02. |
| 3.3 | LS lines 2958–2978 (Lemma 6.3, pp. 64–65); LV lines 2663–2690 | Componentwise conclusion, `Ď = (G_mon/P)_ℂ`, codimension count. Supported; LV page, R03. |
| 5.3 | LS lines 3383–3400, 3417 (Definition 8.4, Example 8.6, pp. 74–76); LV §11.4 at LV lines 3645–3681 | Balanced, weakly balanced, semibalanced as stated; `γ_P` inverse determinant. Supported. |
| 5.11 | LS lines 3687–3721 (Lemma 8.15, p. 81); LV §11.6 at LV lines 3796–3857 | Bound `dim Z(φ^ss)`, reduction to semisimple `φ`, cyclewise. Supported; page, R03. |
| 7.5 | LV lines 3123–3128 (Lemma 10.5, p. 975), proof LV lines 3255–3340 (pp. 979–981) | Fixed `ℓ`, residue class, fixed semisimplification up to `G′`-conjugacy, small centralizer. Supported. |
| 8.2 | LS line 4245 (Lemma A.2, p. 91); LV lines 2956–2959, 2992 | `β_p = Σ_(p₁−p₂=p) α_(p₁)α_(p₂)`. Supported. |
| 8.5 | LS lines 3930–3994 (pp. 86–87), 4076 (Lemma A.1, p. 89) | `c` chosen after the profile inequality. Supported. |
| 8.7 | LV lines 2929–2970 (pp. 970–971) | `h^(p,q) ∼ d^n A(n,p)/n!`, `h^p ∼ (d^(2n)/2) β_p`, `dim Y/h⁰ → 0`. Supported; the printed parameter dimension is the listed correction. |
| 8.9 | LV lines 2916–2918, 3020–3064 (pp. 970, 973–974) | `∃ n₀, D₀(n)`; limits first in `d`. Supported. |
| 9.1 | LV lines 2914–2920 | Universal family of degree-`d` hypersurfaces in `ℙⁿ`. Supported. |
| 10.3 | LS lines 3903–3918 (p. 85) | Weil restriction along finite étale `O_(K,S)/ℤ[1/S′]`, bijection of integral points. Supported. |
| 10.4 | LS lines 3930–3933 (p. 86) | Component of the closure and its resolution; the geometric-irreducibility argument is the roadmap's own and was recomputed. |
| 10.6 | LS lines 3881–3891 (Theorem 9.2, p. 85) | `n ≥ 4`, or `n = 3` with `d` not exceptional; primitive, up to translation. Supported. |

No locator is flagged by the author as unverified. Also read: BC lines 1341–1347 (Theorem 10.13 and
Remark 10.14, PDF p. 34: `R(f)` in degree `(n − p)d − n − 1` is `PH^(p, n−1−p)`, as §8.6 says);
Beauville lines 84–89 and 129–136 (Théorèmes 2 and 4; quadrics, cubic surfaces `W(E₆)`, plane cubics).
All 37 LS locators were set against a page map of the numbered statements of LS §§5–9 and Appendix A;
only the two of R03 differ.

### Adversarial pass (sampled targets, headlines, targets of findings, repaired text)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 | `ℚ × ℚ`; `ℚ[ε]/(ε²)`; `E = 0` | idempotents `(1,0), (0,1)`, two embeddings; `ε² = 0`, discriminant 0; no embeddings | étale; not étale; étale with no points, excluded where ranks matter. Sound |
| §2.8 | `E = E₀²`, `SL₂` weights `(2,0,−2)` twice; types `(1,0)`, `(2,0)` | `T_Res(1) = 2 = 2·T_H(1/2)`; adjoint lists `(1,0,0,−1)` vs `(2,0,0,−2)` | Scaling law holds; second pair not uniform. Sound |
| §3.2 | `SL₂` on `ℙ¹`; diagonal torus of `SL₂` | stabilizer Borel, `dim 3 − 2 = 1`; torus orbit `𝔾_m` open, not closed | Statement right for integral polarized systems; hypothesis wording, R02 |
| §3.3 | curve with varying plus constant elliptic `H¹`; constant variation | in `X × D_mon`: `1 ≥ 0 + 1`; in `X × LG(2,4)`: `3 ≥ 2 + 3` false; `d − codim Z ≤ 0`; constant: `codim Z = 0 < d` | Ambient `X × D_mon` needed; sound. Owner, R01 |
| §5.3 | `GL₆`, `2+2+2`, `dim F¹ = 3`; `GL₁₂`, `4+4+4`, `dim F¹ = 6` | three `Hom` blocks of dimension 4: `det(Ad)` pairs to `4(a₂ − a₀)`, inverse `4(a₀ − a₂)`; `(2,1,0) ↦ 8`, `(0,1,2) ↦ −8`, `(1,1,1) ↦ 0`; dimension 16: `8(a₀ − a₂)`, `(1,4,1) ↦ 0` with averages `1/4, 1, 1/4 ≠ 1/2` | Sound; weak balance strictly weaker |
| §5.11 | `φ` regular semisimple in `GL_n`; `φ = 1` | `n!` Borels, dimension `0 ≤ n`; one `G`-orbit of parabolics of each type, dimension `≤ dim G` | Sound |
| §7.5 with §7.6 | `z ≤ h⁰`, `e = d` | `A ≥ h⁰ + d ≥ z + e`; `h⁰/2 + z + e ≤ 3h⁰/2 + d ≤ A + h⁰`, where `T` is nondecreasing | §7.4's hypotheses follow. Sound |
| §8.2–8.3 | `n = 2, 3, 4, 5, 8, 9, 50` | second moment `= (n+1)/6` exactly and `β` log-concave in each; `β₀ = 1/2, 1/2, 0.4236, 0.3965, 0.3229, 0.3067, 0.1366` | Sound |
| §8.4 and `eulerian_central_mass_le_half` | `n = 0, 1`; `n = 2 … 200` | `n = 1`: `2 > 1`; `n = 0`: `0 ≤ 1` but row sum 1; no violation for `2 ≤ n ≤ 200` (recurrence, checked against enumeration for `n ≤ 7`); tail sum `(1/2)Σ(2k−1)/3^(k−1) = 3/2` | True; `n ≥ 2` needed |
| §8.5 | `GL₂`, `h = (1,2,1)`, `A = B = 1` | `x = (e+4)/c`: need `x ≤ 1` and `1 > 2x`, so `c > 2(e+4)`; `c ≥ 5(e+4)` suffices | Sound |
| §8.6–8.7 | `(n,d) = (2,3), (3,4), (3,3), (4,5), (5,4), (5,3), (3,2), (2,2)`; `n = 4`, `d = 400` | `(1,1)`, `(1,19,1)`, `(0,6,0)`, `(1,101,101,1)`, `(0,21,141,21,0)`, `(0,1,20,1,0)`, `(0,1,0)`, `(0,0)`; ratios to `d⁴A(4,p)/24`: `0.975, 0.989, 0.989, 0.975`; `binomial(6,4) − 1 = 14`, `binomial(6,3) − 1 = 19` | Sound |
| §8.8–8.9 | `n = 50` | `β₀√n = 0.966 < 40`; `d^(n+1)/d^(2n) → 0` for `n ≥ 2` | Sound |
| §9.1 and the Lean definitions | zero form; `x₀^p + x₁^p + x₂^p` over `𝔽_p`; integer `F` with `p ∤ S` | proved in Lean on a scratch copy: `¬ IsSmoothHypersurface 0`; all partials vanish; a form smooth mod every `p ∉ S` has content an `S`-unit, hence is a `ℤ[S⁻¹]`-point of the discriminant complement | Carriers right |
| §9.2 | cubic surface; `n` odd `≥ 5`, `d = 3` | degree at `p = (n−3)/2` is `(n−1)d/2 − n − 1`: `−1` for `(3,3)`; `≥ 0` iff `d ≥ 2 + 4/(n−1)` | Exception exactly `(3,3)`. Sound |
| §9.3 Lean headline | `S` larger; any nonzero homogeneous `G` | good reduction outside `S` implies outside `S′ ⊇ S`; `Y_ℚ` dense open in `ℙ^M` | Statement equals non-density; not vacuous |
| §10.3 | `K = ℚ`; `K` quadratic; `K[ε]/(ε²)` | identity; `𝒫 × 𝒫^σ`; extension of `E` by `𝔾_a`, not proper | Sound |
| §10.4 (repaired) | `x² − 2y² = 0`; nodal cubic `y² = x²(x+1)`; `C` a point | two conjugate lines meeting in the origin, `C(ℚ) = {0}`; normalization `𝔸¹`, node under `t = ±1`; trivial | Repaired statement true; negative control excluded by density |
| §10.6, §10.9 | `D₁` | `binomial(25,5)/6 = 8855`; `8855 | 17710` | Equality versus divisibility right; agrees with SheafConvolutionOnAbelianVarieties §5.3 (`P₁ = (5,20)`) |

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
exit 0; the only output is `declaration uses sorry` at 69:8 and 106:8. One import, `import Mathlib`.
`#check @name` for all six declarations on a scratch copy: `eulerian : ℕ → ℕ → ℕ`;
`eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n ! ^ 2`;
`HypersurfaceMonomial : ℕ → ℕ → Type`; `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n + 1)) k → Prop`;
`HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`; the headline as in the
file. No binder lost; nothing changed. `decide` proves `eulerian 0 0 = 1`, `eulerian 3 1 = 4`,
`eulerian 4 1 = 11`.

One-tactic probe on both sorried theorems, ten tactics each (`simp`, `rfl`, `infer_instance`, `decide`,
`omega`, `positivity`, `aesop`, `nlinarith`, `simp` with the definitions unfolded, `exact` with the zero
witnesses): twenty attempts, none closes. No padding.

Headlines: §6.1, §§7.6–7.7, §7.8 and §§10.6, 10.9, 10.10 are named in the module docstring as not
statable, each with the missing carrier; §8.4 and §9.3 are stated. None statable is absent.

### Library declarations opened at the pins

`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` (`parabolic`, namespace
`TauCeti.Cocharacter`); `…/Representation/Tannaka/Equivalence.lean:188`;
`TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (over a field);
`LineBundle/Ample.lean:71`; `CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45`;
`IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:74, 130`;
`Mathlib/RingTheory/Filtration.lean:432` (`[IsNoetherianRing R] [IsLocalRing R] (h : I ≠ ⊤)`);
`Mathlib/Data/Finsupp/Weight.lean:216`; `Mathlib/RingTheory/Regular/RegularSequence.lean:147`;
`Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46`; `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61`. All
exist as cited. Neither pinned library has Eulerian numbers.

### Suppliers, gaps, overlaps

All 31 supplier roadmaps were opened at main or at their open heads and every cited section heading
resolved (about 120 section ids). Three that needed reading: SheafConvolutionOnAbelianVarieties §8.2 is
the paragraph "8.2 Character generic in every conjugate" inside Layer 8; ArithmeticGaloisRepresentations
§1.11 contains the paragraph "Complete reducibility and closed tuples"; PadicHodgeTheory §5.5 contains
both the tensor torsor and the local torsor theorem (R04). The one lead of `roadmaps resolve`,
`VanishingCycles.lisseDirectImageTransport`, is the target named in EtaleCohomologyFoundations §F.3.

The seven gap slugs agree, supplier and sentence, between `design/plan.json` and the README (compared
mechanically). None is already provided: ClassicalArithmeticCompletion §2.56 states unimodality and
mentions log-concavity only inside an alternative route; AbelianSchemesAndArithmeticModuliPartII §B2.4
is for geometric origin; no earlier roadmap states Ax–Schanuel for period maps. An acceptance would be
conditional on all seven.

Dependency check (the prescribed command):

```text
depcheck: 246 roadmaps, 2265 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication by object: no other `Suggested.lean` declares one of the six fully qualified names
(`HasGoodReductionOutside` in HeightsRationalPointsAndObstructions is a README predicate on curves, in
its own namespace; FiniteGroupInvariants has an unrelated `eulerian`). The overlap file lists no head
changing this roadmap, no dropped id and no revision-only id. LawrenceVenkateshMethod (a board package)
is listed in the index; its README was not read (see Not verifiable).

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps and LogicAndDefinabilityInNumberTheory; convolution monodromy, character
sheaves, exceptional degrees — SheafConvolutionOnAbelianVarieties; Lie–Goursat, Faltings's lemma, residue
disks, the Lagrangian period variety — MordellLawrenceVenkatesh; Eulerian numbers —
ClassicalArithmeticCompletion; the period-codimension consequence (LS Lemma 6.3) — stated by both this
roadmap §3.3 and LogicAndDefinabilityInNumberTheory §7.6, owner this roadmap (R01).

### Maintainer notes

1. Arrangement: confirmed independent (below).
2. Worked instances without a locator: no longer holds; `README.md:1841`, `2169–2170` and `3113–3114` now
   carry "(LS, Example 6.7, p. 68)" and "(LS, Example 8.6, pp. 75–76)".
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording compared at the 15 sampled locators and at seven further passages (§2.3 statement against LV
lines 488–505; §3.1 route against LS lines 2902–2939; §8.6 against BC lines 1341–1347; §9.2 against
Beauville lines 84–89; §10.1 against LS lines 3877–3879; the docstring of
`integralHypersurfaces_not_zariskiDense` against LV lines 2885–2903; the docstring of `eulerian` against
LV lines 2941–2943). No sentence follows a source clause by clause; the longest shared runs are standard
phrases of under ten words. No table, figure or list is taken over.

Arrangement: LS has §5 (5.1–5.10), §6, §7, §8, §9 and Appendix A. LS §5 is split over Layers 0, 1, 2;
LS §6 over Layers 3 and 4; LS §8 over Layers 5 and 6; Appendix A stands in Layer 8 before the
applications; Layers 7–9 carry LV §§10–12, Beauville and Batyrev–Cox. The order of Layers 0–6 is forced
by §2.1 needing §1.5, §3.1 needing §2.5, §4.4 needing §3.2, §5.12 needing §4.2 and §6.1 needing §§5.8,
5.12. No run of layers maps one to one onto sections of a source.

Source independence: 22 passages compared with 4 sources (LS, LV, BC, Beauville), none shared; largest
share LS, 66 of 83 parenthetical locators in the layers; contents compared with LS: independent.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3: settled as uncertified; the text was not read.
- LawrenceVenkateshMethod (board package on another pull request's branch): its README is not in this
  checkout and was not fetched; ownership against it was not checked. By its name it overlaps the base
  roadmap MordellLawrenceVenkatesh rather than this Part II.
- Supplier statements were resolved by heading and, for about fifteen of them, by reading the cited
  paragraph; the remaining contract descriptions rest on the earlier rounds' register.

## Source issues

- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the parameter space of degree-d hypersurfaces has dimension `binomial(n+d, d−1) − 1`; it should be `binomial(n+d, d) − 1`, 14 for plane quartics; affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a primitive hypersurface is invariant under no translation by a geometric point; it should exclude only nonzero points; affects a stated result.

The other entries of the README's "Source corrections" were recorded by earlier rounds and not re-read
in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (Springer monograph) as `uncertified`, `licence_class = "none"`, cited by section number only at `README.md:1457–1459`; no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; the README cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8198d9620b14e38238345c86a0ff75f946526a0f", "job": "REV-PKG-MordellLawrenceVenkateshPartII~7", "model": "fable", "worker": "chris-x91"} -->
