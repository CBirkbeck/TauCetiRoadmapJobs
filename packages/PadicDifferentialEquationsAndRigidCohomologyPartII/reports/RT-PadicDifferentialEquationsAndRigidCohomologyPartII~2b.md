<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6868723394 -->
Red team round 2 pass b (claude) of a7dd27e

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) MS.6.1–MS.6.4 are stated for `X` not necessarily smooth, beyond what their suppliers cover

   Location: `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:2196` ("MS.6.1–MS.6.4
   work on a separated `k`-scheme `X` of finite type over the perfect field `k`") and `:2277–2279`
   (MS.6.4: "`h` is a global convergent morphism, which lifts by full faithfulness"), Needs `:2281`
   ("§§RD.3.47, RD.5.8").

   Claim: MS.6.2–MS.6.4 hold on any separated `X` of finite type; in particular MS.6.4 lifts the
   convergent map `h : N → M` to an overconvergent map on such an `X`.

   Witness: the parent's §RD.5.8 is stated for "`X` a smooth separated `k`-scheme of finite type", and
   its realisation functor §RD.3.37 for "(`X` smooth)"; Convention 5 (`README.md:159–160`) defines `M†`
   and `M = j^*M†` only "on a smooth `k`-scheme `X`". So "slope-filtered realisation" in MS.6.2–MS.6.4 and
   the full-faithfulness step of MS.6.4 have no supplier on a singular `X`. TSU line 1456 has the same
   generality and TSU line 1505 the same step.

   Repair: replace the first clause of `:2196` by "MS.6.1–MS.6.4 work on a smooth separated `k`-scheme `X`
   of finite type over the perfect field `k` (smoothness is the hypothesis of the realisation functor
   §RD.3.37 and of full faithfulness §RD.5.8, used in MS.6.4; Tsuzuki states §6.3 for `X` separated of
   finite type and uses the same full faithfulness);". Add to "Corrections to the sources": "**Tsuzuki,
   §6.3 and Corollary 6.9, pp. 28–29.** `X` is taken smooth: the convergent realisation and the full
   faithfulness used in the proof of Corollary 6.9 are theorems for smooth `X`." Tested: every consumer
   (MS.6.12–MS.6.14, and the Checks of MS.6.1 on `A¹`) has `X` smooth, so nothing downstream changes; the
   witness curves `C` are smooth already.

2. **F02** (P2) The request coefficient-linear-weil-ii drops the `ι`-realizable hypothesis of the theorem it extends, and does not name its scheme

   Location: `README.md:353` ("for an overconvergent F-isocrystal `E` on a separated `𝔽_q`-scheme with a
   `K`-algebra map `L → End(E)` …, `ι`-mixed of weight `≤ w` … each `Hⁱ_(c,rig)(X, E)` … is `ι`-mixed of
   weight `≤ w + i`"), and the same sentence in `design/plan.json`.

   Claim: the coefficient-linear form of §RD.6.85 for every pointwise `ι`-mixed `E`.

   Witness: the parent's §RD.6.85 reads "`X` a separated scheme of finite type over `𝔽_q` … `E` an
   `ι`-realizable overconvergent F-isocrystal … (a) If `E` is (pointwise) `ι`-mixed of weight `≤ w`". The
   request omits "of finite type", never introduces `X`, `ι` or the hypotheses on `K`, and omits
   realizability, so it asks for more than the known theorem and more than MS.6.10 uses (there `E` is
   `ι`-pure of weight 0, `README.md:2526–2529`).

   Repair (same text in the README and in the `gaps` entry of `design/plan.json`): "for a separated
   `𝔽_q`-scheme `X` of finite type, `K` with residue field `𝔽_q` and `σ_K = id`, a finite extension
   `L ⊂ K^alg` of `K`, a field isomorphism `ι : K^alg → ℂ`, and an overconvergent F-isocrystal `E` on `X/K`
   with a `K`-algebra map `L → End(E)` that is `ι`-pure of a real weight `w` for the `L`-linear Frobenius
   at every closed point (so that `E ⊕ (E^∨ ⊗ L_c)`, with the `L`-dual and a constant `L`-line with
   `ι(c) = q^w`, has `L`-linear characteristic polynomials with real coefficients under `ι`, the
   realizability hypothesis of §RD.6.85 as in §RD.6.57), each `Hⁱ_(c,rig)(X, E)` with its `L`-linear
   Frobenius is `ι`-mixed of weight `≤ w + i` (the coefficient-linear form of §RD.6.85(a))." Tested on
   the use in MS.6.10: `E = M†^∨ ⊗ M†|_U` is pure of weight 0, `c = 1`, `E ⊕ E^∨` has eigenvalues `a/b`
   and `b/a` with `|ι(a/b)| = 1`, closed under complex conjugation; the conclusion gives weights
   `≤ j < 2d` on `H^j_c`, which is what the pole argument needs. `H²_c(A¹, 1)` has eigenvalue `q`,
   weight `2 = 0 + 2`.

3. **F03** (P3) The Frobenius `d`-eigenvector of MS.1.7 is cited to the wrong definition

   Location: `README.md:1012–1013` ("(Ohkubo, Definition 9.3, p. 41, and Proposition 10.1 and proof,
   pp. 41–42)").

   Claim: Definition 9.3 defines the `d`-eigenvectors of MS.1.7, which lie in the `K`-space
   `Sol_log,λ(M)` and have `c ∈ K^×`.

   Witness: OHK lines 2149–2152: Definition 9.3 is for a `ϕ`-module over the non-complete field `R̃^bd`,
   with `c ∈ R̃^bd` and slope `log|c|_0/log|q^d|`. The definition for a `ϕ`-module over a complete field
   with `c ∈ F^×`, the one Proposition 10.1 applies to solutions, is Definition 4.9 (OHK lines 1168–1171,
   printed p. 23).

   Repair: replace "Ohkubo, Definition 9.3, p. 41, and Proposition 10.1" by "Ohkubo, Definition 4.9,
   p. 23, and Proposition 10.1", and in `sources.toml` add "4.9" to the `Definitions` of the OHK locator
   (keep 9.3, which the supplier request extended-log-robba-growth uses through Lemma 2.14). Tested:
   Definition 4.9 gives `f_2` the slope `log|q|/log|q| = 1` for `d = 1` and `log|q²|/log|q²| = 1` for
   `d = 2`, the values of the Check at `:1029–1031`.

4. **F04** (P3) The affine image theorem is stated only for the map to `Top`, and three targets use it for other convergent targets

   Location: `README.md:1596–1600` (MS.3.8: "the `A†_(U,K)`-image `L†_U` of
   `Γ(U, M†) → Γ(U, Top(M|_U))`"), used beyond that at `:1818–1819` (MS.4.4: "take the overconvergent
   image of the sum map into the identified isoclinic quotient"), `:2132–2134` (MS.5.7: the kernel of
   `Γ(M†^∨) → Γ(N^∨)` "is a finitely generated module stable under connection and Frobenius; by
   Dwork–Berthelot it is an overconvergent F-subisocrystal") and `:2240–2241` (MS.6.2).

   Claim: these images and kernels are overconvergent by a stated target.

   Witness: in MS.4.4 the map `(m, n) ↦ m + h(n)` into `Top(G_i(M))` is not the canonical map from
   `G_i(M†) ⊕ G_i(N†)` to its own `Top`, of rank `rank Top(G_i(M)) + rank Top(G_i(N))`; in MS.5.7 the
   target `N^∨` is an arbitrary isoclinic convergent object. Invertibility of the linearised Frobenius on
   such an image or kernel needs the flatness comparison of `:1604–1606`, which MS.3.8 proves only for
   `Top`; the Needs of MS.4.4 (`:1822`) and MS.5.7 (`:2138`) do not list MS.3.8.

   Repair: in MS.3.8, after "(Tsuzuki, Lemma 5.3 and its proof, p. 24).", add: "The same proof gives the
   general form: for an overconvergent F-isocrystal `M†` on such a `U`, a convergent F-isocrystal `P` on
   `U` and a morphism `M → P` of convergent F-isocrystals, the `A†_(U,K)`-image and the kernel of
   `Γ(U, M†) → Γ(U, P)` are the modules of sections of an overconvergent quotient and of an overconvergent
   F-subisocrystal of `M†`." Add "MS.3.8" to the `*Needs:*` of MS.4.4 and of MS.5.7, and in MS.5.7 replace
   "by Dwork–Berthelot it is" by "by the general affine image theorem of MS.3.8 it is". Tested on
   MS.5.7's Check: for the ordinary rank-two object and `N` the unit-root line, `Γ(M†^∨) → Γ(N^∨)` has
   kernel an overconvergent subobject of the irreducible `M†^∨` that is not everything, hence zero; on
   `A²` with `M† = O(−1) ⊕ O(0)` and `P = O(0)`, the image is `A†·e_2` with Frobenius 1 and the kernel
   `A†·e_1`.

Two P2 findings (S01, S02) and two P3 findings (S03, S04). No P1. All 19 findings of round 1 are
repaired at this head (one of them with a residual locator defect, raised as S03). The declared
supplier gaps are not raised as absent; S02 is a precision finding on the wording of one of them. No
finding of the repair report was marked `not actionable in this package`, so nothing is re-raised.

## Round 1 findings at this head

Line numbers are those of `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`.

| Id | Status | Repaired passage (witness) |
| --- | --- | --- |
| a/F01 | repaired | :413–417 "compatible with `φ` and with the universal continuous derivations … `∂_x = d/dx` goes to `(dx/dx_α)⁻¹·∂_(x_α)`"; Check :473–475 gives `−y²·(−y⁻²) = 1` at `∞`. |
| a/F02 | repaired | :949–955 defines `Sol_log(M) = Hom_(E†,∇)(M, R_log)` and `Fil_λ R_log = ⊕_j Fil_(λ−j)R·(log t)^j`; :958–963 disc/log comparison; MS.1.7–MS.1.8 use `Sol_log`. Agrees with OHK lines 639–643, 673–678, 1198–1212, 1262–1267. |
| a/F03 | repaired | :2322–2324 "an exact tensor functor, linear relative to the inclusion `L_1 ⊂ L_2`"; negative control :2352–2354. |
| a/F04 | repaired | :165–169 "`F(f)` is the unique solution with `F(f)(φ_M(m)) = φ(f(m))` … `F(f) = φ^*f ∘ Φ_M⁻¹`"; Check :520–523. |
| a/F05 | repaired (as a declared gap) | :343 clause (b), "an equivalence between unit-root `(φ,∇)`-modules over `E_η` and continuous `K^σ`-representations of `Gal(k(C)^sep/k(C))`"; used at :1187–1193 and :1358–1361; same text in `design/plan.json`. |
| a/F06 | repaired | :2301–2307 "`M_(β,L) = e_β·M_β^raw` with the `L`-linear endomorphism `F^n`"; agrees with TSU lines 1649–1656; used at :2365–2366, :2464, :2523. |
| a/F07 | repaired | :1595–1600 affine image theorem, proof :1603–1607; agrees with TSU lines 1266–1280. MS.3.10 :1675 "constructed in MS.3.8". Its scope is too narrow for three later uses: S04. |
| a/F08 | repaired | :1976–1982 "§RD.3.44, applied at each break, gives the slope filtration of `M` on all of `X`"; Needs :1984; the parent's §RD.3.44 states the common-vertex subobject on all of `X`. |
| a/F09 | repaired | :1964–1966 and :1996–1998, the instance `M = L_0 ⊕ L_1`, `N = L_1` (hull of rank 1, `S_min(N) = L_1 ≠ L_0 = S_min(M)`). |
| a/F10 | repaired | :624–625 "That `B(M) ≠ 0` for `M ≠ 0` is proved in MS.0.7"; Needs of MS.0.5 (:631) no longer has MS.0.7; MS.3.2 API has two bullets (:1464–1466). |
| b/F01 | repaired | :365–370 contract; :394–399 target with Tags 0BXZ, 0BY1–0BY3 (STACKS lines 60–65, 99–144); :1142–1146 uses `MaximalSpectrum.iInf_localization_eq_bot` (pinned, `Mathlib/RingTheory/Spectrum/Maximal/Localization.lean:38`). |
| b/F02 | repaired | :1636–1637 "for a finite étale morphism `f : Y → X` of smooth connected `k`-schemes"; Check :1662–1665; TSU line 1302 has "of connected schemes". |
| b/F03 | repaired | :2041–2047 relative hull over the generic pair; :2082–2091 explicit induction; no full faithfulness over `k(t)` is used. |
| b/F04 | repaired | Recomputed over the 69 `*Needs:*` lines: every `RD` id of a Needs line is in the contract; the contract ids in no Needs line are exactly the seven of the "extended by requests" row (:332). §RD.5.29 and §RD.6.60 no longer occur. |
| b/F05 | repaired | :2138–2139 "*Needs:* MS.4.2; MS.5.1; MS.5.2; MS.5.3; …"; :1938–1941. |
| b/F06 | repaired | :2460–2463 and :347, "Theorem 2.7 … states that every object is `ι`-mixed, with the purity of irreducible objects shown in its proof"; AE line 752. |
| b/F07 | repaired | :1066–1067 "Proposition 3.24, p. 18 … the solution spaces are defined on p. 17". |
| b/F08 | repaired, locator wrong | :1011–1012 defines the `d`-eigenvector and its slope; the locator given for it (:1013) is the wrong definition: S03. |
| b/F09 | repaired | :210–213 "a monoid acting on a field by ring endomorphisms (`[Monoid M] [MulSemiringAction M F]`)". |

No repair introduced a false statement. The new statements were recomputed in the table under
"Verified sound".

## Dependency check

    depcheck: 240 roadmaps, 2169 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The merge order has the parent at line 121 and this roadmap at
line 236; AlgebraicCurves and RigidAnalyticGeometry are on main.

## Verified sound

Counts: 0 declarations in `Suggested.lean` (80 lines read); 69 targets and all 2793 README lines
read; 85 distinct parent section ids resolved at the head of the parent's open pull request (all have
a heading; 31 statements read against their use: RD.0.9, 0.34, 0.41, 0.53, 1.72, 2.25, 2.26, 3.19,
3.25, 3.33, 3.34, 3.37, 3.43, 3.44, 3.47, 4.19, 5.7, 5.8, 5.8c, 5.89, 5.100, 5.103, 5.112, 6.2, 6.28,
6.57, 6.59, 6.77, 6.82, 6.85 and the headings of the rest); AlgebraicCurves Layer 12 (12A, 12B,
12B.0b, 12C at `TauCetiRoadmap/AlgebraicCurves/README.md:1468–1610`) and RigidAnalyticGeometry Layer 5
(`:434`) on main; 17 pinned declarations grepped at the pins of `lake-manifest.json` (Mathlib
`1b1ccf4`, Tau Ceti `2fd255d`), all present with the stated hypotheses; 57 locators checked for
statement number and printed page (TSU 20, OHK 19, DAD 7, STACKS 4, CT11 4, AE 3), 24 of them read in
full against the target; about 70 Checks recomputed; 9 gap slugs compared programmatically between
`design/plan.json` and the README (texts identical, supplier named in each).

`Suggested.lean`. No declaration: the declaration, variable and instance table is empty, the
`#check @name` comparison has zero cases, and no Lean was run (read-only pass). Single `import Mathlib`,
no `set_option`, no sorried data, no `lemma`. Headline theorems listed from the README: MS.4.6, MS.4.8,
MS.5.7, MS.6.13, MS.6.14 (end theorems), MS.0.4, MS.0.7, MS.1.1, MS.1.8, MS.2.5, MS.3.7, MS.4.2, MS.5.8.
Each needs F-isocrystals or `(φ,∇)`-modules over the Amice or bounded Robba field; the pinned Tau Ceti
has no file matching "Robba" or "isocrystal", and Mathlib's `WittVector.Isocrystal` has no connection.
None is statable; each is named in the module docstring with its missing carrier. No padding.

Policy. `git diff --stat origin/main...HEAD` lists 11 files, all in the package folder. No
pull-request number, process word, `lemma` or `set_option` in the README or the Lean file.

Ownership. `roadmaps grep` over main and the open heads for "PBQ", "dagger hull", "maximally bounded",
"completed generic field", `Q̄_p`-F-isocrystals with coefficients and "minimal slope": no owner other
than this roadmap (KloostermanSheavesAndBesselIsocrystals only lists TSU as a reference; SatoTateGroups'
"Lefschetz condition" is another notion). The parent has no occurrence of "log-growth", "Ohkubo",
"Abe–Esnault" or of an `L`-structure category. No second copy, no dropped id.

Gaps. Besides S02, each `needs` sentence states its hypotheses and conclusion and asks for nothing the
parent states: §RD.2.25 is for residue field `k((t))`, §RD.6.77 for curves and `ι`-real objects,
§RD.0.53 for a complete residue field, §RD.5.103 has no curve restriction statement.

Adversarial table (values computed on each side; `J` is the logarithmic module of MS.0.2,
`D = L_1 ⊕ L_0` the split sum of slopes 1 and 0):

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Conv. 4, MS.0.3 Checks | `ℚ_p(√p)`, `c = √p`, `q = p`; `q = p²`, `c = p²`, `e = 2` | `1/2`; `4/4 = 1`; `σ → σ²` keeps `(0, 1)` | holds |
| Conv. 6, MS.0.2 | rank one `a`; `J` | `F(f)(a e) = 1`, eigenvalue `a⁻¹`; `∇φ(e_2) = q·φ(e_1) dt/t` forces `φ(e_1) = q⁻¹e_1`; `F f_1 = f_1`, `F f_2 = q f_2` | holds |
| MS.0.1 | `A¹` at `∞`; uniformiser as coordinate; φ on residue discs | `−y²·(−y⁻²) = 1`; `dx_α ≠ 0` since `k(C)^p = ker d`; absolute Frobenius fixes each closed point, so `φ` preserves `]α[` | holds |
| MS.0.3 | `W(𝔽̄_p)[1/p]`; `ℚ_p`, `q = p²` | `K^σ = ℚ_p`; `K′ = ℚ_(p²)`, `σ = id` | holds; TSU 1961–1971 |
| MS.0.4 | `(E†)² → E`, `(a,b) ↦ a + αb` as a `φ`-map; `E† → E²`; `M† = 0` | needs `φ(α) = α`, so `α ∈ K^σ ⊂ E†`: no counterexample; `1 < 2`; no slope | holds |
| MS.0.5 | `J`; sub of bounded | annihilator of `f_1` is `E e_1`, `B = 1`; `Sol(M) → Sol(N)` onto, so bounded | holds |
| MS.0.6 | `J`; `a = −2, b = 0`, `g = 1/t` | `b − a = 1`, unbounded; `h′ = (q⁻¹ − 1)/t` has no solution in `E`, so no such extension | holds; CT11 547–554 |
| MS.0.7–MS.0.11 | `D`, `J`, `0`, `U = 0` | split and bounded; nonsplit and unbounded; `B(0) = 0`; `1 ⊗ 0 = 0` not PBQ | holds |
| MS.1.1 | `L_1 ⊕ J` | `B = L_1 ⊕ 1`; preimage of `L_1` is `L_1 ⊕ E e_1`, not PBQ; its `P_1 = L_1`; grades slopes `1 > 0` | holds |
| MS.1.2–MS.1.3 | `D`, `J` | `Top(G_1) ⊕ Top(G_2) = D`; `B = 1`, same after base change | holds |
| MS.1.4 | `E†(−1) ⊕ E†(0)` | `Q = E(0)`, `N† = E†(−1)`, `P_1(N) = P_1(M)` | holds |
| MS.1.5 Check | CT11 rank three | slopes `0, 1/2, 1`; solutions `Σ q^(−n/2)x^(q^n)`, `Σ q^(−n)x^(q^n)` unbounded; `B` slopes `1/2, 1`, not PBQ; `P_1 = ⟨e_1, e_3⟩` with `B = L_1` | holds; CT11 1006–1030, 1212–1215 |
| MS.1.6 | `Fil_0 R`; `log t`; `L = K̂^ur` | `= E†` (negative coefficients of `R` are bounded); in `Fil_1`, not `Fil_0`; norms on `span(d_j)` equivalent, dimensions `1, 2` kept | holds; OHK 650–653, 673–678, 1958–1967 |
| MS.1.7–MS.1.9 | `J`; `J ⊗ E†(−1)`; `λ < 0`; `diag(1, q)` | `μ = 0, 1` at `λ = 0, 1`; slopes `−1, 0` with `λmax = 1`: `−1 = 0 − 1`, `0 = 1 − 1`; both sides 0; `Sol_0` slopes `0, −1`, not PBQ | holds; OHK 1938–1941, 2158–2159 |
| MS.2.2 | `Σ p^n x^(p^n)` on `G_m`; `y² = x³ − x` over `𝔽_5` | `p^(−n) r^(−p^n) → ∞` at `∞`; `P = (0,0)` of order 2, `2 ∣ 4`, `μ_2 ⊂ W(𝔽_5)`; a rank-one lattice in a free line over the regular `A†_C` is `π^n A†_C` | holds |
| MS.2.3–MS.2.7, MS.2.9 | slope-1 line; `D`; Artin–Schreier; ordinary Legendre line `H` | twist needed; grades `1, 0`; `f^*f_*M† ↠ M†`; `H` PBQ, convergent only | holds |
| MS.2.8 | `p ≡ 1 (4)` | `π̄_p² = p²/π_p²`, `|·| = p`; distinct iff `ab ≠ 0`; quotient `O(π_p²)` of slope `0 < 1`, so not PBQ, `P_1 = L†(χ)` | holds |
| MS.3.1–MS.3.5 | `J`; irreducible rank 2 with slopes `0, 1`; `[[1,1],[0,1]]` over `𝔽_q` | `Sat(J) = 1`; `Sat = M†` of rank `2 > 1 = rank Top`; `σ(c) − c = 0 ≠ −1` on `W(𝔽_q)`, nonsplit, top reducible | holds |
| MS.3.6–MS.3.7 | `h = id` on `E†(−1) ⊕ E†(0)`; `J` vs `1` | identity; ranks `2 ≠ 1` without saturation | holds |
| MS.3.8–MS.3.10 | `A²`, `O(−1) ⊕ O(0)`; fold map | image `A†e_1`, Frobenius `q`; `A† ⊗_φ Â ≅ Â` because `A†` is finite flat over `φ(A†)`; pushforward not saturated | holds; scope: S04 |
| MS.4.1–MS.4.2 | kernel rank at a boundary point; `J` on `G_m`; restriction to `U′ ⊂ U` | `rank Top(N) − rank P > 0`; ranks agree, map on sections not injective; a kernel on `U′` extends to `U` (§RD.5.112) | holds |
| MS.4.3–MS.4.5 | unit Jordan block; `a = b`; `a < b` nonsplit; `a > b` | reducible top; `0 → Top(L) → Top(M) → Top(N) → 0` exact, kernel injects into `ker(N† → Top N) = 0`; `P_1 ∩ L† ∈ {0, L†}` gives PBQ iff nonsplit; kernel `↪ N†` is `0` or a splitting | holds |
| MS.4.6–MS.4.8 | `h = c·id`; dual of `a : S_min(M) → S_min(N)` | `g† = c·id`; `Top(N^∨) → Top(M^∨)` lifts to `N†^∨ → M†^∨`, dual `M† → N†` | holds |
| MS.5.1–MS.5.3 | `N = L_1 ⊂ L_0 ⊕ L_1`; `N ∩ S_(≤s)(M)`; `n = 2` | hull `L_1`; generic slopes `s`, pointwise `≤ s`, equal endpoints, so all `= s`; eigenvalues `±q`, slopes `(0,0,1,1)` | holds; DAD 438–442, 451–457, 487–500 |
| MS.5.4–MS.5.5 | `N = E(0) ⊂ M`; induction on `E†(0) ⊕ E†(−1)` | `Q† = E†(0)^∨`, hull rank 1; `H′ = E(0)`, `H/H′` of slope `1 > 0` | holds |
| MS.5.6–MS.5.7 | Galois closure `W → A¹`; hull of non-constant polygon | `MS(f_*) ⇒ MS(W) ⇒ MS(U) ⇒ MS(C)`; shrink by MS.5.3 before MS.4.2; `N ⊆ S_min(M)` of equal rank | holds |
| MS.5.8 | `P²_(𝔽_(p²))/𝔽_p`; Dwork on `A²`, line `x = 0` | `K_2 → K_2`, `2 = 2`; `H⁰ = 0` against 1, fibre at 0 has Frobenius `ψ(0) = 1` | holds; AE 509–514 |
| MS.6.1–MS.6.3 | `A¹_(𝔽_(p²)) → A¹_(𝔽_p)`; nonzero `h` restricted to `C` | 0 rational points over the origin; image of `h` has constant rank, so `h|_C ≠ 0`; `rank M ≤ rank Q ≤ rank N ≤ rank M` | holds |
| MS.6.4 | singular `X` | no realisation functor and no full faithfulness supplied | S01 |
| MS.6.5–MS.6.6 | `L`-irreducible as `K`-object; degree-2 point; `Spec 𝔽_q`, `L(λ)` | `Σ_a a·S` is `L`-stable, isotypic; raw dimension 2, coefficient 1; `λ^n = λ^n`; `H^(2d)_c(M) ≅ H⁰(M^∨)^∨(−d)` from §RD.5.89 at `i = 0` | holds; TSU 1649–1656 |
| MS.6.7 | `(L, σ^n) = (K_m, σ^m)` in TSU Lemma B.1 | `n·deg(L/K) = m·m = m²` unprojected, `m` projected | holds; TSU 2110–2112 |
| MS.6.8 | `X_m` disconnected | `End` is a product, restriction to `C` not injective: excluded by the bijectivity hypothesis | holds; TSU 1900–1907 |
| MS.6.9 | `ℚ_3(√5)`, `a = (1 + √5)/2` | `T² − T − 1` takes `2, 2, 1` mod 3; `|ι|` values `1.618, 0.618` | holds |
| MS.6.10 | purity of `M^∨ ⊗ M` on `U`; pole | fibres equal those of `N^∨ ⊗ M`, weight 0; `H^(2d)_c` has `q^d`, others `≤ q^(j/2) < q^d` | holds given S02's contract |
| MS.6.11–MS.6.14 | `g′ = 2`, `h = 3`; difference of two lifts | `τ = 3/2`, `g′τ = 3`; a nonzero difference is an isomorphism inducing 0 on `Top(N) ≠ 0` | holds; TSU 1936–1952 |

Wording. 16 passages put beside 6 sources (MS.0.1 / STACKS 55–65, 99–144; MS.0.3 / TSU 1961–1971;
MS.0.6 / CT11 547–557; MS.1.5 Check / CT11 1006–1030; MS.1.6 / OHK 639–682, 1198–1212, 1262–1275;
MS.1.7–MS.1.8 / OHK 1925–1941, 2149–2165; MS.3.8 / TSU 1254–1280; MS.5.1–MS.5.3 and MS.5.5 / DAD
435–500; MS.6.1 / TSU 1456–1463; MS.6.2–MS.6.4 / TSU 1468–1505; MS.6.5 / TSU 1647–1656; MS.6.7 / TSU
2095–2112; MS.6.8 / TSU 1900–1914; MS.6.13–MS.6.14 / TSU 1936–1952; gaps / AE 81–87, 509–514,
747–752). The longest shared run remains the hypothesis list of AE line 510 (13 words, a fixed list
of technical conditions). The proof routes of MS.3.8 and MS.1.8 have the same three steps as TSU
1272–1280 and OHK 2160–2165, in other words and with at most four consecutive words shared; the steps
are forced by the argument.

Arrangement. TSU has the largest share. Its sections against the layers are as in round 1: three
layers (MS.0–MS.2) draw on §3, MS.3 spans §§4–5, MS.5 comes from DAD §4 and MS.6 joins §6.3, §7 and
Appendix B; no one-to-one run. The order MS.0 → MS.1 → MS.2 → MS.4 and MS.3 → MS.4 → MS.6 is forced by
the `*Needs:*` lines of MS.1.1, MS.2.5, MS.4.1, MS.4.3 and MS.6.2.

Source independence: 16 passages compared with 6 sources, none shared; largest share TSU, 76 of 124 author-led locator groups; contents compared with TSU: independent; DEJONG98 and TSU98 are uncertified and were not compared

## Not verifiable

- de Jong 1998, Proposition 6.4, and Tsuzuki 1998, Theorems 4.2.6 and 7.2.3: `uncertified` in
  `sources.toml`, cited by locator, text not read.
- The 54 parent sections whose headings resolve but whose statements were not read against their use.
- Ohkubo, Lemmas 1.12–1.14, 2.11–2.13 and Theorem 12.7: existence and pages confirmed, statements not
  compared line by line.
- The dual of Chiarellotto–Tsuzuki's rank-three module being PBQ (MS.1.5, first Check): not recomputed.
- Ownership against the open pull requests whose files the brief does not list was checked only through
  `roadmaps grep`.
- Whether the parent will accept the nine supplier requests: a declared contract.

## Source issues

- **Gap** in TSU at §6.3 and Corollary 6.9, pp. 28–29: the source says its scheme is separated of finite type and lifts a convergent map by full faithfulness; it should be assumed smooth, where that theorem holds; affects a stated result.
- **Misprint** in TSU at proof of Corollary 6.8, p. 29: the source says the constructed isomorphism on the witness curve has the restriction of the second object as source and target; it should end at the restriction of the first; affects nothing.
- **Misprint** in OHK at Definition 2.9, p. 13: the source says the growth index belongs to the filtration step, twice; it should be the element that belongs to it; affects nothing.
- **Error** in OHK at Corollary 2.7, p. 13: the source says the power-series and Robba growth conditions agree for a series indexed by all integers; it should be for power series only; affects a stated result.

## For the human reviewers

- **Scope.** The roadmap is built on one research article (TSU, about three fifths of the locators) with DAD, OHK and CT11; all are published or on arXiv. Whether a roadmap of this width is wanted is yours to decide.
- **Licence.** AE is read from an author page (`sources.toml`, `licence_class = "author-page"`); DEJONG98 and TSU98 are `uncertified` and cited by locator only.
- **Scope.** `README.md:2691–2770` lists 34 corrections to published sources, among them a claimed gap in the proof of DAD Proposition 4.2.12; whether such a list belongs in a roadmap is a human decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a7dd27ef91f47d714b0409407bf4b0a2cfa73c2e", "job": "RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2b", "model": "fable", "worker": "chris-x30"} -->
