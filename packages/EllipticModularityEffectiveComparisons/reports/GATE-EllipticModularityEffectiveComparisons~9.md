# GATE-EllipticModularityEffectiveComparisons~9: answers to the human review of `1c8a2cc`

This answers one review: CBirkbeck, 2026-11-09T01:37:16Z. It makes five points, F01–F05, numbered here H01–H05.
- Its "Previous findings" entry (r8 R01) restates F01.
- Its "Verified sound" section raises nothing to answer.
- The review was read as data. It contains no instruction to the worker beyond its findings, and nothing suspicious was found in it or in the files read.

The repairs are one commit, `4a7a185` ("EllipticModularityEffectiveComparisons: review repairs (Ramanujan bound from WeightsInEtaleCohomology; j-value headlines; isogeny and Kraus locators)"), on top of `1c8a2cc`. It is not pushed.

## H01 (CBirkbeck) — answered

The finding is correct and not disputed, and it stays a decision for a human (close #1810, or close #1491 and re-point the consumers). No edit inside this folder repairs it. The facts were rechecked at the current heads, and they hold:
- the sibling EllipticCurveModularityPartII is still at `32d2da7`: its README line 7 claims "the six comparison layers below", `martin_bound` is at `Suggested.lean` line 99, `GeometricTorsion` at line 177 and `rational_isogeny_j_tables` at line 230;
- ErdosProgressionPowers is at `3e1048c`, with its contract heading at line 649 and rows EC.0–EC.6 at lines 656–662;
- merge order: the sibling is at 272 and this folder at 282.

H03 below adds two Lean statements that duplicate sibling statements already in the README here:
- `isogeny_j_tables_11_17_37` has the same body as the sibling's `rational_isogeny_j_tables`;
- `non_cm_prime_isogeny_degrees` has the same content as the sibling's `noncm_prime_isogeny_degrees` (sibling `Suggested.lean` line 165).

These are two more items for the F01 list. They are acceptance tests for §§5.1 and 5.25, which were already README targets here, so the scope is unchanged. The fully qualified names differ (`TauCetiRoadmap.EllipticModularityEffectiveComparisons.*` against `TauCetiRoadmap.EllipticCurveModularityPartII.*`).

## H02 (CBirkbeck) — applied

`gap:all-embedding-frobenius` is deleted. The bound |σ(a_q(f))|≤2√q is now imported from WeightsInEtaleCohomology §6.1 (Layer R34.6), `newform_ramanujan`, at k=2 and trivial nebentypus. That roadmap is at merge order 146, before this one at 282; its `Suggested.lean` line 56 covers every level, nebentypus, weight k≥2 and embedding. AutomorphicGaloisRepresentations §6.1 (Tate decomposition) and §6.4 (conductors and Euler factors) do not state the bound.

What changed in `README.md`:
- **Line 94.** The joint heading "From …AutomorphicGaloisRepresentations and …DeligneWeightsAndPurity" is now two contracts. The AutomorphicGaloisRepresentations contract (line 94) keeps §6.1 and §6.4. The new WeightsInEtaleCohomology contract is at line 98.
- **Line 9.** The scope paragraph names WeightsInEtaleCohomology §6.1 as the owner of the bound.
- **§1.4.** The route (line 425) and the *Needs:* line (line 429) now cite WeightsInEtaleCohomology §6.1 in place of "AutomorphicGaloisRepresentations §§6.1, 6.4; DeligneWeightsAndPurity §§1.1–1.4 (Layer DWP.1)".
- **§3.4 *Needs:* (line 600).** It cites WeightsInEtaleCohomology §6.1 in place of the same pair. It also gains EllipticCurves Layer 3 for the Hasse bound |b|≤2√q, which its good-reduction case uses and which was missing.
- **Dependencies.** Layer 1 (line 461) drops the gap slug and DWP.1. Layer 3 (line 805) adds WeightsInEtaleCohomology §6.1.

AutomorphicGaloisRepresentations §§6.1, 6.4 stay where the conductor of A_f or E_f is used (§§3.5, 3.6, 3.13). The second half of the gap ("integral lattice and coefficient-prime reduction") came with the SerreWeightAndLevelOptimisation §§6.2–6.3 lifts and `gap:optimized-elliptic-weight-two` already.

The gap entry `all-embedding-frobenius` is still in the board's `design/plan.json`. That file is outside this job, so the intake has to withdraw it.

## H03 (CBirkbeck) — applied

`Suggested.lean` now states three new theorems in moduli form, using this file's `CyclicIsogenyDegree` and `GeometricallyNonCM` and Mathlib's `WeierstrassCurve.j`:
- **`exceptional_prime_isogeny_j`** (line 243). For (r,γ)∈{(19,96),(43,960),(67,5280),(163,640320)}, the j-values of rational curves with a rational cyclic r-isogeny form exactly {−γ³}.
- **`non_cm_prime_isogeny_degrees`** (line 252). A geometrically non-CM curve with a rational cyclic isogeny of prime degree r has r∈{2,3,5,7,11,13,17,37}.
- **`isogeny_j_tables_11_17_37`** (line 286). These are the three j-sets of §5.25.

README §5.1 names the first two (line 1199) and §5.25 names the third (line 1631). The new statements cite these locators:
- mazur-1978 lines 26–28, for the existence direction at 19, 43, 67 and 163;
- lemos-2017 lines 187–189, for the non-CM degree list;
- lemos-2017 lines 191–202, for S₁₁, S₁₇ and S₃₇.

The docstring sentence was "The four exceptional-prime rational-point exhaustions likewise lack …". It now restricts the gap to the point counts (that Y₀(r)(ℚ) is a single point), which still need X₀(r) (docstring line 32). The headline list names the new theorems.

## H04 (CBirkbeck) — applied differently

The finding is right: EllipticCurves on main (`bbbde05`) states no prime-to-degree transport. Its Layer 2 (lines 647–682) covers only E[N], the Weil pairing and the Tate module. Its Layer 1 has the dual isogeny with φ̂∘φ=φ∘φ̂=[deg φ] (line 566). The README changes:
- **Line 66.** It now credits Layer 1's dual isogeny with making an isogeny of degree prime to n a Galois-equivariant bijection on n-torsion, credits Layer 2 with the structure of E[N], and names the §4.0 API here as the owner of the transport.
- **§4.20 (line 1089).** It cites the dual-isogeny identities for the bijection E[ℓ]→E′[ℓ] at odd ℓ. Its *Needs:* line (line 1097) gains Layer 4.0.
- **§4.19 (line 1077).** This one differs from the suggested repair. There the isogeny has degree 2 and the torsion is 2-torsion, so gcd(2,2)≠1 and no coprime transport is used. Its Layer 2 citation now reads "the structure of E[N] over a separably closed field, so that E′[2] is the only noncyclic subgroup of order four", which is the step the route takes.
- No README line number of another roadmap is quoted in the README.

## H05 (CBirkbeck) — applied

Both locators now give only what kraus-1997 actually contains:
- **§3.14 (line 741).** "…and the explicit mod-two Chebotarev argument, kraus-1997 lines 435–441" becomes "kraus-1997 lines 437–438, which assert the rational two-point by reference to item [25], IV-6, of its bibliography; the Chebotarev argument is supplied here".
- **§3.15 (line 753).** "…the coordinate/Chebotarev argument below, kraus-1997 lines 435–441" becomes "kraus-1997 lines 438–439, which assert without proof that the quotient by the only rational two-point has full rational two-torsion; this subsection supplies the square-class step".

I checked both against the source text. Line 438 cites [25], IV-6, which is Serre's *Abelian l-adic representations* (bibliography line 1214). Lines 438–439 state the E′/⟨P⟩ conclusion with no argument.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are 17 "declaration uses `sorry`", at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298: the 14 earlier ones plus the three new theorems.
- **Gate** at `4a7a185`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout):

      depcheck: 238 roadmaps, 2352 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The new supplier WeightsInEtaleCohomology (146) is earlier than this roadmap (282), and the DeligneWeightsAndPurity edge is gone.
- **`roadmaps resolve`** on the README lists no citation or Lean name found nowhere. That includes `newform_ramanujan` and WeightsInEtaleCohomology §6.1.

## Lean signatures

All 27 declarations were checked mechanically. One scratch file imported the built module and ran `#check @…` on each. It elaborated with exit 0 and no error.
- **The 24 earlier declarations** are byte-identical (the Lean diff removes only docstring lines). Their types are as listed in the worker's `signatures.md`.
- **The three new types**, as elaborated, match their README statements:
  - `exceptional_prime_isogeny_j : ∀ (r γ : ℕ), (r, γ) ∈ {(19, 96), (43, 960), (67, 5280), (163, 640320)} → {j | ∃ E, ∃ (x : E.IsElliptic), CyclicIsogenyDegree E r ∧ E.j = j} = {-↑γ ^ 3}`. The source writes `-((γ : ℚ) ^ 3)` explicitly.
  - `non_cm_prime_isogeny_degrees : ∀ (E) [E.IsElliptic], GeometricallyNonCM E → ∀ r, Nat.Prime r → CyclicIsogenyDegree E r → r ∈ {2, 3, 5, 7, 11, 13, 17, 37}`.
  - `isogeny_j_tables_11_17_37` is the conjunction of the three set equalities.
- **Binders.** The file has no `variable`, `include` or `set_option`, so no binder can be dropped.

## Ownership, citations and sources

- **Bound ownership** (H02). `roadmaps grep -i 'ramanujan bound'` over main and the open heads finds the weight-two bound at every embedding only in WeightsInEtaleCohomology §6.1. AutomorphicGaloisRepresentations line 3828 uses it as an input. ModularityAndLanglandsExtensions §4.40 is the Bianchi analogue.
- **j-value statements** (H03). They have counterparts only in EllipticCurveModularityPartII: `rational_isogeny_j_tables` and `noncm_prime_isogeny_degrees`. These are reported under H01. No declaration takes a fully qualified name from a roadmap readable here.
- **No notion moved down**, and no later roadmap is cited as a supplier.
- **Open pull requests.** `overlaps.md` lists no open pull request changing this roadmap and no dropped id. WeightsInEtaleCohomology (#1001, head `9e753f8`) is a new roadmap earlier in the order, cited as it stands at its head, so it is not an "only an open revision defines" citation.
- **Sources.** No new source was added. Only the existing manifest keys kraus-1997, mazur-1978 and lemos-2017 are cited at new lines. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `exceptional_prime_isogeny_j` | (19,96); y²+y=x³−38x+90; mismatched pair (19,960); r=11 | c₄=1824=19·96, Δ=−6859=−19³, j=1824³/(−19³)=−884736=−96³. −960³=−884736000, −5280³=−147197952000, −640320³=−262537412640768000. (19,960) and r=11 are outside the Finset, so nothing is asserted | holds both ways (existence: mazur-1978 lines 26–28) | added |
| `non_cm_prime_isogeny_degrees` | 11a1 (non-CM, rational 5-torsion); 361a1 (CM, 19-isogeny); r=1 (identity) | 11a1: j=−122023936/161051, nonintegral, 5∈list. 361a1: j=−96³ and 19∉list, so the claim is false without `hCM`. r=1 holds for every E via the identity and 1∉list, so `hr` is needed | holds; both hypotheses needed | added; 361a1 added as a negative-control Check in §5.1 |
| `isogeny_j_tables_11_17_37` | the seven values; 0 and 1728 | −11·131³=−24729001, −2¹⁵=−32768, −11²=−121; −17²·101³/2=−297756989/2, −17·373³/2¹⁷=−882216989/131072; −7·137³·2083³=−162677523113838677, −7·11³=−9317. Only −32768 is among the 13 rational CM j-values; neither 0 nor 1728 is listed | equals lemos-2017 lines 197–202 | added |
| WeightsInEtaleCohomology §6.1 at k=2 | 11a at q=2; level-23 form at q=2; wrong normalization p^(k/2) | a₂=−2 and 2≤2√2≈2.828; the roots of X²+2X+2 are −1±i, with modulus √2. a₂=(−1±√5)/2 gives 0.618 and −1.618, both ≤2.828. p^(k/2) would allow 4 at q=2, which is too weak | bound and normalization consistent with line 30's check | contract replaces the gap |
| §1.4 nonvanishing through §1.1 | p=2, 3 | 2√2≈2.83<3 and 2√3≈3.46<4, so α=p+1−s·a_p≠0 | holds | route reworded |
| §3.4 bound (Hasse added to *Needs:*) | q=2, 3, 5; excluded q=1 | 4√q against (√q+1)²: 5.657≤5.828, 6.928≤7.464, 8.944≤10.472. At q=1 it is 4=4 | holds; the Hasse bound was a missing input | *Needs:* line |
| Line 66: coprime-degree isogeny is bijective on E[n] | y²=x³−x, φ to E/⟨(0,0)⟩, n=3 and n=2 | n=3: φ̂∘φ=[2] with [2]²=[4]=[1] on E[3], so φ is injective, and 9=9 points makes it bijective. n=2: φ((0,0))=O, not injective | coprimality needed | reworded |
| §4.19 (Layer 2 structure of E[N]) | y²=x³−x, T=⟨(0,0)⟩, T′=⟨(1,0)⟩ | E′=E/T: y²=x(x²+4), with E′[2]={O,(0,0),(±2i,0)}. φ̂(E′[2])=T≠T′, so ker(ψ∘φ̂)≠E′[2] and is cyclic of order 4 | holds; coprime transport not used | citation re-pointed |
| §4.20 transport | ℓ=3, deg 2 | gcd(2,3)=1, so E[3]→E′[3] is bijective and the stable line maps to a stable line | holds | citation and *Needs:* |
| §3.15 square-class step (H05) | a=3, b=1; a=0, b=2 at q=5 | the quotient x(x²−6x+5)=x(x−1)(x−5) has full 2-torsion. #C(𝔽₅) for y²=x³+2x is 2, and 4∤2 | statement holds; Kraus gives no argument | locator only |
