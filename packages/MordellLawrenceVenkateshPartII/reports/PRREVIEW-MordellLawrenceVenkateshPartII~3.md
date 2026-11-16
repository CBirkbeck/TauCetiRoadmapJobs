# Review of MordellLawrenceVenkateshPartII (pull request #2461 at 0351865)

**Verdict:** needs changes

Full review of the whole folder at an unchanged head. Two P3 findings, both on one overclaiming sentence; no P1 or P2.

## Previous findings

The previous review (of this same head) raised no finding of its own. The items it carried from the first round:

- R01 — not repaired: deferred (D01)
- R02 — repaired: `Suggested.lean` declares only `HypersurfaceMonomial`, `IsSmoothHypersurface`, `HasGoodReductionOutside` and `integralHypersurfaces_not_zariskiDense`; README line 85 "**ClassicalArithmeticCompletion** §§2.18, 2.39 and 2.56 own Eulerian numbers".
- R03 — repaired: README line 3530 "**LS, proof of Lemma 5.29, p. 51.** The orbit algebra `E_I` is taken to be the pushforward…"; the bullets on LS Theorem 9.2 (line 3551) and Corollary 9.3 (line 3556) each carry an instance.
- R04 — repaired: README line 3397 "The `A(K)`-orbit form of the finiteness is that of LS, proof of Theorem 9.2, p. 85 (LS lines 3900–3902)"; LS lines 3900–3902 say exactly that.

## R01 (P3) — "each is fixed by an explicit instance" is false for four corrections

**Location:** `TauCetiRoadmap/MordellLawrenceVenkateshPartII/README.md` line 3516: "The following corrections to the sources are used throughout; each is fixed by an explicit instance."

**Claim:** every one of the 23 bullets of `## Source corrections` is pinned by an explicit instance.

**Witness:** four bullets state a corrected formula and no instance, here or in their section's Checks: line 3526 (LV Example 4), line 3548 (LS Definition 5.44), lines 3597–3598 (LS Lemmas A.5 and A.4).

**Repair:** replace the sentence by: "The following corrections to the sources are used throughout. A correction that changes a statement or a proof step is fixed by an explicit instance, in its bullet or in the Checks of the section it names; the others are misprints, and the bullet gives the corrected formula." Tested on the four bullets: all are misprints with the corrected formula given (`f_k/f_(k−1)`; `F^a/F^(a+1)`; `<`; `3^i`).

## R02 (P3) — the pull request description repeats the overclaim

**Location:** pull request description, summary block: "each source error the proofs use is corrected with a witness."

**Claim:** every source correction comes with a witness.

**Witness:** as R01: README lines 3526, 3548, 3597 and 3598 are corrections the proofs use (§§5.2, 2.7, 8.4) and carry no witness.

**Repair:** replace by: "each source error the proofs use is corrected, with a witness wherever the correction changes a statement or a proof step."

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Roadmap side | Source or independent side | Result |
|---|---|---|---|---|
| §0.2 integral, polarized, integral Frobenius | `ℚ(−1)`, `ℚ(1)`; rank one on `𝔾_m` with monodromy 2 | eigenvalue `q` integral, `q⁻¹` not; a stable lattice `L` would give `2L = L` | LS lines 1903–1915 (Definitions 5.3–5.5, p. 42) | holds |
| §1.8 inversion pairing | `n = 3`, `n = 4`; `χ ≠ χ⁻¹` | sign `(−1)^(n−1) = +1`, `−1`; cup product pairs the `χ` and `χ⁻¹` factors | LS lines 2366–2369; SheafConvolutionOnAbelianVarieties §4.8 Checks (orthogonal at 3, symplectic at 4) | holds |
| §2.6 crystalline inner forms | trivial character over `ℚ_(p²)` and over `ℚ_p` | `φ = σ`, `σ(a) ≠ a`: not linear; over `ℚ_p`, `φ = 1` | LS lines 2688–2704 (Lemma 5.43, stated over `ℚ_p`) | holds |
| §2.10 semisimplification geometries | `H = 1` in `GL₂`; diagonal torus of `GL₃` | 2 classes `(B, T)`, `(G, G)`; `1 + 6 + 6 = 13` ordered set partitions | LS lines 2849–2881 (Lemmas 5.50, 5.52, p. 62) | holds |
| §4.3 torsion-orbit balance | `c = 1`; translation-constant family | σ-stable partition with equal classes; finite monodromy, excluded | LS lines 3139–3148; SheafConvolutionOnAbelianVarieties §8.3 (ℓ-power character, `ℓ ≠ p`, every conjugate) | holds |
| §4.4 semisimple orbit codimension | `GL₂`, weights `(1, 0)`, `e = 1` | `A = 1`, `dim H = 4`: needs `c ≥ 5`; count `c·A − dim H ≥ e` | LS lines 3205–3220: `Σ_(a>0) h^a ≥ (e + dim H)/c` | holds |
| §4.5 semisimple non-density | `d = 0`; `E = ℚ × ℚ` | a point is dense, excluded by `d ≥ 1`; `dim G = 2N²` against `dim H = N²` in the hypothesis | LS lines 3259–3279: `(dim X + dim H)/c` | holds |
| §7.3 bounded prime | `r = 2`; regular semisimple in `GSp_(2g)` | pairing `λ ↔ ℓ²/λ`; centralizer of dimension `g + 1` | LV lines 3113–3122 (printed p. 975): bound `dim Z_(G′(ℂ))(φ₀) = h⁰` | holds |
| §8.4 central Eulerian mass | `n = 1, …, 7` | `2ΣA(n,q)² = 2, 4, 36, 488, 11420, 377816, 17405640` | `(n!)² = 1, 4, 36, 576, 14400, 518400, 25401600`; `Σ j²/3^j = 3/2 ≤ (n+1)/6` iff `n ≥ 8`; LS lines 4255–4325 | holds; `n = 1` fails and is excluded |
| §8.5 enough factors | `GL₂` profile `(1, 2, 1)`, `x = (e + 4)/c` | needs `x ≤ 1` and `2x < 1`; `c ≥ 5(e + 4)` gives `x ≤ 1/5` | LS lines 3984–3999 (p. 87) | holds |
| §8.6 primitive Hodge numbers | cubic curve; quartic surface; `(n, d) = (5, 4)`, `(4, 5)` | `(1, 1)`; `(1, 19, 1)`; `(0, 21, 141, 21, 0)`; `(1, 101, 101, 1)` | BC lines 1341–1344: degree `(n − p)d − n − 1` gives `H^(p, n−1−p)_prim`; symmetric about `(n+1)(d−2)/2` | holds |
| §9.2 monodromy | `(3, 3)`, `(3, 4)`, `d = 2` | Jacobian degree `−1`: `(0, 6, 0)`, definite; `d ≥ 2 + 4/(n−1)` gives `d ≥ 4` at `n = 3`; rank 1 or 0 | Beauville lines 84–89, 129–136 | holds |
| §9.3 and `integralHypersurfaces_not_zariskiDense` | `#check @`; `simp`, `norm_num`, `aesop`, `G = 1` | quantifier order `n₀, n, D₀, d, S, G`; all four probes leave goals (`G = 1` needs no good-reduction form) | LV lines 2885–2896, 2916–2918 (Theorem 10.1, Proposition 10.2) | holds; not padding |
| `IsSmoothHypersurface`, `HasGoodReductionOutside` | zero form; `x₀x₁`; `3·F` with `S = {2}` | zero form and `x₀x₁` (at `(0,0,1)`) fail, both elaborated; `3F ≡ 0` mod 3 fails, by reading | plane case is the hypothesis of `projectivePlaneCurve.smoothOfRelativeDimension` (Tau Ceti, PlaneCurve/Smooth.lean line 92) | holds |
| §10.6 primitive finiteness | `D₁` | `binomial(25, 5)/6 = 53130/6 = 8855` | LS lines 3881–3891, `i ≥ 2`; LS line 55 `d(2) = 53130`; SheafConvolutionOnAbelianVarieties §5.3 `j ≥ 1` | holds; indexings agree |
| §10.9 all hypersurfaces | `d = 2·8855` | excluded: `φ³ = 6d` divisible by `53130` | LS lines 4013–4040 (multiple of `d(i)/6`; `φ³` not divisible by `d(i)`) | holds |
| §10.10 surfaces | `φ² = 2`; `h` and `2h` | genus 2; `q(2h) = 4q(h)` with pushforward, image cycle unchanged | LS lines 4041–4057 | holds with the stated correction |
| §6.1 coefficient theorem | `GL₂` profile, `c = e = 1` | `T(1) + T(1) = 2 > B = 1`: hypothesis fails, as on a one-dimensional flag variety | LS lines 3812–3841: the same two inequalities | holds |
| §§7.6–7.7 Lawrence–Venkatesh theorem | argument ranges | `3h⁰/2 + d ≤ A + h⁰` iff `h⁰/2 + d ≤ A`, given by `A ≥ h⁰ + d` | LV lines 2885–2903, (10.1) at printed p. 968 | holds |
| §7.8 point-count bound | `M = 1`; general `M` | `‖g₁‖² = 19`; ratio `3(2M+1)/(8M²+8M+3) ≤ 3/(4M)`; total `≤ ((2M+1)² + 0.29)b²/‖g_M‖² < 3b²/M` | LV lines 3865–3869 print the cutoff with `N`, not `2N` | holds with the correction |
| §5.3 sign convention | `GL₂` Borel; `2+2+2` in `GL₆`; `GL₂² ⋊ C₂` | `a⁻¹b`, pairing `−1`; `det g₀⁻⁴·det g₂⁴` gives `4(a₀ − a₂)`; `a = b = (c+d)/2` against `a = b` | LS lines 3384–3411 | holds |
| §§2.3, 2.9, 2.11 class counts | `O₂(ℚ₃)` reflections; `diag(1,2,3,4)`; tori of `GL₂(ℚ₃)` | `r_b ↦ r_(a²b), r_(c²/b)`: 4 classes; 6 in `GL₂²`, 3 in `GL₂² ⋊ C₂`; 4 | `|ℚ₃^×/ℚ₃^(×2)| = 4`; `((a,b)s)² = (ab, ba)` | holds |
| §3.3 ambient of Ax–Schanuel | varying plus constant elliptic `H¹` on a curve | `1 ≥ 0 + 1` in `X × D_mon` | `3 ≥ 2 + 3` false in `X × LG(2, 4)` | holds |
| Source corrections preamble (R01) | 23 bullets | "each is fixed by an explicit instance" | 4 bullets without one (lines 3526, 3548, 3597, 3598) | R01 |

- Source locators checked against the texts: 36 (LS 24, LV 9, BC 2, Beauville 1); in addition every LS and LV statement number cited in Layers 0–10 lies on the page the README gives (LV printed page = PDF page + 892).
- Library declarations opened at the pins: 20 (Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing` at RingTheory/Filtration.lean line 432, `Finsupp.degree`, `RingTheory.Sequence.IsRegular`; the 17 Tau Ceti names of the supplier contracts, each at the cited file and line).
- Cross-roadmap citations resolved: 125 section or layer headings in 34 suppliers, on main or at their open heads (ArithmeticGaloisRepresentations §1.11 by its named target, README line 1496 there); the names `smoothAffineTorsor_galoisH1`, `galoisH1_equiv_torsorClasses`, `finite_curves_goodReduction`, `hilbert_quot_schemes`, `ruckert_nullstellensatz` and `VanishingCycles.lisseDirectImageTransport` (EtaleCohomologyFoundations README line 1135) all exist where cited.
- Declared gaps: the ten README contracts are precise and none is already stated by its supplier (searched each supplier for the object); nine are in the plan, the tenth is D01.
- Gate at 0351865: every check passed (the worker's run, with the targeted build). Dependency check rerun: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. No file changes outside the folder.
- Elaboration rerun: one warning, `sorry` at `Suggested.lean` line 94. `#check @` of the four declarations: every binder kept, types equal to README §§9.1 and 9.3.
- Duplication: no declaration of the pinned libraries or of another roadmap's `Suggested.lean` states `IsSmoothHypersurface`, `HasGoodReductionOutside` or the non-density theorem (`roadmaps grep` over main and the open heads).
- Headlines: §§6.1, 7.6–7.8, 8.6–8.9, 9.2, 10.6, 10.9 and 10.10 are named in the module docstring as not statable, each with the missing carrier; §9.3 is stated.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh, GaloisSectionsPadicPeriodMaps, KloostermanMomentsAndPotentialAutomorphy, MixedHodgeModulesAndIrregularHodgeTheory, AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometryPartII, and LogicAndDefinabilityInNumberTheory §7.6; nothing shared. Hodge–Deligne systems, the period codimension theorem §3.3 and the stabilizer quotients §10.7 are owned here; LogicAndDefinabilityInNumberTheory §7.6 is the conditional form with Ax–Schanuel as a hypothesis, later in the merge order. The board package LawrenceVenkateshMethod plans nothing of its own.

Source independence: 23 passages compared with 4 sources (LS, LV, BC, Beauville), none shared beyond forced notation; largest share LS, 112 of 147 locators in Layers 0–10; contents compared with LS: independent (LS §5 is split over Layers 0–2, LS §6 over Layers 3–4, Layer 7 is LV §§10–12, and Appendix A precedes LS §9; the order is that of the `*Needs:*` lines).

Research link: Layers 0–6 and 10 are the method and main theorems of Lawrence–Sawin (2025, Annals of Mathematics); Layers 7–9 are §§9–12 of Lawrence–Venkatesh (2020, Inventiones); §3.3 uses Bakker–Tsimerman's Ax–Schanuel theorem. Rests on the README's references and the LS and LV texts read.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (§2.11): recorded as uncertified; no legal text is cached.
- §7.4's Check on the arXiv v3 wording of LV's first inequality: only the printed version is cached.
- Public formalisations outside the pinned libraries matching the `Suggested.lean` declarations: not searched.

## Source issues

- **Misprint** in LV at Example 4 after Lemma 11.2, printed p. 988: the source says the induced filtration on the graded piece is an image in the quotient by `f_(k+1)`; it should be the quotient `f_k/f_(k−1)`; affects nothing.
- **Misprint** in LV at the display before (10.8), printed p. 971: the source says the parameter dimension is `binomial(n + d, d − 1) − 1`; it should be `binomial(n + d, d) − 1`; affects nothing.
- **Error** in LV at Lemma 12.1, printed p. 995: the source says the cutoff is `q^((n/2+1)N) < b/3`; it should be `q^((n/2+1)·2N) < b/3`, since the kernel has frequencies up to `2N`; affects a stated result.
- **Misprint** in LS at Definition 5.44, p. 60: the source says the adjoint Hodge number is the dimension of `F^a/F^(a−1)`; it should be `F^a/F^(a+1)` for a decreasing filtration; affects nothing.
- **Error** in LS at proof of Lemma 5.29, p. 51: the source says the orbit algebra is the pushforward along `K/ℚ` of the `ℚ(μ_r)` unit system; it should be the descent of the orbit summands, of rank `|I|`; affects the proof.
- **Gap** in LS at Lemma 6.5, p. 67: the source says the lemma holds for every `SO_N`; it should assume a simple adjoint quotient (`N = 3` or `N ≥ 5`); affects a stated result.
- **Gap** in LS at proof of Theorem 9.2, p. 86: the source says properness lifts every integral point of the closure to the resolution; it should restrict to the open set where the resolution is an isomorphism; affects the proof.
- **Gap** in LS at Corollary 9.3, pp. 87–88: the source passes from the primitive quotients to `A(K)`-translation classes without bounding `A′(K)/π(A(K))`; it should add finiteness of that cokernel by weak Mordell–Weil; affects a stated result.
- **Misprint** in LS at proof of Theorem 9.6, p. 88: the source measures a homomorphism by the intersection number of the image curve; it should use the pushforward cycle, which is quadratic; affects the proof.
- **Misprint** in LS at proof of Lemma A.5, p. 91: the source says the tail sums exceed the reference sums; it should be the reverse inequality, giving the bound `3/2` from above; affects nothing.
- **Misprint** in LS at the paragraph before Lemma A.2, p. 90: the source says the variance is `√n/12`; it should be variance `(n + 1)/12`; affects nothing.

## For the human reviewers

- **Licence.** The cached LV text comes from `bimsa.net` (header of the LV extraction), an institutional site that is neither the publisher's nor the authors'; the README cites the Inventiones article and arXiv:1807.02721v3.
- **Licence.** Serre, *Galois cohomology*, is recorded as uncertified (paywalled); its two locators in README §2.11 (lines 1628 and 1633) were not checked against a text.
