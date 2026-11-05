# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at e3ae167)

**Verdict:** needs changes

## R01 (P2) — RD.6.98 still excludes `p = 2` although nothing in its statement, its route or its source needs it

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:13763`, Hypotheses of RD.6.98: “`p` odd, `p ∤ n + 1, n ≥ 1, k ≥ 1`”.

**Claim:** Clauses (a)–(c) are the isotypic Künneth/Fourier identification, the purity and weight-graded description of `H¹_mid`, and the hypersurface reduction. Their proof sketch uses RD.6.96 (which needs only `p ∤ n+1`), RD.6.93, RD.6.80, RD.6.97 (now stated for every prime), Künneth, localisation and Gysin. No step uses the parity of `p`. The restriction is the leftover of the Crew hypotheses that this head removed from RD.6.94–RD.6.97; keeping it in the consumer reinstates “good primes only” for the symmetric-power theorem.

**Witness:** The source asserts the same rigid identities without parity: `fsy-kloosterman` lines 1038–1064 (§3.2.2, arXiv v5 p. 25) state (3.13)–(3.14) with no condition on `p`, and line 2195 (§5.1.5, p. 49) says “for any prime `p`” for the `n = 1` instance. The only caveat the source makes at `p = 2` (lines 992–998, p. 23–24) concerns concentration of `Sym^k Kl_{n+1}` in degree one when `n` is even (possible trivial constituents), a property RD.6.98 does not assert. Instance: `p = 2, n = 2, k = 1` satisfies `p ∤ n+1`; RD.6.97 gives `Kl_3` pure of weight 2 at `p = 2`, and RD.6.93 gives `H¹_mid(G_m, Kl_3)` pure of weight 3, which is clause (b) with no parity used.

**Repair:** Delete “`p` odd” from the Hypotheses of RD.6.98, keeping `n ≥ 1`, `p ∤ n+1` and `kn ≥ 2` for (c). If the author wants to record the source's caveat, add one sentence to the Hypotheses: for `p = 2` and `n` even, `Sym^k Kl_{n+1}` may have trivial constituents, so concentration in degree one is not asserted; clauses (a)–(c) are unaffected. Add the instance above as a Check. (RD.7.21a and RD.7.22 keep “`p` odd” legitimately: `fsy-kloosterman` lines 1680–1700 give the even-`k` factorisation (5.3) only for odd `p`, and the displayed factor `(−1)^((p−1)/2)` has no meaning at `p = 2`; RD.1.46's parity hypothesis is R02 below.)

## R02 (P3) — RD.1.46 carries “`p` odd” that only its proof route for (c) uses

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:3359`, “Let `p` be odd, `K ⊇ ℚ_p(π)` …”, and Hypotheses “`p` odd, so that `−π` also satisfies `(−π)^{p−1} = −p`”.

**Claim:** Parts (a), (b), (d) and the statement of (c) hold for `p = 2`; the parity enters only the rewriting `exp(π(x^p − x)) = exp(π′(x − x^p))` with `π′ = −π` used in step 3. The roadmap's own RD.1.64 (lines 3822–3847) proves the coefficient estimate for `θ` and `θ⁻¹` “including `p = 2`”, so the route already exists.

**Witness:** `p = 2`, `π = −2`: `v_2(π^n/n!) = n − v_2(n!) = s_2(n) = s_p(n)/(p−1)`; for `n = 3`, `v_2(8/6) = 2 = s_2(3)`, so (a) holds verbatim. For (c), RD.1.64's bound `v_2(c_k) ≥ k/4` makes `θ = exp(π(t^{−2} − t^{−1}))` a unit of `R^int` without the `−π` trick.

**Repair:** State RD.1.46 for every prime, cite RD.1.64 for (c) in the proof sketch, and keep the `−π` rewriting as the odd-`p` shortcut it is. Then RD.1.64's sentence “the break and Artin–Schreier statements keep their odd-`p` hypothesis” can be dropped (RD.2.44(d),(e) are already stated for every `p`).

## R03 (P3) — RD.1.63's only *Needs* edge is unrelated to its content

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:3815`, “*Needs:* §RD.0.25 *The Robba ring `R_K` is Kedlaya's analytic ring …*”.

**Claim:** Artin–Hasse integrality is a statement about `ℤ_p[[X]]` proved by the Euler product and `p`-adic binomial coefficients; it needs no Robba-ring comparison. The edge blocks an implementer of RD.1.63 (now consumed by RD.6.94 and RD.1.64, and by PeriodsAndSpecialValues §1) behind an unrelated Layer RD.0 theorem.

**Witness:** The proof sketch at lines 3807–3811 mentions only the Euler product, Möbius sums and `p`-adic binomial coefficients; `dwork-hypersurface` lines 2019–2023 ((4.3)–(4.4), p. 56) is the cited source and uses nothing analytic. No Artin–Hasse declaration exists in the pinned Mathlib or Tau Ceti (no file matches `ArtinHasse`), so the target is correctly owned here.

**Repair:** Replace the *Needs* line by Mathlib `PowerSeries.exp`, `Nat.Prime` and the `p`-adic binomial-coefficient integrality it actually uses (or state “none beyond Mathlib”).

## R04 (P3) — Locator and *Needs*-title slips in the new Kloosterman targets

**Location:** `README.md:13715` (RD.6.96 Sources: “Proposition 2.10 (tensor/convolution comparison), p. 14”); `README.md:13743` (RD.6.97 *Needs*: “§RD.6.52a *Formal slopes and normal forms*”, “§RD.6.42 *Vanishing of the Dwork coefficient on the affine line*”).

**Claim:** Proposition 2.10 is on page 13 of arXiv:1810.06454v5 (`fsy-kloosterman` line 565 precedes the page-14 marker at line 585). The two *Needs* items cite targets by titles that are not their headings (RD.6.52a is “Formal irregularity and good lattice pairs on algebraic curves”, line 12724; RD.6.42 is “The Dwork (Artin–Schreier) isocrystal `L_π`”, line 12387); the numbers resolve, the titles do not.

**Repair:** Write “p. 13”; use the headings' titles in the two *Needs* items.

## Verified sound

### Previous findings, checked first

| Previous finding (review at 186e611) | Passage at this head | Disposition |
| --- | --- | --- |
| R01 (P1) RD.5.10(b) false at `n = 0` | `README.md:8880`: “for `n ≥ 1`, the naive (convergent) cohomology of `A^n` is the de Rham cohomology of the closed n-polydisc, whose `H¹` is infinite-dimensional”; Check at line 8900: “At `n = 0` the closed polydisc is `Sp K` … dimensions `1, 0, 0, …`”; the splitting by first-coordinate inclusion and evaluation at zero is at line 8890. | Repaired. |
| R02 (P2) Kloosterman construction restricted to `p` odd, `p ∤ n+1` | RD.6.94 (`README.md:13638`): “Let `p` be any prime … `n ≥ 0` … These assertions include `p = 2` and `p ∣ n+1`”, with its own proof inputs (Haessig–Sperber, Adolphson–Sperber, Li, Xu–Zhu); RD.6.95: “Every prime `p` and every rank `n+1 ≥ 1`”; RD.6.97: “Every prime `p` and `n ≥ 0`”, with the André slope-comparison route replacing the tame power cover; the `p = 2`, rank 2, `z_0 = 1` Check at line 13689 (trace −1, determinant 2, `1+T+2T²`). Ownership sentence at line 121 names the two board designs as consumers. The tame refinement RD.6.96 keeps `p ∤ n+1` with the reason stated. | Repaired for RD.6.94–RD.6.97; the consumer RD.6.98 kept “`p` odd”: R01 above. |
| R03 (P2) FDRep contract claimed rigidity for monoids | `README.md:297`: finitely generated representations of a monoid; “Over `K` the category is rigid when the acting monoid is a group `G`; no finiteness of `G` is required”, with the file citations and the zero-action non-example. | Repaired. |
| R04 (P3) undeclared Lean names as API labels | `IsRationalType.parameter_iff`, `IsocDagger.isStack`, `kloostermanIsocrystal`, `relativeRobba`, `RelativeSigmaNablaModule`, `deRhamTrace`, `weilFactor` no longer occur (grep over the README returns nothing); the only remaining backticked non-library name is NewtonPolygons' `ConvexPolygon.FiniteSlopeData` at line 2896, which exists at `TauCetiRoadmap/NewtonPolygons/README.md:322` on main. | Repaired. |
| R05 (P3) RD.3.48a–RD.3.50 printed before their prerequisite RD.5.8 | The three targets are now RD.5.8a–RD.5.8c (`README.md:8800–8876`), placed directly after RD.5.8; RD.5.8a's sketch reads “This is a corollary of §RD.5.8”; the layer table (line 43) moves “Étesse's descent” to RD.5; the `AlgebraicGeometry.Etale` contract (line 273) and the Lean docstring (`Suggested.lean:23–27`) follow. | Repaired. |

### Gate, dependencies, shape and elaboration

The worker's gate at this head passes every check (build, imports, sorry-data, stray-files, outside-folder, residue, round-labels, depcheck). `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

The prescribed dependency check, run on this head, printed exactly:

```text
depcheck: 209 roadmaps, 1481 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every roadmap named in the scope section and the supplier contracts is either on main (ReductiveGroupsPartII, AdicSpaces (Completed), AdicSpacesPartII–IV, EtaleCohomologyFoundations, EnhancedDerivedSheaves, RestrictedPowerSeries, RigidAnalyticGeometry, CompactOperators, ClassicalArithmeticCompletion, AdicEtaleGeometry, FormalLaurentPuiseux, PadicFunctionalAnalysis, EllipticCurves, JacobianChallenge, AlgebraicCurves, NewtonPolygons: all present in the content checkout) or earlier in the merge order (ColemanIntegration, FormalConnectionsOpers, CongruenceSpectralGap, DeligneWeightsAndPurity, NoncommutativeAndEquivariantIwasawa, MotivesAndAlgebraicCycles, CrystallineCohomology and the rest of the list). The two Kloosterman designs named as consumers at line 121 exist on the board as packages; they are cited as consumers, never as suppliers.

Shape: 538 `### RD.k.n` targets in eight layers, each layer closing with `### Examples` and `### Dependencies` (8 of each). A script counting `**Checks.**` bullets under every `**Definition.**` target found none with fewer than three. No LaTeX delimiters, no process words (“pull request”, “checkpoint”, “deferred”, “optional”, “TODO”, round labels) in the README; no `lemma`, `set_option`, `#eval` or `#print` in the Lean.

Lean: `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` lines for the three declarations elaborated with exactly the two `sorry` warnings. The elaborated types match the README: `RD0.arabia_controlled_lifting` carries `[Algebra.Smooth R S]`, surjectivity of `p`, the compatibility hypothesis modulo `IC`, and concludes an étale `B`-algebra `E` with `B/(IB·ker p) ≃ E/(IB·ker p)E`, a surjective `p_E` extending `p`, and `h_E` with `p_E ∘ h_E = φ` and `h_E ≡ h̄` modulo `I` (RD.0.39(a), lines 1714–1716); `RD1.katz_cyclic_vector` carries `[CharZero K]`, `[FiniteDimensional K V]`, `δ ≠ 0` and the Leibniz law, concluding a `CyclicFor` basis of length `finrank K V` (RD.1.7, line 2376). No section binder was lost. One-tactic probes (`simp`, `infer_instance`, `exact?`, `aesop`) on scratch copies of both theorems all failed (`exact?` found only the probe file's own sorried copy); neither declaration is padding. `CyclicFor` has a real body and is needed by the headline.

### Headline theorems and coverage

The README's end theorems (line 29–32) are the slope filtration (RD.2.7), the local monodromy theorem (RD.2.31–RD.2.33), finiteness (RD.5.76) and Poincaré duality (RD.5.89) of rigid cohomology with coefficients, p-adic Weil II (RD.6.85) and the equality of crystalline, rigid and ℓ-adic Weil factors (RD.7.7–RD.7.9). None is statable at the pins: there is no Robba ring, no `(φ,∇)`-module, no isocrystal category and no rigid cohomology in the pinned Mathlib or Tau Ceti (Mathlib's `WittVector.Isocrystal` at `Mathlib/RingTheory/WittVector/Isocrystal.lean` is a rank-one object over a perfect field, and `isocrystal_classification` at line 180 is rank one). The module docstring names each group and the missing carrier. The two statable headlines, Arabia lifting and the cyclic-vector theorem, are stated. `roadmaps grep` over main and all open heads finds no other declaration of `arabia_controlled_lifting`, `katz_cyclic_vector` or `CyclicFor`.

### Pinned declarations opened

| File and line (repository-relative to the pin) | What was read |
| --- | --- |
| `Mathlib/RingTheory/Smooth/Basic.lean:125` | `FormallySmooth.exists_lift` needs a nilpotent ideal; Arabia's theorem is the arbitrary-ideal statement after an étale neighbourhood (RD.0.39 Check 1 cites it correctly). |
| `Mathlib/RepresentationTheory/FDRep.lean` and `Mathlib/CategoryTheory/Action/Monoidal.lean` | `FDRep` is monoid-indexed; rigid instances take `[Group H]`; `Action.rightDual_ρ` exists (the repaired contract at line 297). |
| `Mathlib/Algebra/Module/LinearMap/Index.lean:18` | `LinearMap.index` with convention `dim ker − dim coker`, as the contract at line 322 and RD.5.23 state. |
| `Mathlib/Analysis/Normed/Operator/Perturbation/StrictByFinite.lean`, `…/Fredholm/Basic.lean` | `Topology.IsStrictMap`, `LinearMap.isStrictMap_iff_…` exist (contract line 381). |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean` | `Matrix.charpolyRev` exists. |
| `Mathlib/RingTheory/PowerSeries/GaussNorm.lean`, `Mathlib/RingTheory/MvPowerSeries/Restricted.lean` | `gaussNorm`, `IsRestricted` exist. |
| `Mathlib/RingTheory/Jacobson/Ring.lean`, `…/Jacobson/Artinian.lean` | `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing` exist (closed-point inputs, line 380). |
| `Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean` | `ringConvolution` exists; the contract (line 295) correctly says it gives no ring structure on Robba germs. |
| `TauCeti/LinearAlgebra/Trace/Exact.lean`, `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Trace.lean` | `trace_eq_add_of_exact`, `frobeniusTrace` exist. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` | `pointsFunctorIsoTensorAutFunctor` starts from a Hopf algebra; neutral reconstruction is correctly imported from MotivesAndAlgebraicCycles §§6.1–6.3. |
| pinned Mathlib and Tau Ceti, whole tree | no `ArtinHasse` declaration; RD.1.63 is correctly owned here. |

### Supplier citations resolved at their current heads

| Supplier, repository-relative | Resolved |
| --- | --- |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md:616, 646` (open head) | §4.2a `hyperKloosterman`, scaling rule `r ↦ a^k r` (line 624), eliminated-variable comparison for `n ≥ 0` (line 636); §4.2b `hyperKloosterman_bound` with `k|F|^((k−1)/2)` (line 693); `Suggested.lean:42, 51` declare them. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md` (open head) | §0.1 (line 561), §0.10 (731), §1.10 (1034), §2.7 (1139), §4.4 `degreeFactorExtraction` (1373–1392). |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1101–1134` (open head) | §§6.1–6.3 neutral fibre data, reconstruction, finite-type generation. |
| `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3765–3795` (open head) | §F.6 stages 1–2 as cited; its table at line 3795 lists this roadmap's RD.0.1, RD.2.20, RD.2.25, RD.2.31–RD.2.33 as a *consumer*, so there is no cycle. |
| `TauCetiRoadmap/NewtonPolygons/README.md:322` (main) | `ConvexPolygon.FiniteSlopeData`. |
| `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:220` (open head) | consumes RD.1.46 and RD.1.63 from here; no second owner. |

Ownership against the open pull requests whose files this brief lists was checked by `roadmaps grep` for the Lean names and for Artin–Hasse; only this roadmap builds them.

### Source checks

The seeded sample gives fifteen labels (Theorem; Construction; Definition; Theorem; Construction; Lemma; Lemma; Theorem; Lemma; Lemma; Construction; Definition; Lemma; Theorem; Lemma) without target identifiers. The fifteen targets below match that label sequence, weighted toward the passages this head changed; they are an explicit additional sample, not a recovery of the seed. Cache texts are cited as `<id> line N`; page numbers are those printed in the fetched copies.

| # | Target | Source passage | Result |
| --- | --- | --- | --- |
| 1 | RD.0.39 Arabia (Theorem) | `arabia2001` lines 693–728, Théorème 2.1.2, p. 625 (pdf page 19 of a text starting at p. 607) | Surjection `p` with kernel `K`, map `h` modulo `I`, étale neighbourhood of `I·K`, `p_ε`, `h_ε` with `φ = p_ε∘h_ε`: matches (a) and the Lean statement. Corollaire 2.1.3 p. 632–633, Théorème 2.2.2 p. 633–634 as cited. |
| 2 | RD.6.95 `Kl_{n+1}` (Construction) | `crew-kloosterman` lines 342–356, §1.5 (pp. 10–11); lines 183–215, §0.2 and Prop. 1.2 (pp. 5–6) | Crew fixes `p` odd and `p ∤ n` for Prop. 1.2; the head no longer cites him for the all-prime construction but for the connection and §1.5; the geometric description `R^{n−1}pr_*f^*L_ψ` agrees. |
| 3 | RD.1.11 radii (Definition) | `kedlaya-overview` lines 1074–1095, Def. 5.1.3–5.1.4, p. 28; `kedlaya-swan-1` lines 286–298, Def. 2.4.6 and Rem. 2.4.7, p. 8 | `R = ω·|T|_sp^{−1}`, toric radius differs by the factor `ρ` (Remark 2.4.7), matching `T = R/ρ`. The “min” misprint is real (Source issues). |
| 4 | RD.6.94 family (Theorem) | `haessig-sperber-families` lines 127–135 (H(i)–H(v), Thm 2.1, pp. 4–5), 431 (Thm 4.2, p. 10), 794 (Thm 6.1, p. 17), 1043–1074 (Thms 7.3–7.4, pp. 22–23); `adolphson-sperber-hyperkl` lines 312–353 (Thms 1.1–1.3, pp. 6–7), 911 (Thm 2.4, p. 17), 1053 (Thm 3.1, p. 21); `li-expsums-rigid` lines 174–201 (Thms 1.1–1.2, Prop. 2.1, pp. 4–5); `xu-zhu-bessel` lines 245–253 (Thm 1.2.4, p. 5), 1895 ((4.1.8.4), p. 40), 2647–2682 (§5.3.1, pp. 57–58) | All locators resolve. H(v) is `p ∤ ∏ φ(τ)(μ)` over visible codimension-two faces; for `f = Σx_i` these forms are the coordinates, value −1 at `μ = (−1,…,−1)`, so no prime is excluded, as the README says. Thm 7.3's interval is `1/(p−1) < b < p/(p−1)`. Li's Thm 1.1 identifies `α` with `q^n(F^*)^{−1}` on the dual-character cohomology; Thm 1.2 removes `p ≠ 2`. A–S Thm 3.1 is “without any restriction on characteristic” with the nilpotent matrix `H` (one Jordan block) following it. |
| 5 | RD.6.42 `L_π` (Construction) | `kedlaya-fourier` lines 1178–1182, §4.3, p. 30 | Kedlaya prints `F e = exp(πx − πx^q)e`; the horizontality computation (below) confirms the README's correction to `exp(πx^q − πx)`; `crew-kloosterman` line 351 and `fsy-kloosterman` line 1043 print the corrected form. |
| 6 | RD.5.17 denominators (Lemma) | `kedlaya-finiteness` lines 1180–1189, Lemma 5.2.7, p. 32 | The source says “some positive integer `a`”; `m = 0, l = 1, e = 1` forces `a = 0`, so the README's `0 ≤ a` is the correct reading. |
| 7 | RD.6.35 `v_p(n!)` (Lemma) | `kedlaya-fourier` line 989, Lemma 4.1.1, p. 26 | Statement identical; Legendre route checked against Mathlib's `sub_one_mul_padicValNat_factorial`. |
| 8 | RD.6.97 monodromy and purity (Theorem) | `andre-bessel` lines 345–414, §3 and Proposition 3.2 with proof, pp. 787–789; `adolphson-sperber-hyperkl` lines 1053–1091, p. 21; `xu-zhu-bessel` lines 105–130, §1.1.2, p. 3 | André's Prop. 3.2: a module over the convergent series in `(K ∩ ℚ̄)((1/x))` on the exterior annulus, with largest `p`-adic slope `λ` at the inner boundary, has `λ ≤` largest formal slope; the proof is the convexity argument the README describes, and André's “anneau de Robba à l'infini” is the ring of germs near `|x| = 1⁺`, which is where an overconvergent isocrystal's local monodromy at `∞` lives. Xu–Zhu §1.1.2 recalls Swan `1` at `∞` and a single Jordan block at `0`. |
| 9 | RD.1.63 Artin–Hasse (Lemma) | `dwork-hypersurface` lines 2019–2023, (4.3)–(4.4), p. 56 | `E(X) = exp(Σ X^{p^j}/p^j)` lies in `L(0,0)` with constant term 1, as cited. |
| 10 | RD.2.44 breaks (Lemma) | `kedlaya-overview` lines 196 (Example 2.1.10, p. 6), 1162–1243 (Lemmas 5.3.1–5.3.3, pp. 30–32), 1273–1363 (Lemmas 5.4.4–5.4.9, pp. 32–35) | All eleven locators resolve at the stated pages. |
| 11 | RD.3.51 Kummer isocrystals (Construction) | Berthelot, *Cohomologie rigide … Première partie* (2.2.15)(ii)(b), (2.3.8)(iii) | Not readable (see Not verifiable); the computations below were checked independently. |
| 12 | RD.5.23 near-isomorphisms (Definition) | `kedlaya-finiteness` lines 1357–1375, Def. 6.1.1 and the three bullets, p. 36 | Definitions and the two-of-three and square properties agree. |
| 13 | RD.5.54 six-term five lemma (Lemma) | `kedlaya-finiteness` line 1892, Lemma 7.5.3, p. 50 | Located as cited. |
| 14 | RD.5.8b Étesse summands (Theorem) | `etesse-descente` lines 980–989, Théorème 6, p. 598; lines 690–705, Propositions 10, 10′, pp. 591–592; `kedlaya-fullfaith` line 45, Theorem 1.1 | Théorème 6(1)–(2) is the statement restated; the proof “utilise la proposition 10′”, as the README's Sources say. |
| 15 | RD.1.4 Katz determinant (Lemma) | `katz1987` lines 38–66, Theorems 1–2 and proofs, pp. 66–67 | Constant term 1 and degree bound `n(n−1)` under `(n−1)!` invertible. |

Also read for the findings and the Lean file: `magid-cyclic` lines 54–69 and 98–99 (Theorem 1, Corollary 1 with `F ≠ C`, p. 3); `fsy-kloosterman` lines 437–441 ((2.3), Prop. 2.4, p. 11), 499 ((2.6), p. 12), 565 (Prop. 2.10, p. 13), 887–892 (Remark 3.7, Thm 3.8, p. 22), 956–1000 (§3.2.1, pp. 23–24), 1668–1702 (§5.1.1, pp. 39–40); `christol-dwork` line 394 (§2.2, p. 675–676).

### Adversarial computations

Each row records values computed on an instance. “Pass” means that instance agrees with the statement; it is not a certification of the target's proof.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `RD0.arabia_controlled_lifting` | `S = R`, `I = 0`, `C = 0`; and `R = B = ℤ`, `I = (7)`, `S = ℤ[x,1/(2x)]/(x²−2)`, `C = 0` | First: `E = B`, all differences 0. Second: `3² − 2 = 7`, `2·3 = 6` a unit mod 7; roots mod 7 are 3 and 4; inverting `x+3` kills `x ≡ 4`; `x² = 2` has no root in `ℤ`. | Pass; the étale neighbourhood is necessary. |
| `RD1.katz_cyclic_vector`, `CyclicFor` | `K = ℚ(t)`, `D` componentwise `d/dt` on `K²`; `δ = 0`; `K = 𝔽_p(t)`, rank `p+1` | `v = (1,t)`, `Dv = (0,1)`, determinant 1. With `δ = 0`, `D = 0` and `Dv = 0`. In characteristic `p`, `(d/dt)^p = 0`, so `v,…,D^p v` are dependent. | Pass; `δ ≠ 0` and `CharZero` are both needed and present. |
| RD.2.7 slope filtration, adapter | `M = M_0 ⊕ M_1` slopes 0,1; `C = ℚ_p(π)`, `π² = p`, `φ(e) = πe` | Ranks 0,1,2, degrees 0,1. Adapter: `p`-normalised slope `1/2`, `ϖ`-normalised `1 = e_C·(1/2)`. | Pass; agrees with NoncommutativeAndEquivariantIwasawa's Check at its line 3783. |
| RD.2.31 local monodromy | trivial line; `N e_2 = e_1`, `N e_1 = 0` | horizontal dimensions 1 and 1 (< 2); `N² = 0`. | Unipotent, not constant: pass. |
| RD.5.8 / RD.5.8a projector | `P = [[1,0],[h,0]]`, `h = 2` and `h = t` on the trivial rank-two connection | `P² = P` both; `dP = 0` for `h = 2`, lower-left `dh = dt ≠ 0` for `h = t`. | Horizontality separates descendable projectors: pass. |
| RD.5.8a Check 4 | `f = Σ p^{⌊√n⌋} tⁿ` | `|p^{⌊√n⌋}| → 0` so `f ∈ ℚ_p⟨t⟩`; `p^{−⌊√n⌋}ρⁿ → ∞` for every `ρ > 1` so `f ∉ ℚ_p⟨t⟩†`; `df ≠ 0`. | Pass. |
| RD.5.8b | `Ê = Ê ⊕ 0`; `K_0 ⊕ K_{1/(p−1)}`, `p` odd | projectors `diag(1,0)`, `diag(0,1)`; Frobenius multipliers `t^0`, `t^1`. | Pass. |
| RD.5.8c Kummer descent | cover `s ↦ s^{p−1} = t`, character `m` of `μ_{p−1}` | `∇(s^m e) = m s^m ds/s = (m/(p−1)) s^m dt/t`; Frobenius `t^{(p−1)·m/(p−1)} = t^m`. | Agrees with RD.3.51: pass. |
| RD.5.10 | `n = 0`; `n = 2` pullback to `t_2 = 0` | `Sp K`: dimensions `1,0,0,…`; an exact bidisc form restricts to an exact disc form, the nonexact `Σ p^k t_1^{p^k−1}dt_1` survives. | Previous R01 repaired. |
| RD.5.17 | `p = 2`, `m = 0`, `l = 2`, `e = 2`; `m = −1`, `l = 1` | `(1+x)(2+x)/2 ≡ 1 + 3x/2`, times 2 gives `2 + 3x`, bound `(e−1)⌈log_2 2⌉ = 1`; second product `x`, `a = 0`. | Pass; `a = 0` needed. |
| RD.5.23 index | zero map `K² → K`; `x d/dx` on `K⟨x,x^{−1}⟩†` | `dim ker − dim coker = 2 − 1 = 1`; kernel constants, cokernel the `x⁰` line: both dimension 1. | Matches Mathlib's convention: pass. |
| RD.5.54 | identities on `0→K→K→0→K→K→0→0` | all kernels and cokernels 0. | Pass. |
| RD.5.76, RD.5.89 | `G_m`, `d = 1` | dimensions `(1,1,0)`; `H⁰` eigenvalue 1 pairs with `H²_c` eigenvalue `q`, `H¹` eigenvalue `q` with `H¹_c` eigenvalue 1: products `q = q^d`. | Pass. |
| RD.6.35 | `p = 2`, `n = 1, 2`; `p = 3`, `n = 8` | `v_2(1!) = 0 ∈ [0,1]`, `v_2(2!) = 1 ∈ [0,2]`, `v_3(8!) = 2 ∈ [2,4]`. | Pass. |
| RD.6.42 Frobenius sign | `q = p = 3`, `x = 0` | with `θ = exp(π(x^q − x))`: `θ′ + πθ − πqx^{q−1}θ` has constant term `−π + π = 0`; with the printed `exp(πx − πx^q)`: `π + π = 2π`. | README's correction verified. |
| RD.6.85 | constant coefficient on `G_m`, `w = 0` | `H¹_c` weight `0 ≤ 1`; `H¹` weight `2 ≥ 1`. | Pass. |
| RD.6.93 | `G_m`, constant | `H¹_c → H¹` sends weight 0 to weight 2: zero map; `H¹_mid = 0`, vacuously pure. | Pass. |
| RD.6.94 polytope data | `n = 1`; `n = 2`; weight `w` | interval `[−1,1]`, normalised length 2; triangle `(1,0),(0,1),(−1,−1)`, area `3/2`, normalised area 3; `w(e_i) = 1`, `w(−𝟙) = −n + (n+1) = 1`, `w(0) = 0`; facet forms `Σu_j` and `Σu_j − (n+1)u_i` give exactly the displayed `w`. | Ranks 2, 3 and the weight formula pass. |
| RD.6.94 H(v) and growth interval | `f = Σx_i`, `μ = −𝟙`; `p = 2` | `φ(τ) = x_i`, `φ(τ)(μ) = −1`, product `(−1)^n`; `l_σ(μ) = −n < 1`; interval `(1, 2) ∋ 3/2`. | No prime excluded: pass. |
| RD.6.94 `z = 0` exclusion | `n = 1`, potential `x` on `G_m` | `χ(G_m, L_π) = −Swan_∞ = −1`, so `H¹_c` has dimension 1, not 2. | Exclusion of `z = 0` necessary: pass. |
| RD.6.95 trace at `p = 2` | `q = 2`, `n = 1`, `z_0 = 1`; `𝔽_4` | raw sum over `{1}`: `ψ(0) = 1`; trace −1, determinant 2, `1 + T + 2T²`; `Tr F² = 1 − 4 = −3`; direct sum over `𝔽_4^×`: `x = 1 ↦ ψ(Tr 0) = 1`, `x = ω, ω² ↦ ψ(Tr_{𝔽_4/𝔽_2}(1)) = ψ(0) = 1`; total 3 = `−Tr F²`. | Pass; `p = 2` is now covered. |
| RD.6.95 index shift | `n = 0` | eliminated sum and `hyperKloosterman` at rank 1 both `ψ(z_0)`; `Kl_1 = L_π|_{G_m}`. | Pass. |
| RD.6.96 change of variables | `n = 1`, `x = zy` | `x + z²/x = z(y + y^{−1})`; `g′ = 1 − y^{−2}` vanishes at `y = ±1` with `g = ±2`. | Pass. |
| RD.6.97 Leray and breaks | `n = 0,1,2`; rank 2 | total torus cohomology only in degree `n+1`, so base `H⁰ = 0`, `dim H¹ = 1`, `χ = −1`; breaks `≤ 1/2` and sum 1 force `1/2, 1/2`; a tame line plus a break-one line has maximum `1 > 1/2`. | Pass. |
| RD.6.97 weight at `p = 2` | `1 + T + 2T²` | roots of `X² + X + 2`: discriminant `−7`, `|X|² = 2`, modulus `√2 = √q`. | Weight 1: pass. |
| RD.6.97 bound normalisation | `n = 0` | `(n+1)q^{n/2} = 1 = |ψ(z_0)|`; `q^{(n−1)/2} = q^{−1/2} < 1` would fail. | Pass. |
| RD.6.98 (R01) | `p = 2`, `n = 2`, `k = 1` | `p ∤ 3`; `Kl_3` pure of weight 2 (RD.6.97 at every `p`); `H¹_mid` pure of weight 3 by RD.6.93; no clause uses parity. | Statement holds without “`p` odd”: R01. |
| RD.7.21a | `k = 6`, `p = 3`; `k = 12`, `p = 3` | `f = ⌊6/6⌋ = 1`, `m = 1 + 0 = 1`, `n = ⌊6/12 + 1/2⌋ = 1`, factor `(1−T)(1 − (−1)^1 27 T) = (1−T)(1+27T)`; `k = 12`: `f = 2`, `m = 3`, `n = ⌊1 + 1/2⌋ = 1`, `(1−T)(1+3⁶T)(1−3⁶T)²`. | Checks reproduce; the odd-`p` hypothesis matches `fsy-kloosterman` (5.3). |
| RD.7.7–RD.7.9 | `P¹`; `q = 1` control | `P_0 = 1−t`, `P_1 = 1`, `P_2 = 1−qt`, `Z = 1/((1−t)(1−qt))`; clause (4) with `c_0 = −q`: `−q·t(1 − 1/(qt)) = 1 − qt`; at `q = 1` weights do not separate. | Pass; `q > 1` retained. |
| RD.1.4 | flat rank two, candidate `e_0 + Xe_1` | columns `(1,X)`, `(0,1)`, determinant 1, degree `0 ≤ 2`. | Pass. |
| RD.1.11 radii | trivial line; `D e = a e`; Dwork `D w = −πt^{−2}w` | `R = ρ`, `T = 1`; `R = min(ρ, ω/|a|)`; `|D_s|_ρ^{1/s} → |π|ρ^{−2}` and `ω = |π|` give `R = ρ²`, `T = ρ`. | Pass; the “min” in the source would give `R ≥ ρ`, refuted by `ρ² < ρ`. |
| RD.1.46 (R02) | `p = 2`, `π = −2`, `n = 3` | `v_2((−2)³/3!) = 3 − 1 = 2 = s_2(3)`; RD.1.64's bound `v_2(c_k) ≥ k/4` makes `θ` a unit of `R^int`. | (a) and (c) hold at `p = 2`: R02. |
| RD.1.63 | `p = 2`, coefficient of `X²` | from `exp(X)`: `1/2`; from `X²/2`: `1/2`; total 1; `exp(X)` alone gives `1/2`. | Pass. |
| RD.2.44 | `E = 0`, `F = E_π`; Kummer `(1/2) dt/t` under `t ↦ s²` | `0 ⊗ F = 0` has break `0 ≠ 1`: positivity of rank needed; pulled-back Kummer `ds/s` is trivial, break `0 = 2·0`. | Pass. |
| RD.3.51 | `K_1 → K_0`, `a = 1/2`, `p = 3`; `a ∈ ℤ_p ∖ ℤ` | `∇(t e_0) = (t e_0) dt/t`; multiplier `t^{(3−1)/2} = t`; `(n + a)g_n = 0` forces `g = 0`. | Pass. |
| FDRep contract | free-monoid generator acting by 0; character `χ` | equivariant evaluation forced to 0, contradicting `ev(1⊗1) = 1`; `χ(g)χ(g)^{−1} = 1`. | Previous R03 repaired. |

## Not verifiable

- **Seed identity:** the seeded sample names fifteen labels and no RD identifiers; the fifteen targets above match the label sequence but are an explicit additional sample.
- **RD.3.51 and RD.5.81 locators:** Berthelot's 1991 preprint *Cohomologie rigide et cohomologie rigide à supports propres* and *Dualité de Poincaré et formule de Künneth* are hosted at `wstein.org`, which the sources service places in no licence class; the (2.2.15), (2.3.8) and §§1.2, 1.6–1.7 locators are therefore unverified, and the Kummer and trace computations above are independent checks only.
- **Christol–Dwork Proposition 3.1 (RD.1.7):** the Numdam OCR of `christol-dwork` does not expose the proposition label; §2.2 was located at p. 675–676.
- **Full certification:** the 538 targets, 14,714 lines, were read for shape, order and the changed passages; the adversarial rows and source checks above delimit what was computed. Cross-roadmap contracts beyond those listed were resolved by the worker's resolver (no unresolved citation) and the dependency check, not re-read individually.
- The remaining unreadable bibliography records of the previous review (EGA III, Hartshorne, Humphreys, Katz 1979/1988, Katz–Lang, Malgrange, Milne, Monsky–Washnitzer I/III, Moret-Bailly, Ogus 1984, Serre's three texts, Silverman, Sperber 1980, Le Stum, Tsuzuki's Gysin paper, Waterhouse, Zarhin, de Jong's purity paper, Kato's log structures, the Esnault preprint, the Compositio corrigendum, the Leiden lecture notes, Hartl's punctured-disc paper and the erratum to *Slope filtrations revisited*) were not retried; their locators are cited by number only.

## Source issues

- **Misprint** in kedlaya-fourier at §4.3, printed page 30: the source says the Dwork isocrystal's Frobenius multiplier is the exponential of `π(x − x^q)` with connection `πe⊗dx`; it should be the exponential of `π(x^q − x)`, the only choice horizontal for that connection; affects a stated result.
- **Error** in kedlaya-overview at Definition 5.1.3, printed page 28: the source says the `ρ`-spectral norm is the minimum of `p^{−1/(p−1)}ρ^{−1}` and the limsup of the matrix norms; it should be the maximum, otherwise every generic radius would be at least `ρ`, contradicting the Dwork module's `ρ²`; affects a stated result.
- **Misprint** in kedlaya-finiteness at Lemma 5.2.7, printed page 32: the source says a positive integer `a` clears the denominators; it should allow `a = 0`, forced when `e = 1` or the bound `(e−1)⌈log_p(|m|+l)⌉` vanishes; affects a stated result.
- **Gap** in kedlaya-finiteness at Lemma 5.2.7 proof, printed page 32: the source says each coefficient is the integer `∏(m+i)/i` times sums of fractions `c/(c+m)`; it should avoid division by `c + m` when some `m + i` is zero, for instance `m = −1`; affects the proof.
- **Misprint** in kedlaya-xiao at Remark 1.4.2, printed page 10: the source says the intrinsic radius is the generic radius multiplied by the parameter norm; it should divide by it; affects a stated result.
- **Gap** in fsy-kloosterman at (5.1), printed page 39: the source says the degree of the compact-support factor for odd `k` has the cases `p = 2` and `p > 3`; it should also state the case `p = 3`, which the displayed formula leaves uncovered; affects nothing.
