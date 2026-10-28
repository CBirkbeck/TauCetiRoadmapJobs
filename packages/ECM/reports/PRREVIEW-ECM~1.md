# Review of ECM (pull request #419 at 655a340)

**Verdict:** needs changes

🤖 Independent AI review at `655a34020322b44b0b1cf806253edf568d117f34`. Five findings, two blocking (P2). The supplied gate passes. The mathematical coordinate checks below found no counterexample; passing those checks does not repair the scope or missing acceptance theorems. The mathematical library can be retained while repairing these defects, so this is not a rejection of the whole development.

## R01 (P2) — Remove the executable algorithms from the deliverable

**Location:** `TauCetiRoadmap/ECM/README.md:212–227`; also lines 35–36, 117–126 and 200–207. Quote: “Define finite algorithms on natural-number residues for the setup, ladder, stage-1 schedule, stage-2 schedule, and recovery specified above.”

**Claim:** The roadmap owns executable procedures, their termination, recursive recovery and a bounded factor search. These are explicitly excluded by this review's mathematical-roadmap contract. This is an end-product scope defect, not merely the occurrence of the word “algorithm” in background material.

**Witness:** Milestone 12 asks for a search returning factors; milestone 11 prescribes pruning, returning and splitting nodes. Neither request is just an identity or an existence theorem about finite mathematical data.

**Repair:** Retain the Montgomery/Kummer library, polynomial identities, reduction comparisons, annihilator criteria, cross-difference criteria and mathematical gcd-separation results. Replace algorithm construction, execution, termination and search-return claims with precisely quantified mathematical statements about scalar multiples and finite products. Remove the executable binary ladder, schedule generator, recursive recovery and integrated search as deliverables. Algorithmic motivation may stay in the introduction. Do not transfer these implementations to a newly invented supplier.

**Repair check:** The mathematical claims still express the useful examples: modulo 35 the doubling formula at `(22,1)`, with `(A,B,N,D)=(0,1,2,4)`, gives `(21,25)`, and `gcd(25,35)=5`. For leaves `[3,5]` modulo 15, the product has gcd 15 while the individual gcds are 3 and 5. Neither fact requires a search implementation.

## R02 (P2) — State the native headline theorems in Suggested.lean

**Location:** `TauCetiRoadmap/ECM/Suggested.lean:6–14,19–45`. Quote: “the definitions that fix the roadmap's coefficient and scaled-doubling conventions”.

**Claim:** The acceptance file contains three definitions and one proved discriminant example, but zero headline `theorem` declarations. Its docstring lists omitted theorems without identifying missing carriers. Some substantial omitted mathematics is already statable using the file's own simple definitions and native curve points.

**Witness:** A scratch copy elaborated a doubling-correctness statement on `(model A B).toAffine.Point`, using the existing `double`, native addition, and a two-case coordinate map. Only the intended `sorry` warnings remained.

**Repair:** State the retained headline results that are statable at the pins, starting with the actual scalar-doubling correctness theorem, including nonzero output, under explicit field, odd-characteristic, nonsingularity, `D ≠ 0` and `4*N=(A+2)*D` hypotheses. Use native curve points, not arbitrary functions or a free predicate. The simple coordinate map sends infinity to `(1,0)` and a monic-model point `(x',y')` to `(x',B)`. Keep definitions only when these theorems need them. For each genuinely unstatable retained headline, name the missing carrier/construction in the module docstring. Do not put elementary imported facts or boundary tests in its place.

**Repair check:** Native addition requires a `DecidableEq` instance at this pin; carrying it explicitly made the probe elaborate under default options. For `A=0,B=1` over 𝔽₇, `P=(1,3)` has `2P=(0,0)` and the displayed double is `(0,4)`, a valid representative of that point. Infinity doubles to `(4,0)`. For singular `A=2`, `(X,Z)=(-1,1)` instead produces `(0,0)`, so the nonsingularity hypothesis is substantive. The original file still elaborates without diagnostics; the defect is the missing acceptance statements, not a build failure.

## R03 (P3) — Cite the existing generic divisibility and fibre inputs

**Location:** `TauCetiRoadmap/ECM/README.md:200–202`; related inputs at lines 80 and 170–173. Quote: “Prove equality with the full product and `p ∣ product ↔ ∃ leaf, p ∣ leaf` for prime `p ∣ n`, including the empty list.”

**Claim:** The generic prime-divides-a-list-product theorem is requested as new theory even though it is already available at greater generality. The generic order-annihilation and affine equal-x fibre results also need exact supplier citations rather than being treated as fresh foundational work.

**Witness:** `Mathlib/Data/List/Prime.lean:28`, `Prime.dvd_prod_iff`, gives the list statement over every commutative monoid with zero. Its natural-number specialization compiled with `exact hp.prime.dvd_prod_iff`.

**Repair:** Delete the generic product-divisibility target and cite `Prime.dvd_prod_iff` in the supplier contracts. Retain any new comparison connecting a finite residue product to that theorem. Likewise cite `addOrderOf_dvd_iff_nsmul_eq_zero`, `addOrderOf_dvd_natCard` and `WeierstrassCurve.Affine.Point.X_eq_iff` as inputs; retain the genuinely new Montgomery-coordinate, quotient and detection bridges. Do not add sorried copies to `Suggested.lean`.

**Repair check:** The imported product theorem gives false ↔ false for the empty list and `p=3`, true ↔ true for `[3,5]`, and false ↔ false for `[1,5]`. The order-annihilation application also compiled using one `exact` invocation. The full source locations and hypotheses are below.

## R04 (P3) — Give each mathematical target a verifiable source locator

**Location:** `TauCetiRoadmap/ECM/README.md:244–251`, and all twelve milestones. Quote: “coordinate formulas and their hypotheses.”

**Claim:** The bibliography contains whole-paper page ranges and website/repository links, but the claims have no theorem, section, equation or page locators. There is no source manifest. Consequently the requested seeded locator audit cannot be certified as written.

**Witness:** The entire §4 formula target has no attached locator. The readable EFD entries identify doubling and differential addition precisely; the GMP-ECM landing-page extraction contains no Suyama formula or mathematical section.

**Repair:** Add claim-level locators and a single source entry per work in `sources.toml`. For example, the doubling identity matches EFD `dbl-1987-m-3` and differential addition matches `dadd-1987-m-3`; both identify Montgomery p. 261. Supply a mathematical, versioned locator for Suyama and explicit sources or proof routes for the complete exceptional-set claims. Lenstra §2.2, pp. 664–665, and §2.3, p. 665, are useful background for reduction-compatible arithmetic, but do not certify all odd-characteristic Montgomery statements: that paper's short-Weierstrass treatment excludes characteristic 3. Keep the characteristic-3 mathematics and provide its actual justification instead of narrowing it away.

**Repair check:** EFD's `4*a24=a+2` and `C*(BB+a24*C)` match this README's `N/D=(A+2)/4` and `C*(D*V+N*C)` after multiplying both coordinates by nonzero `D`. Source availability and the fifteen reviewed targets are recorded below; unavailable text is not guessed.

## R05 (P3) — Supply concrete Checks, target dependencies and matching names

**Location:** `TauCetiRoadmap/ECM/README.md:63–67,229–242`; `TauCetiRoadmap/ECM/Suggested.lean:21,33,41`. Quote: “Supply examples of a nonsingular and a singular model.”

**Claim:** This asks future implementers to choose examples instead of providing three discriminating Checks per definition. The final list similarly names example categories without computing them. There are no `*Needs:*` lines, no per-layer Examples/Dependencies, and no exact supplier-contract section. The Lean names `model`, `Pair` and `double` are not identified as such in the README, which instead displays the mathematical name `xDBL`.

**Witness:** Milestone 1 gives no particular field, coefficients or discriminant value for either requested example. The same omission affects the coordinate convention that distinguishes `(A+2)/4` from `(A−2)/4`.

**Repair:** Use the required Summary/Scope/Conventions/Exact supplier contracts/build-order/layer structure. For each retained definition, give its precise API and at least three computed, discriminating Checks; include the hypotheses and local/supplier dependencies of each target. Identify every kept Lean declaration by its actual name. Add layer Examples and Dependencies and identify downstream mathematical consumers. The final integration paragraph cannot substitute for those local contracts.

**Repair check:** Suitable model Checks are `(A,B)=(0,1)` over ℚ with `Δ=-64`, `(2,1)` with `Δ=0`, and `(0,0)` with `Δ=0`. A convention Check at `(X,Z)=(2,1), A=0, D=4` gives `(36,160)` with `N=2`, but `(36,-96)` with the wrong `N=-2`; the projective cross difference is `-9216`, not zero. Include infinity and distinguished/non-distinguished two-torsion Checks as computed below. The dependency checker should still be rerun after writing the actual contracts.

## Verified sound

The verification below distinguishes computed examples, declarations actually opened at the pins, and source text actually read. It is not a claim that finite tests prove the universal targets.

**Repository and gate.** The reviewed head is exactly the requested hash. The outside-folder diff is empty. No pull-request file was changed. The worker's gate reports every scanner, dependency, metadata, stray-file and targeted-build check passing, including `build=0 OK`. Direct `lake env lean` elaboration of `TauCetiRoadmap/ECM/Suggested.lean` also exited 0 with no diagnostics. The file has a single `import Mathlib`, no sorry'd data, no `set_option`, no admitted examples, and no `lemma` declarations. No previous review was supplied.

The required dependency check returned exactly:

```text
depcheck: 162 roadmaps, 1170 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. There are zero `*Needs:*` lines to audit; the checker does not supply the missing local dependency specifications. The written milestone order is coherent at the coarse level: geometry 1–6, reduction/gcd 7–8, detection 9–10, independent batching 11, integration 12. The reference from 5 to 12 describes a subsequent comparison, not an input used to prove 5. No declared supplier gaps were supplied.

**Pins and declarations opened.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These match `lake-manifest.json`. File paths below are library-relative.

| Pinned location | Declaration and actual content checked |
|---|---|
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:100–132` | `b₂`, `b₄`, `b₆`, `b₈`, `Δ`; substituting `(0,AB,0,B²,0)` yields `16 B⁶(A²−4)` with the stated sign. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366` | `WeierstrassCurve.IsElliptic` asks for `IsUnit Δ`; over a field this is nonvanishing. It is not merely the existence of a point group. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477` | `WeierstrassCurve.Affine.Point` consists of infinity and affine points carrying `Nonsingular`. It does not include singular affine points. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:647` | `Point.X_eq_iff`: equal affine x-coordinates iff the native points are equal or negatives. No second elliptic group law is needed. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:653,658,806` | Native addition and `AddCommGroup`, with `DecidableEq` for field addition. There is no `IsElliptic` premise for the group on nonsingular points. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:42,48,60,110` | Native projectivization is the quotient of nonzero vectors by unit scaling; `mk` needs a nonzero vector and `mk_eq_mk_iff` uses a unit multiple. It does not supply a rational lift to the chosen elliptic curve. |
| `Mathlib/Data/ZMod/Basic.lean:331,513,519` | `ZMod.castHom`, `intCast_zmod_eq_zero_iff_dvd`, `natCast_eq_zero_iff`. The ring hom needs divisibility of characteristics, not primality of the source modulus. |
| `Mathlib/GroupTheory/OrderOfElement.lean:275–278,1194–1198` | `addOrderOf_dvd_iff_nsmul_eq_zero` and `addOrderOf_dvd_natCard`, generated by the displayed `to_additive` declarations. The first needs only an additive monoid; the second only an additive group, with `Nat.card=0` in the infinite case. |
| `Mathlib/Data/List/Prime.lean:28` | `Prime.dvd_prod_iff` over a commutative monoid with zero, including the empty list. |
| `Mathlib/Algebra/GCDMonoid/Finset.lean:48,57,61,69` | `Finset.lcm`, its empty value 1, universal divisibility and membership-divisibility properties. |
| `Mathlib/Algebra/GCDMonoid/FinsetLemmas.lean:33,39` | `Finset.lcm_eq_prod` for pairwise coprime naturals and `Finset.factorization_lcm` for nonzero entries. These supply the generic lcm machinery. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73,86` | `WeierstrassCurve.pointCount` counts all affine equation solutions plus one. `pointCount_eq_card_point` requires finiteness of those solutions and `W.IsElliptic`, exactly as the README says. |

Twelve pinned file-location groups were opened. The three elaborated original signatures were checked mechanically: `model` takes a commutative ring and two coefficients; `Pair` only takes its carrier; `double` takes a commutative ring, two coefficients and a raw pair. None loses a section binder. In particular, `double` makes no implicit assertion that its input/output is a projective point or that `N/D` has the intended value.

The original file has **zero sorried theorems**, so there is no sorried padding to test with one tactic. The discriminant `example` is proved and checks a nontrivial convention of a retained definition; it is not an admitted example or a reason to delete that Check. Separate scratch probes confirmed that the generic list-product and order-annihilation claims each close with one library lemma.

A scratch acceptance signature used actual native points and the existing definitions. With `coordinates` defined by the two cases described in R02, this elaborated with no options and only `sorry` warnings:

```lean
theorem doubling_correct {K : Type*} [Field K] [DecidableEq K]
    (A B N D : K) (h2 : (2 : K) ≠ 0) (hB : B ≠ 0)
    (hA : A ^ 2 ≠ 4) (hD : D ≠ 0)
    (hND : 4 * N = (A + 2) * D)
    (P : (model A B).toAffine.Point) :
    let out := double N D (coordinates A B P)
    let target := coordinates A B (P + P)
    (out.x ≠ 0 ∨ out.z ≠ 0) ∧
      out.x * target.z = target.x * out.z := by
  sorry
```

This is a statability witness, not a proved replacement. A native-point coordinate-fibre signature also elaborated; its affine input should be imported from `Point.X_eq_iff`, not presented as newly owned generic theory.

**Ownership and cross-roadmap resolution.** Main was read at `c99407021ca54e77e61223896e876565b8c18aa4`. Two merged reference roadmaps were read for shape: `TauCetiRoadmap/EllipticCurves/README.md` and `Completed/ProfiniteArithmetic/README.md`. The former's Layer 1, specifically line 530, owns quadraticity of degree; Layer 3 begins at line 683 and owns the Hasse bound. These resolve both section-specific ownership claims in ECM lines 28–31. Neither result is actually needed by the conditional finite-group arguments here.

The required indexed roadmap searches covered Montgomery/Suyama curves, Kummer lines, product trees, gcd/factor extraction, order divisibility and lcm objects, and were supplemented by board-package searches. The relevant open `ComputationalNumberTheory` roadmap was opened through the roadmap service: its scope/Layer 1 owns factor presentations, and Layer 3 owns finite point-count presentations, not Montgomery differential arithmetic. No second owner of the Montgomery model, Suyama family or the displayed differential arithmetic was found in the available main/open/package material. No duplicate fully qualified `TauCetiRoadmap.ECM` declaration was found outside this file. Thus ECM can own the new coordinate library; it must still import the generic inputs listed above. This is not a reason to add a dependency on ComputationalNumberTheory. No ownership conclusion depends on an open revision of an existing roadmap replacing its main version.

**Sources and the fifteen-target audit.** The brief says “a random sample of 15 targets (none found by heading)” but supplies no target identifiers or seed list. The document has no claim-level source locators or “unverified” locator flags. Rather than invent an unavailable seeded selection, this review covered the following fifteen explicit assertions across all twelve milestones, and the remaining mathematical assertions in the adversarial table. This is not recorded as fifteen successfully certified locators.

Sources were fetched through the sources service. Keys used consistently: `lenstra1987`, `montgomery1987`, `efd`, `gmpecm`. No source text was copied into the repository and no source manifest was edited.

| Target sampled | Text/locator actually inspected | Result at the claimed generality |
|---|---|---|
| S01: §1 model/discriminant | `efd line 24`; pinned invariant definitions above | Equation supported; discriminant identity kernel-checked in the submitted example. No README source locator. |
| S02: §2 monic conversion | `lenstra1987 line 155` and lines 156–179; pinned model | Lenstra uses short Weierstrass equations in characteristic other than 2 and 3; not a source for this general conversion. Algebraic witness below works without a square root. |
| S03: §3 fibres | Pinned `Point.X_eq_iff`; `lenstra1987 line 174` | Native affine theorem verified; projective extension/quotient remains ECM's bridge. No claim-level literary locator. |
| S04: §4 doubling formula | EFD `dbl-1987-m-3`, `efd line 166`, assumptions line 172, formulas lines 180–186 | Formula and the plus-two convention agree exactly after scaling by D. |
| S05: §4 doubling nonvanishing | EFD doubling entry; native invariants | EFD formula entry is not the requested complete exceptional-set theorem. Verified by adversarial computation, not certified from a stated source theorem. |
| S06: §4 differential-addition formula | EFD `dadd-1987-m-3`, `efd line 247`, formulas lines 259–266 | Polynomial formula agrees, with the first pair representing the difference. |
| S07: §4 exceptional iff | Same EFD entry | The entry does not state the complete infinity/distinguished-two-torsion iff. Tested separately below. |
| S08: §5 bit-step/ladder invariant | EFD `ladd-1987-m-3`, `efd line 328`, assumptions line 334, formulas lines 342–354 | Arithmetic step supported; no verified source theorem for the unspecified checked-trace interface/termination. |
| S09: §6 Suyama family | `gmpecm line 5` through line 37 | Landing page only. Parameterization and full exceptional polynomial cannot be source-certified here. |
| S10: §7 prime reduction | Lenstra §2.2, printed pp. 664–665, `lenstra1987 line 613`, lines 616–640; §2.3 p. 665, line 654 | Supports reduction-compatible arithmetic for its short-Weierstrass setting. Its factor 6 excludes characteristic 3; native polynomial naturality must justify ECM's broader setting. |
| S11: §8 gcd separation | Lenstra §2, p. 663, `lenstra1987 line 582`; §2.2 p. 664, lines 625–633; native ZMod facts | Proper-divisor interpretation and three gcd outcomes supported; residue equivalence follows from pinned facts. |
| S12: §9 stage exponent M | Introduction p. 649, `lenstra1987 line 49`; native finite lcm | Lcm example supported. Native lcm factorization supplies the general algebraic route, not a missing standalone literary theorem. |
| S13: §9 annihilation/detection | Lenstra §2.3 p. 665, `lenstra1987 line 671`; §2.6 pp. 666–667, lines 716–725; native order theorem | Supports composition and conditional detection background. §2.6 has a different exponent and extra hypotheses, so it is not a verbatim source for this target. |
| S14: §10 stage-2 signed criterion | Montgomery cited paper; EFD differential formulas; native equal-x criterion | Montgomery scan unreadable here. The signed group implication was computed below; coverage and complete continuation are not source-certified. |
| S15: §11 batching/recovery | Pinned `Prime.dvd_prod_iff`; GMP-ECM landing page | Generic product divisibility verified. No source-certified recursive-recovery theorem; executable recovery must be removed under R01. |

The accessible Lenstra copy is the published article, with printed page numbers matching the bibliography. EFD itself gives Montgomery's printed p. 261 for the formulas. Montgomery's primary scan was fetched but not read; the reference to its page is therefore reported as EFD's locator, not independently certified numbering. Useful legal links: [Lenstra institutional copy](https://pages.cs.wisc.edu/~cs812-1/Lenstra1987.pdf), [EFD Montgomery XZ entries](https://www.hyperelliptic.org/EFD/g1p/auto-montgom-xz.html), [Montgomery course copy](https://wstein.org/edu/124/misc/montgomery.pdf).

**Adversarial computations.** Unless otherwise specified, `E_p` denotes `y²=x³+x` over 𝔽ₚ, `O` infinity, and `T=(0,0)`. Raw coordinates below refer to Montgomery x, not the rescaled monic x'. In the exhaustive sweep, all `A` with `A²≠4` and all nonzero `B` were tested for p=3,5,7,11: **134 models, 1,400 doublings, 16,544 ordered point-pair tests**, checking fibres in both directions, addition correctness on nonzero outputs and the exact exceptional iff. There were zero failed assertions. The arithmetic was computed directly over finite fields and compared to the tangent/chord group formula; it is independent numerical evidence, not a kernel proof.

Every formula/definition/convention and each theorem family in the README is covered below. Where the README supplies no actual construction, the row identifies the specific mathematical condition checked and explicitly avoids claiming execution of a nonexistent definition.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| §1 / Lean `model`: coefficients and discriminant | ℚ, A=0,B=2 | coefficients `(0,0,0,4,0)`; Δ=-4096; `16·2⁶·(0−4)=-4096` | Equal; agrees with proved example | Add Check and locator |
| §1 nonsingularity criterion | ℚ, (A,B)=(0,1),(2,1),(0,0) | Δ=-64,0,0; `B≠0 ∧ A²≠4` = true,false,false | Correct distinguishing controls | R05 |
| §1 polynomial identity without ellipticity | Zero ring; 𝔽₂ with A=0,B=1 | Zero ring: both expressions 0; 𝔽₂: 16=0 and Δ=0 | Polynomial statement survives; geometric hypotheses exclude 𝔽₂ | Preserve general ring identity |
| §1 extensionality/ring maps | `(0,0,0,4,0)` over ℤ reduced mod 5 | Δ=-4096 maps to 4; Δ of reduced coefficients =4 | Equal coefficient tuples and invariants | Cite native map inputs |
| §2 conversion and inverse, nonsquare B | ℚ, A=0,B=2,(x,y)=(1,1) | Original equation: 2=2; transformed (2,4): 16=8+8; inverse gives (1,1) | No square root of 2 needed | Add Check |
| §2 infinity and group transport | Identity embedding; P=O | Conversion sends O to O and back; O+O=O on both carriers | Correct boundary, but no transported structure yet defined | Specify map/API |
| §2 embeddings | ℚ→ℝ on preceding point | Both routes give (2,4); Δ=-4096 on both routes | Correct naturality instance | Add local dependency |
| §3 / Lean `Pair`: valid/invalid pairs | (1,0),(0,1),(0,0) over 𝔽₇ | O, x=0, and no projective point respectively; cross products with (0,0) all 0 | Invalid pair would make equality falsely universal | Preserve nonzero premise |
| §3 fibres, positive and negative directions | E₇, P=(1,3), −P=(1,4), T | κP=κ(−P)=(1:1); κT=(0:1); cross(P,−P)=0, cross(P,T)=1 | Fibre iff true/true and false/false | Import `Point.X_eq_iff`; build quotient bridge |
| §3 infinity fibre | E₇, O and T | κO=(1:0), κT=(0:1); cross=1, O≠±T | Infinity not identified with T | Add Check |
| §3 image rather than rational surjectivity | E₇, x=2 | RHS=2³+2=3; squares are {0,1,2,4}; no y, although (2:1) exists | Image qualification necessary | Preserve |
| §3 scaling / cross-product equality | (2,1),(6,3) over ℚ | 2·3−6·1=0, scale=3; (2,1),(3,1) cross=-1 | Both directions discriminated | Add Check |
| §3 scaling over rings | ℤ/4, pair (1,0), scales 3 and 2 | 3 is a unit and (3,0) equivalent; 2 is nonunit and (2,0) has no unit coordinate | Nonzero alone must not be promoted to ring-projective validity | Keep unit premise |
| §3 scalar compatibility | E₇, P and −P | [2]P=[2](−P)=T; κ values (0:1) both | Scalar action descends through sign | Build descended map explicitly |
| §4 / Lean `double`: plus-two convention | ℚ, A=0,N=2,D=4,P=(2,1) | U=9,V=1,C=8; output=(36,160); x=9/40 | Agrees with doubling on B=10 curve, point (2,1) | R02/R05 |
| §4 wrong minus-two convention | Same raw pair, N=-2 | output=(36,-96), x=-3/8; cross against correct result=-9216 | Wrong convention rejected | Add negative-control Check |
| §4 doubling identity on curve | E₇, P=(1,3), N=2,D=4 | raw double=(0,4); actual 2P=T with pair (0,1); cross=0 | Valid matching output | Add headline |
| §4 doubling infinity / distinguished torsion | E₇, pairs (1,0),(0,1) | Both double to (4,0); O+O=O and T+T=O | Nonzero output in both cases | Add Checks |
| §4 doubling non-distinguished torsion | E₅, T₂=(2,0) | raw double=(1,0); 2T₂=O | Correct | Preserve separate torsion cases |
| §4 nonvanishing depends on hypotheses | ℚ, A=2,N=1,D=1,(-1,1); also N=D=0 | First gives (0,0) on singular model; N=D=0 gives (0,0) for every input | Both hA and hD serve a purpose | Carry them in headline |
| §4 char 3 and char 2 | E₃, P=(2,1); raw (1,1) in 𝔽₂ | 𝔽₃ double=(0,1)=κ(2P); 𝔽₂ U=V=C=0 | Odd-char result passes p=3; p=2 excluded | Do not narrow to p>3 |
| §4 homogeneity | ℚ, scale raw (2,1) by 3 | output (36,160) becomes (2916,12960)=81·(36,160) | Degree four | Add Check |
| §4 polynomial ring-map compatibility | Same integral formula reduced mod 7 and 5 | (36,160) maps to (1,6) and (1,0); direct formula has same outputs | Equal | Specify target maps |
| §4 differential addition on regular points | E₇, P=(1,3), Q=O, R=P | output=(4,4); κ(P+O)=(1:1); cross=0 | Valid | Preserve |
| §4 exceptional R=O | E₇, Q=P, R=O | a=b=0 for P=(1,1); output=(0,0); P−P=O | Exceptional iff agrees | Add Check |
| §4 exceptional R=T | E₇, P=(1,3), Q=(1,4) | P−Q=T; a=b=0; output=(0,0) although P+Q=O | Invalid pair is not an infinity representative | Add Check |
| §4 other two-torsion is not exceptional | E₅, P=(2,0), Q=O, R=P | output=(1,3); cross with (2,1) is 1−6=0 mod 5; R≠O,T | Correct distinction | Preserve explicit example |
| §4 differential homogeneity | Raw pairs (2,1),(3,1),(4,1), scales 2,3,5 | (100,16) becomes (18000,2880)=180·(100,16) | Bidegree (2,2,1) | Add algebraic Check |
| §4 cleared formulas on nilpotents | 𝔽₅[ε]/(ε²), A=0, pair (ε,0) | U=V=ε²=0, C=0, output=(0,0) | Raw identity valid; no field/projective theorem applies | Keep algebra/geometric distinction |
| §5 zero and one ladder specifications | E₇, base P=(1,3), k=0,1 | Required states (O,P), (P,T); scalar values [0]P=O,[1]P=P,[2]P=T | Mathematical invariant consistent | Remove executable deliverable; retain mathematical identities |
| §5 bit-step invariant | Same P, k=1 | bit 0 requires ([2]P,[3]P)=(T,−P); bit 1 requires ([3]P,[4]P)=(−P,O) | Group values agree with stated index update | No actual ladder definition to execute |
| §5 regular vs exceptional traces | E₇, base P versus base T | fixed difference P gives regular xADD; fixed difference T yields (0,0) in first (T,O,T) addition | Concrete distinction, not a conclusion hidden in a predicate | Specify retained conditions; R01 |
| §6 Suyama setup | 𝔽₁₃, σ=2 | u=12,v=8,c=5,d=7,x=5,A=8,B=5; equation 5=5; Δ=2 | Nonsingular positive example | Add Check/locator |
| §6 Suyama Kummer coordinate | Same setup | (u³,v³)=(12,5); (x,1)=(5,1); cross=12−25=0 mod 13 | Correct | Add Check |
| §6 scaled convention | Same setup | N=c=5,D=4d=2; N/D=9; (A+2)/4=9 | Equal, D nonzero | Add Check |
| §6 denominator vs singularity | 𝔽₃, σ=1 | u=2,v=1,c=2,d=2,x=2,A=2,B=0; gcd(d,3)=1, Δ=0 | Unit denominator does not ensure ellipticity | Preserve and instantiate warning |
| §6 other small odd characteristics | All σ over 𝔽₃,𝔽₅,𝔽₇,𝔽₁₁ | Number of admissible σ is 0,0,0,0; 𝔽₁₃ has σ=2 above | No assertion that an admissible parameter always exists | Spell out exceptional polynomials |
| §6 denominator zero and total division | σ=0, field odd | v=d=0; raw (u³,v³)=(−125,0); formula x divides by zero | Not a legitimate affine setup; must be excluded before geometric interpretation | Keep denominator hypotheses |
| §7 canonical reduction | ℤ/15→𝔽₃, t=14; ℤ/0→𝔽₃ as boundary | 14↦2; 1−2=14 mod 15↦2=−1 mod 3; map from ℤ also exists but n>1 excludes it from detection | Map and source-ring distinctions correct | Cite `castHom` |
| §7 polynomial/product naturality | (36,160) modulo 35→𝔽₅; leaves 3,5 modulo 15→𝔽₃ | pair gives (1,0) both routes; product 0 maps to 0, and 0·2=0 | Equal | Retain mathematical comparison |
| §8 prime-divisor gcd iff | n=15,p=3,t=6 and t=5 | gcd=3 and 5; p divides iff true/false; residues 0 and 2 | Both directions pass | Cite native inputs |
| §8 three outcomes | n=15,t=1,3,0 | gcd=1,3,15; proper-divisor tests false,true,false | Correct trichotomy | Add computed Checks |
| §8 separating primes | n=15,t=6,p=3,q=5 | residues 0,1; gcd=3 with 1<3<15 | Sufficient condition works | Preserve |
| §8 repeated factors | n=9,t=3 and t=0 | mod 3 both 0; gcds 3 and 9 | Prime reduction does not determine multiplicity | Preserve limitation |
| §9 M and empty lcm | B₁=0,1,2,3,4,5,6 | M=1,1,2,6,12,60,60; prime-power products 1,1,2,2·3,4·3,4·3·5,4·3·5 | Equal, including boundaries | Cite lcm API |
| §9 smooth versus annihilated | E₇, order(P)=4, B₁=2 | prime divisors of order={2}; M=2; [M]P=T≠O and 4∤2 | Correct negative control | Add Check |
| §9 sequential composition | E₇, M(4)=4·3=12 | [4]P=O; [3]([4]P)=O=[12]P | Equality | Retain group identity, remove procedure |
| §9 order and group-order criteria | E₇,P=(1,3), B₁=4 and 5 | 4∣12 and [12]P=O; #E₇=8∤12,8∤60 | Point-order criterion strictly weaker than group-order sufficient condition | Preserve distinction |
| §9 genuine proper-factor instance | n=35, curve A=0,B=1, pair (22,1), M=2 | double=(21,25), gcd=5; mod 5 point (2,0) killed; mod 7 point (1,3) doubles to T | Final denominator detects precisely factor 5 here | Add Check |
| §9 annihilation everywhere is inconclusive | n=15, final t=0 | residues mod 3 and 5 both 0; gcd=15 | No proper factor follows | Preserve qualification |
| Generic order theorem, degenerate/nonabelian | Trivial group; S₃ with g=(123), k=6 and 4 | order=1, powers all e; order(g)=3, g⁶=e, g⁴=g≠e; 3∣6,3∤4 | Imported theorem needs no commutativity | Cite, do not re-own |
| §10 signed coverage | w=6, q=2,3,5,7 | 2,3 divide w; 5=6−1,7=6+1; j=1≤3 | Both signs/direct cases necessary | Retain finite coverage condition; remove generator |
| §10 direct stride primes | w=2, q=2 | q∣w; no positive j≤1 gives q=iw±j with integer i | Direct case cannot be omitted | Preserve |
| §10 genuine extra-prime detection | 𝔽₁₃, A=8,B=5,P=(5,1), B₁=2,q=3,w=2 | order(P)=6; Q=2P=(8,12)≠O; 2Q=(8,1)=−Q; [3]Q=O; cross=8−8=0 | Stage 2 criterion holds while stage 1 has not annihilated P | Add Check |
| §10 converse and sign | Same Q, i=j=1,w=2 | [iw−j]Q=Q≠O; [iw+j]Q=[3]Q=O; equal κ values | Disjunction true through plus branch only | Preserve both branches |
| §10 converse negative control | E₇,Q=(1,3), i=j=1,w=2 | κ(2Q)=(0:1),κQ=(1:1), cross=−1=6; Q and 3Q both nonzero | false ↔ false | Add Check |
| §10 infinity | Giant=O,baby=T; both=O | cross=1 in first case; cross=0 when both O, both differences/sums O | Valid-pair infinity cases consistent | Specify explicitly |
| §10 invalid pair excluded | Giant raw (0,0), baby (1,1) | cross=0 regardless of baby, but no giant projective point | Converse would be meaningless without validity | Preserve validity |
| §11 product and empty list | n=15, lists [],[1],[3,5],[0] | residues 1,1,0,0; gcds 1,1,15,15; for p=3, prime divides product iff a divisible leaf: F,F,T,T | Generic theorem agrees | R03 |
| §11 product grouping | n=15, leaves [2,3,5,7] | full product=210↦0; (2·3)(5·7)=6·35↦0 | Associative grouping preserves product | Retain algebra; no executable tree needed |
| §11 whole-modulus batch with separable leaves | n=15,[3,5] | root gcd=15; leaf gcds 3,5 | Proper leaf exists despite whole-modulus root | Add Check |
| §11 root gcd n does not guarantee a proper leaf | n=15,[0]; empty list | leaf gcd=15, no proper leaf; empty product gcd=1 | Both failure cases distinguished | Preserve limitation; remove recursion target |
| §12 reduced residues and subtraction | n=15, 1−2 | residue difference=14; natural truncated 1−2=0 | Raw Nat subtraction is not modular subtraction | Keep explicit arithmetic comparison |
| §12 singular setup with unit denominator | n=3, σ=1 as above | d=2 unit, B=0, Δ=0; gcd(Δ,3)=3 | No factor or ellipticity follows | Add Check; no search claim |
| §12 finite search/termination and requested executions | Empty parameter list, n=15 | Search has 0 candidate parameters while n has divisors 3 and 5 | An inconclusive result cannot mean primality; no implementation exists here to execute | R01; replace by mathematical statements |

The table contains 65 statement-family rows. The requested infinity, singular, characteristic-2/3, repeated-prime, empty-product, zero-ring, square-zero and total-function controls have concrete values. For the actual curve statements, finite fields are nontrivial and all coordinate denominators explicitly used in the positive examples are nonzero. Topological compactness, analytic normalizations and unrelated universe tests do not occur in this roadmap.

**Headline coverage.** The README's milestones promise the following substantive outcomes; the absence of named statements prevents treating the prose alone as an acceptance test.

| README outcome | Acceptance-file status |
|---|---|
| §1 discriminant and nonsingularity | Discriminant has a proved example. Criterion is statable, but it is supporting API rather than a replacement for the deep headlines. |
| §2 Montgomery/native point comparison and transported group law | Native target carrier exists. Comparison construction is not stated. |
| §3 Kummer quotient/image identification | Native projectivization and point carrier exist. Affine fibre input already exists; the quotient bridge is not stated. |
| §4 scalar doubling/differential-addition correctness and exact exceptional locus | Doubling correctness demonstrably statable, as the elaborated probe shows. Only its raw polynomial definition is present. |
| §5 ladder invariant/correctness | No ladder/trace construction exists in the file. Remove executable scope; name any missing retained mathematical carrier precisely. |
| §6 Suyama admissibility and ellipticity with complete exceptional conditions | A finite collection of rational/polynomial expressions is statable on fields. No acceptance theorem or missing-carrier explanation is supplied. |
| §7 reduction compatibility | Ring maps exist; new coordinate comparisons belong with the retained headline interfaces. No named theorem supplied. |
| §8 proper-factor separation | Basic gcd/divisibility inputs exist. New integrated residue statements can use them; generic gcd facts are not substitute headlines. |
| §9 conditional stage-1 detection | Finite lcm, native group order and points exist; connect to the defined coordinate/scalar interface rather than an opaque regularity predicate. No statement supplied. |
| §10 signed extra-prime/stage-2 detection | Native points/scalars and finite products exist; schedule/product constructions are not defined. Identify precisely which retained headline can be stated after a few simple definitions. |
| §11 batching and recovery | Generic product theorem already exists; executable recovery must be removed. Retained separation results should use actual finite products. |
| §12 integrated finite search soundness and conditional detection | Search is outside the permitted scope. Retained mathematical detection theorems still need headline statements or exact missing-carrier explanations. |

## Not verifiable

- **The worker's exact random sample:** no target names were supplied and none were found by its heading sampler. The fifteen explicit targets above and all table rows were reviewed; a seeded set was not invented.
- **`montgomery1987`, primary paper:** the DOI landing page did not provide usable text to the service. The legal course PDF was fetched, but extraction contains page markers only; OCR is unavailable. Screenshot retrieval did not return a readable image in this interface. EFD supports the displayed formulas, but the primary theorem hypotheses, complete exceptional locus and continuation discussion were not certified. This is recorded under the same source key in the scratch missing-reference list.
- **`gmpecm`, Suyama and continuation:** the cited landing page was legally fetched. `gmpecm line 5` through line 37 gives repository metadata, not a mathematical section, version or formula. The numerical Suyama checks are independent calculations and are not represented as verification against that source. A precise legal mathematical reference is still needed.
- **Upstream PR provenance:** the two Mathlib PR links in README lines 255–256 were attempted but did not yield readable pages. Their titles/status/content were not used as evidence that a pinned API exists. Relevant native point APIs were checked directly at the pin instead.
- **Unspecified constructions:** no actual checked ladder, schedule generator, product-tree recovery or integrated search is defined, so termination, trace regularity sufficiency and requested execution examples cannot be certified as properties of an implementation. The report checks their stated mathematical invariants and scope; it does not silently choose implementations for them.

The source requests were consolidated. Review completion and this verdict do not await those texts. No claim about copied passages can be made for unreadable portions; in the accessible EFD/Lenstra material, no copied expository passage was identified.

## Source issues

- none
