# Review of StringOrientation (pull request #948 at 2faaf46)

**Verdict:** needs changes

Gate at 2faaf46: every check passed (build of `TauCetiRoadmap.StringOrientation.Suggested` green, no `set_option`, no sorry'd data, no edits outside the folder). The dependency check as run on this README reports `depcheck: 201 roadmaps, 1328 edges, 0 problem(s)` with no `moved:` line. That clean result is an artefact: the README states every supplier in prose and contains no `*Needs:*` line or supplier table, so the check extracts no edge for this roadmap at all (see R01 and R03 for the probe that shows what it reports once the edges are visible).

## R01 (P1) — Supply cycle with TangentialBordism

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 39–43 ("TangentialBordism owns geometric cycles … its Cayley-plane example consumes S1"), 207 ("Apply TangentialBordism B5's generic Pontryagin–Thom comparison"), 251–252 ("TangentialBordism B4's Adams tower"), 520 ("TB B6 supplies oriented/Spin characteristic-number detection"), 630–634.

Claim: StringOrientation consumes TangentialBordism B3 (OP² carrier), B4, B5 and B6, and TangentialBordism B3.8–9 consumes StringOrientation S1.

Witness: `TauCetiRoadmap/TangentialBordism/README.md` at the head of its pull request, line 42, supplier table row "StringOrientation, S1 | normalized λ on the stable Spin classifier, BString mapping-path fibre, relative lifts and H3 torsor | only this early obstruction/lift lane precedes B3.8", and line 683. The merge order lists StringOrientation at position 6 and TangentialBordism at 9. A probe copy of this README with a single added line `*Needs:* TangentialBordism §B5, LieGroupoidsPoisson §G0.1, EllipticCohomology §E4.` run through the same dependency check reports:

```
not movable: StringOrientation consumes LieGroupoidsPoisson (#135) and is consumed by TangentialBordism (#8), which comes first; StringOrientation lies on a dependency cycle with TangentialBordism, so no move repairs the order
UPWARD: StringOrientation (#5) -> LieGroupoidsPoisson (#135) at README lines [690]
UPWARD: StringOrientation (#5) -> TangentialBordism (#8) at README lines [690]
CYCLE among: StringOrientation, TangentialBordism
```

Repair: break the cycle by moving ownership in one direction. The README itself says TangentialBordism's generic targets precede the String specialization, so keep TangentialBordism as the supplier: move the String column of TangentialBordism's projective-plane table (B3.8–9's OP² String-lift conclusion, which the README already says is reached "through this API") into S1.5 here, and delete the sentence that S1 "exports the obstruction, difference and finite-rank interfaces consumed by TangentialBordism B3.8–9". Then state the B3/B4/B5/B6 consumption on `*Needs:*` lines so the check sees the edges (R03). Whichever direction is chosen, TangentialBordism's own README must stop citing S1 in the same change, since two open pull requests citing each other is the cycle.

## R02 (P1) — Supply cycle with EllipticCohomology

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 528–541 (S5: "For the Ando–Hopkins–Rezk orientation σ:MString→tmf … EllipticCohomology supplies the orientation and target spectrum"), 570–598 (S6: "Consume EllipticCohomology E4's actual permanent classes"), 605–607 ("Consume EllipticCohomology E5's genus/elliptic q-expansion comparison"), and 637–641 ("E5 consumes S2's Thom ring and primary genus before those applications").

Claim: StringOrientation consumes EllipticCohomology E4 and E5, and EllipticCohomology E5 consumes StringOrientation S2.

Witness: `TauCetiRoadmap/EllipticCohomology/README.md` at its head, line 740 "Consume StringOrientation S2's actual E∞ MString model", line 787 "Consume S2's particular E∞ MString model", line 806 "StringOrientation owns the geometric I_OP inclusion". The merge order lists EllipticCohomology at 5 and StringOrientation at 6, so from this roadmap's side the E4/E5 citations are downward, but the README's own Order paragraph (line 637) records the reverse edge. A roadmap-level order cannot satisfy both.

Repair: choose one direction and record it. The cleanest split follows what the README already separates: S1–S4 (classifier, Thom ring, differential refinements, primary genus) stay here as EllipticCohomology's supplier; the targets that consume tmf (the I_OP questions at the end of S5, the refined tmf/TMF counterexamples and the E5 q-expansion comparison in S6) move to a "StringOrientation, Part II" roadmap placed after EllipticCohomology, whose introduction says where this roadmap stops. The S6 Ricci calculations, the framed-bordism identifications and the low-weight vanishing (which use only S4 and the Lichnerowicz input) can stay. Delete the sentence at line 637 once the direction is fixed.

## R03 (P2) — Upward suppliers that the dependency check cannot see

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 44–45 ("SmoothBundlesConnections owns bundles, connections, good covers"), 250–252 and 270 and 632 (HomotopySpheres Stage 4B, 4C, 9), 294–297 ("Consume LieGroupoidsPoisson G0.1's submersion normal form … SmoothBundlesConnections B1.1/B1.5"), 505–506 (GeometricTopology, AffineMorseLefschetz).

Claim: every supplier is named in prose; no target has a `*Needs:*` line and there is no `## Exact supplier contracts` section.

Witness: the merge order lists StringOrientation at 6, SmoothBundlesConnections at 7, HomotopySpheres at 64, LieGroupoidsPoisson at 136. The check output on the untouched README is `0 problem(s)` with no `moved:` line; the probe in R01 shows UPWARD lines as soon as one `*Needs:*` line exists. None of SmoothBundlesConnections, HomotopySpheres, LieGroupoidsPoisson or IndexTheory cites StringOrientation back (grep of their heads: no hit), so these three are movable once visible; FourManifolds (119) consumes S1 and is later, which is consistent.

Repair: give each target a `*Needs:*` line naming its suppliers by roadmap and section (Mathlib declarations by name), and add an `## Exact supplier contracts` section listing, per supplier, the sections consumed. Re-run the dependency check with `--movable`; after R01 and R02 are resolved it should print a `moved:` line placing this roadmap after LieGroupoidsPoisson and no UPWARD or CYCLE line.

## R04 (P2) — GeometricTopology does not own a transversality theorem

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 503–506: "Prove existence of the complete intersections, regularity/transversality … consuming AffineMorseLefschetz's projective zero-locus carrier and GeometricTopology's transversality."

Claim: the smoothness of the chosen complete intersections of degrees 2 and 3 is supplied by a transversality target in GeometricTopology.

Witness: `TauCetiRoadmap/GeometricTopology/README.md` on main mentions transversality once, at line 803, as "a closed transversal through every leaf" of a foliation; it states no transversality or general-position theorem. The statement actually needed (a general member of a linear system of hypersurface sections of a smooth projective variety is smooth) is owned by `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §4.13 as `bertini_smoothness` (lines 5643, 5680).

Repair: cite SchemeAndStackFoundations §4.13 `bertini_smoothness`, applied inductively to the r hypersurfaces, and name the analytification or the smooth-manifold comparison that turns the smooth projective complete intersection into the closed manifold the bundle construction uses; or own a smooth regular-value statement here with its hypotheses. AffineMorseLefschetz's carrier (line 5–7 of its README) is correctly cited.

## R05 (P3) — Suggested.lean is padding and its docstring omits three layers

Location: `TauCetiRoadmap/StringOrientation/Suggested.lean` lines 28–40.

Claim: the file states "what of the roadmap is statable" on the pins.

Witness: `ClassifierNullhomotopy` is `abbrev … := ContinuousMap.Homotopy (lambdaMap.comp c) (ContinuousMap.const X k)` (a renamed library structure); `ClassifierNullhomotopy.start` and `.finish` are proved by `H.map_zero_left x` and `H.map_one_left x`, which are the structure's own fields at `Mathlib/Topology/Homotopy/Basic.lean` lines 78 and 80 (class forms at 92, 94). No headline theorem is stated, and none of the three declarations is mentioned in the README. The docstring names S4, S5 and S6 as not statable but is silent on S1 (no `BSpin`, `K(ℤ,4)` or `BString` at the pin), S2 (no `MString`, no framed bordism, no `π₃ˢ ≅ ℤ/24`) and S3 (no differential characters or bundle gerbes).

Repair: delete the abbrev and both theorems from `Suggested.lean` (the README keeps the nullhomotopy convention as an S1 target); extend the module docstring to list the S1, S2 and S3 headlines with the carrier each lacks. The file then correctly states nothing. I checked the elaborated signatures (3 declarations, no dropped section binder); nothing else is affected.

## R06 (P3) — The Waldorf convention statement is false and the pinned conversion is empty

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 393–397: "Forms here are real with integral periods; Waldorf uses iℝ-valued curvatures. Pin H_W=2πiH and the same conversion for curvings and transgression, so exp(∫H_W)=exp(2πi∫H)."

Claim: Waldorf's curvatures are iℝ-valued, so a factor 2πi converts his forms to this roadmap's.

Witness: waldorf-string-connections lines 698–699 (the curvature of a bundle gerbe connection is a closed real 3-form representing the Dixmier–Douady class in real cohomology), lines 727–730 (H = ⅙⟨θ∧[θ∧θ]⟩ represents the integral generator), Theorem 1.3.3(a) at line 411 (dH is one-half of the real Pontryagin 4-form), line 1187 (sections of functions exponentiate by exp(2πit)). His forms are real with integral periods, exactly as here. The only place a 2πi is missing is the holonomy formula (4.2.1) at line 1092, which writes exp(∫H); that is a misprint in the source (recorded below), not a convention.

Repair: delete the iℝ sentence and the `H_W=2πiH` conversion; state that the degree-3 transgression is `exp(2πi∫H)` for the real form H and that Waldorf's (4.2.1) omits the factor. Everything else cited from Waldorf checks: V_T and U match lines 876–882 verbatim in content, Theorem 1.3.4 and Proposition 3.3.4 give the affine space, Theorem 1.3.3 gives π*H = K + TP(A), the derivative and the κ-shift, Lemma 4.3.2 gives injectivity by evaluation at the point, Lemma 4.3.3 gives surjectivity under the point-determination hypothesis.

## R07 (P3) — The EllipticCohomology E4 citation names statements E4 does not make

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 570–582: "Consume EllipticCohomology E4's actual permanent classes d₂∈π_192 tmf_(2), d₃∈π_72 tmf_(3) and D∈π_576 tmf … including its Δ⁸ polynomial-extension comparison at2 and Δ³ multiplication injectivity at3, with the sphere unit detections".

Claim: E4 supplies these named classes, the two injectivity statements and the tmf-images of ν and ε.

Witness: `TauCetiRoadmap/EllipticCohomology/README.md` at its head, lines 717–722, constructs an integral permanent-cycle lift of Δ²⁴ in degree 576, `tmf[(Δ²⁴)⁻¹]≃TMF`, and "degree192 periodicity at2 from Δ⁸, degree72 periodicity at3 from Δ³"; the names d₂, d₃, D occur nowhere in it, and neither "multiplication by Δ⁸ is injective on π_*tmf_(2)" (bmq-hurewicz lines 128–129: the homotopy is the pattern tensored with ℤ_(2)[Δ⁸]) nor "multiplication by Δ³ is injective" (belmont-shimomura Theorem 6.1, line 655) is stated there. E4.S (lines 374–437) detects η, ν, ε, κ in the sphere, not their images in tmf.

Repair: either cite the exact E4 sentences and introduce d₂, d₃, D here as this roadmap's names for E4's Δ⁸, Δ³ and Δ²⁴ lifts, or declare a precise gap on EllipticCohomology E4: "multiplication by Δ⁸ on π_*tmf_(2) and by Δ³ on π_*tmf_(3) is injective, and the unit sends ν to a generator of π₃tmf and the order-2 class of π₈ˢ to the ℤ/2 summand of π₈tmf". The mathematics itself is right (table rows 20–23). This is subsumed by whichever direction R02 takes.

## R08 (P3) — Backticked names that Suggested.lean does not declare, and Lean names the README does not mention

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 61–62 (`stableSpinPontryaginOne`, `stableSpinWFour`), 76 (`spinLambda_modTwo_eq_wFour`), 79 (`spinLambda_adjoint_eq_neg_two_cTwo`), 97 (`spinLambdaMap_isEightConnected`), 106 (`stringClassifyingSpaceFiniteRank`), 148 (`spinLambdaClassifiesSevenDimensionalCW`).

Witness: none of the seven is declared in `Suggested.lean`; conversely `ClassifierNullhomotopy`, `ClassifierNullhomotopy.start` and `.finish` appear nowhere in the README. FourManifolds at its head (line 860) consumes `spinLambda_adjoint_eq_neg_two_cTwo` by name, so the name is an interface promise.

Repair: after R05 the Lean side is empty, so either keep these as prose names without backticks (they cannot be declared at the pins) or keep the backticks and say in `## Exact supplier contracts` that they are the intended Lean names of S1 targets, not declarations of this file. Tell FourManifolds which.

## R09 (P3) — No Checks, no locators at claims, no API bullets

Location: whole README; for example S1.1 (lines 58–80) defines λ, `stableSpinPontryaginOne`, `stableSpinWFour` and the adjoint formula with no `**Checks.**` list, and no claim anywhere carries a theorem or page locator (the references at lines 646–688 are works, not locators).

Witness: the README's form rules ask for at least three discriminating Checks per definition, every theorem with a locator, and every target's needs. The computed witnesses in the table below are exactly the Checks the definitions lack: ⟨λ,hur(g)⟩ = −1 against G5.0's `⟨c2(Cγ_H),(h_S4)_*[S4]⟩=+1`; λ(ad V) = −2c₂(V) from weights 0, ±2x; Â₄(OP²) = 0 and L₄(OP²) = 1 from p₂ = 6u, p₄ = 39u²; Ric = g/4 for g = −B; the log-coefficients 2G₂ₖ/(2k)! of Q; the Frobenius number 13 of {3,8}.

Repair: add a `**Checks.**` bullet list under each definition (λ, BString and BString(n), the H³ torsor action, the differential refinement λ̂, Θ_q and Q, the Ricci convention, the F₄ pushforward) with these values and one negative control each (the rank-3 gerbe at half level; p₁ = 0 on a torsion base with λ ≠ 0; the u-oriented S⁴ with the opposite fundamental class), and put the locator at each claim (McTague Theorem 4 at mctague-cayley-plane line 324; Lemma 8 at line 1030; Waldorf Theorem 1.3.3 at line 404; Hopkins §4.3 at hopkins-icm2002 line 400; Belmont–Shimomura Theorem 6.1 at line 653).

## R10 (P3) — The Mathlib diffeology link is to a commit that is not the pin

Location: `TauCetiRoadmap/StringOrientation/README.md` lines 682–683, link to `Mathlib/Geometry/Diffeology/Basic.lean` at mathlib4 commit 6b7abb3c.

Witness: the pinned Mathlib is a91d3aaf (lake-manifest). At the pin the file exists with `DiffeologicalSpace` (line 159), `Diffeology.IsPlot` (196), `Diffeology.DSmooth` (202), `DiffeologicalSpace.CorePlotsOn` (284), `DiffeologicalSpace.ofCorePlotsOn` (319), `Diffeology.IsDTopologyCompatible` (353), `Diffeology.IsContDiffCompatible` (370), and no other file in Mathlib mentions `DiffeologicalSpace`, so the README's claim that there are no product, subspace or pullback diffeologies holds at the pin.

Repair: cite the file by path at the pinned revision (or without a commit), not at a foreign commit.

## Verified sound

**Adversarial table.** One row per statement checked; values computed on each side.

| # | Statement (README line) | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | 2λ = p₁ pins λ with no sign choice (29–30) | H⁴(BSpin;ℤ) | H⁴(BSpin;ℤ) = ℤ torsion-free; p₁ = 2·gen; λ = gen | holds | none |
| 2 | λ = −c₂(γ_H) on the quaternionic Hopf line, ⟨λ,hur(g)⟩ = −1 (31–33) | HP¹ = S⁴ | p₁(underlying real of rank-2 complex with c₁=0) = −2c₂; GeneralizedCohomology G5.0 (main, line 1506) exports ⟨c₂(ℂγ_H),(h_S4)_*[S⁴]⟩ = +1, so ⟨λ,hur(g)⟩ = −1 | holds | none |
| 3 | TangentialBordism's u-oriented S⁴ has the opposite fundamental class (34–35) | j = 1 | TangentialBordism head line 1536–1538: orient HP^j so u^j evaluates 1, "the sign is (−1)^j"; j=1 gives −1 relative to G4.0a's chart orientation | holds | none |
| 4 | λ(ad V) = −2c₂(V) for an SU(2) lift (79–81) | torus weights | c(ad V ⊗ ℂ) = (1+2x)(1−2x) = 1−4x²; c₂(V) = −x²; p₁(ad V) = −c₂(Sym²V) = 4x² = −4c₂(V); λ = p₁/2 = −2c₂(V) | holds | none |
| 5 | rank-3 gerbe at the group generator has half the stable λ level (338–341) | Spin(3) → Spin(n), n ≥ 5 | vector representation of SU(2) in SO(n): π₃ map is ×2 (Dynkin index 2); consistent with row 4 (λ(ad V) = 2·(−c₂)) | holds | none |
| 6 | λ: BSpin → K(ℤ,4) is an 8-equivalence, fibre 7-connected (96–99) | π_i, i = 4,5,6,7,8 | π₄: ℤ → ℤ iso by row 2; π₅,π₆,π₇ BSpin = 0 = π_i K; π₈ BSpin = ℤ → 0 surjective; i<4 both 0 | holds | none |
| 7 | String(n) → Spin(n) iso on π_i, i ≥ 4, source 3-connected, fibre K(ℤ,2) (130–132) | LES | π₃ String = 0 → π₃ Spin = ℤ → π₂ K(ℤ,2) = ℤ → π₂ String = 0; iso for i ≥ 4 | holds | none |
| 8 | String(n) not of the homotopy type of a finite-dim Lie group (132–159) | n = 5 | compact connected K with π₃ = 0 is a torus; π₁ = 0 makes it trivial; then Spin(n) ≃ K(ℤ,3); H^{10}(Spin(5);ℚ) = ℚ ≠ 0 = H^{10}(K(ℤ,3);ℚ) = Λ(x₃)^{10} | holds | none |
| 9 | H³ of finite stages and of BSpin×BSpin vanishes; lim¹ = 0 (64–67, 191–192) | ℤ, 𝔽₂ | BSpin(n) 3-connected ⇒ H³ = 0; lim¹ of zero groups = 0 | holds | none |
| 10 | λ_*: [X,BSpin] ≃ H⁴(X;ℤ) for CW X of dim ≤ 7; λ = 0 iff X⁴-restriction trivial (148–156) | dim 7, dim 4 | row 6 plus Whitehead for dim X < 8; H⁴(X) → H⁴(X⁴) injective | holds | none |
| 11 | S³ gauge test: Ωλ(g) = −1 shifts the torsor by +1; framed change −J(g) (181–184, 263–268) | g = positive π₄ generator | action is the negative of the λ class: −(−1) = +1; β = (Ωλ)⁻¹(+1) = −g; tangent change −β = g; normal change β = −g; class change J(β) = −J(g) | internally consistent | none |
| 12 | S → MString iso on π_i, i ≤ 6 (248–250) | cofibre MString/S | BString 7-connected ⇒ bottom cell of MString/S in degree 8 ⇒ iso i ≤ 6, surjection i = 7 | holds | none |
| 13 | [M,Spin] ≃ H³(M;ℤ) for closed oriented 3-manifolds; Ω₃^String ≅ ℤ/24 (253–256) | S³, S¹×S² | Spin → K(ℤ,3) is a 7-equivalence (π₄ = π₅ = π₆ = 0); row 12 and π₃ˢ = ℤ/24 (HomotopySpheres head line 1254) | holds | none |
| 14 | H*(BString;ℚ) = ℚ[p₂,p₃,…]; rational String bordism polynomial on degrees 4k, k ≥ 2 (236–241) | k = 1 | rational fibre K(ℚ,3) kills p₁ only; generators 8, 12, … | holds | none |
| 15 | Y^[k] has dimension k·dimY − (k−1)·dimM; δ = Σ(−1)^{i−1}omit_i* (298–300, 314) | k = 1, 2 | k=1: dimY; k=2: 2dimY − dimM; δ: Ω(Y^[k−1]) → Ω(Y^[k]) has k faces | holds under that indexing | none |
| 16 | compatible connections form an affine space over V_T = (Ω²(M)⊕Ω¹(Y)⊕Ω¹(W))/U (344–349) | source | waldorf-string-connections lines 876–882 and Proposition 3.3.4 (885–887): same V_T, same U | holds | none |
| 17 | π*H = K_∇ + TP(A), dH = curv(λ̂), H_{T·κ} = H_T + curv(κ) (357–360) | source | Theorem 1.3.3 (lines 404–415): π*H = K + TP(A); dH = ½ p₁-form; H_{T·κ} = H + Ω(κ) | holds | none |
| 18 | Q(x,q) and G₂ₖ: log Q has x^{2k}-coefficient 2G₂ₖ/(2k)! (421–427) | k = 1,2; q-part | q⁰: log((x/2)/sinh(x/2)) = −Σ B₂ₖ x^{2k}/(2k(2k)!) = Σ 2(−B₂ₖ/4k) x^{2k}/(2k)!; q-part: Σ_{n,m} (q^{nm}/m)(e^{mx}+e^{−mx}−2) = Σ_k 2x^{2k}/(2k)! Σ_N σ₂ₖ₋₁(N)q^N | holds | none |
| 19 | c₄ = 240G₄, c₆ = −E₆ = 504G₆ with this normalization (EllipticCohomology head 713–714) | B₄ = −1/30, B₆ = 1/42 | −B₄/8 = 1/240 ⇒ 240G₄ = E₄; −B₆/12 = −1/504 ⇒ 504G₆ = −1 + 504Σσ₅q^n = −E₆ | consistent across roadmaps | none |
| 20 | Ric = −B/4 = g/4 for g = −B, from ∇_XY = [X,Y]/2 (556–560) | left-invariant X,Y,Z | R(X,Y)Z = ¼[X,[Y,Z]] − ¼[Y,[X,Z]] − ½[[X,Y],Z] = −¼[[X,Y],Z]; tr(X ↦ −¼[[X,Y],Z]) = −¼ tr(ad_Z ad_Y) = −B(Y,Z)/4 | holds | none |
| 21 | SU(2) with g = −B is a positive rescaling of the round metric (560–562) | round S³ radius r | round: Ric = (2/r²)g; here Ric = g/4 ⇒ r² = 8 | holds | none |
| 22 | left-framed S³ ↦ generator of π₃tmf = ℤ/24; left-framed SU(3) ↦ order-2 element of π₈tmf (566–569) | source | hopkins-icm2002 lines 396–405: π₃tmf = ℤ/24, π₈tmf = ℤ⊕ℤ/2, unit iso in degrees ≤ 6, nonzero on left-framed SU(3); a torsion class lands in the ℤ/2 | holds | none |
| 23 | d₂^j·u₈ order 2, d₂^j·ν order 8, d₃^j·α order 3 for all j (577–581) | j = 0, 1 | π₃tmf_(2) = ℤ/8, π₃tmf_(3) = ℤ/3; π_*tmf_(2) = pattern ⊗ ℤ_(2)[Δ⁸] (bmq-hurewicz 128–129) so Δ⁸-multiplication injective; Δ³ injective at 3 (belmont-shimomura 655) | holds | R07 (citation) |
| 24 | localization criterion gives periodic orders 2 and 24 (587–592) | x of order 8 with all D^jx of order 8 | ord(x/1) divides ord(x); 4x/1 = 0 iff ∃j D^j·4x = 0, excluded; 2-part 8, 3-part 3 ⇒ 24 | holds | none |
| 25 | D_(2) = d₂³, D_(3) = d₃⁸ (575–576) | degrees | 3·192 = 576 = 8·72 | holds | none |
| 26 | Witten genus vanishes in dimensions 4, 8, 12, 16, 20, 28 under scalar curvature > 0 (609–615) | weights 2,4,6,8,10,12,14 | dim M_{2k} = 0,1,1,1,1,2,1; constant term Â(M) = 0 by Lichnerowicz; weight 12 (dim 24) excluded | holds | none |
| 27 | p(OP²) = 1 + 6u + 39u² gives φ_W(OP²) = 0 (432–434) | Â₄, L₄ with p₁ = p₃ = 0 | Â₄ ∝ −192·39 + 208·36 = −7488 + 7488 = 0; L₄ = (381·39 − 19·36)/14175 = 14175/14175 = 1 (signature 1, orientation u² = +1) | holds | none |
| 28 | McTague's generator criterion (473–482) | source | mctague-cayley-plane Theorem 4, lines 324–340: ord_p s_n = 1 iff 2n = p^i−1 or p^i+p^j (0 ≤ i ≤ j), else 0; N^{2(p^i+p^j)} with s = 0 and the mixed number ≢ 0 mod p² for 0 < i < j | holds | none |
| 29 | 3a + 8b = N solvable for every N ≥ 14 (496–497) | N = 13, 14 | Frobenius number 3·8−3−8 = 13; Lemma 8 at line 1030: n + (a+b) = 4a + 9b | holds | none |
| 30 | vertical contribution 4n_f²(x₁²+x₂²) (498–499) | weights n_f(x₁,x₁,x₂,−x₂) | 8 roots ½(e₁±e₂±e₃±e₄): Σ = 2Σe_i² = 2n_f²(2x₁²+2x₂²) = 4n_f²(x₁²+x₂²); source prints 4n_f (misprint, below) | holds | none |
| 31 | three Weyl cosets, eight positive complementary roots (470–471) | F₄ ⊃ Spin(9) | 1152/384 = 3; 16 roots ½(±e₁±e₂±e₃±e₄), 8 positive | holds | none |
| 32 | Theorem 1 of McTague: connected structure group, ℤ[1/6] (514–517) | source | lines 58–62: "Away from 6, the ideal … with connected structure group is precisely the kernel of the Witten genus" | holds | none |
| 33 | tmf[1/6] is not a ring-spectrum quotient of MString[1/6] (49–51, 538) | source | mctague-not-quotient lines 8–23 | holds | none |
| 34 | D-topology equals the product topology when one D-topology factor is locally compact (380–382) | q_X × id | quotient × locally compact Hausdorff is quotient; plot domains are open in ℝⁿ | holds | none |
| 35 | Mathlib's diffeology file has no product, subspace or pullback diffeology (375–377) | grep at pin | only `Mathlib/Geometry/Diffeology/Basic.lean` mentions `DiffeologicalSpace`; instances only for ℝ (412) and `EuclideanSpace` (414) | holds | none |
| 36 | σ orientation refines the Witten genus with series x/σ (646–649) | source | ahr-koandtmf lines 49–52 (σ(L,q)) and 93–94 (MO⟨8⟩ → tmf → KO[[q]] is the Witten genus); Q = x/σ | holds | none |
| 37 | transgression injective by evaluation at a point, surjective under point determination (395–400) | source | Lemma 4.3.2 (1258–1264), Lemma 4.3.3 (1289–1294) | holds | none |
| 38 | Waldorf's forms are iℝ-valued (393–394) | source | lines 698–699, 727–730, 411: real forms | false | R06 |
| 39 | Suggested.lean `start`/`finish` (32–40) | one-tactic probe | closed by the structure fields `map_zero_left`/`map_one_left` | padding | R05 |

**Library declarations opened at the pin.** `Mathlib/Geometry/Diffeology/Basic.lean` lines 159, 196, 202, 284, 319, 353, 370, 412, 414; `Mathlib/Topology/Homotopy/Basic.lean` lines 76, 78, 80, 92, 94; `Mathlib/NumberTheory/ModularForms/QExpansion.lean` line 171 (`qExpansion`, relevant to S4 but not needed by any Lean statement); `Mathlib/NumberTheory/FrobeniusNumber.lean` (row 29 is statable but is a Check, not a headline). Elaborated signatures of the 3 declarations compared with the README: no dropped binder; nothing changed.

**Cross-roadmap citations resolved** (at main for roadmaps on main, at the open head otherwise): GeneralizedCohomology G2.10 (main line 533), G3.4 telescope/Milnor (717), G3.8 (785), G5.0 (1375, with the +1 pairing at 1506), G5.3 (1536), G5.6 with H*(K(ℤ,n);ℚ) exterior for n odd (2212–2229); AlgebraicTopology Stage 8 items 3, 4, 5, 7, 10 (1684, 1694, 1700, 1811, 1911) and 8.11b `ordinaryEMLoopComparison` with loop coordinate last (1993–1997), Stage 6 cochains (1011); CharacteristicClasses C4.3 universal connections (1053–1058); SpinGeometry G4.1a/b (397, 425) and G6 `realSpinLichnerowiczFormula` (G6 line 68 of the section); IndexTheory I7 twisted index `ind D_W⁺=⟨Â(TM)ch(W),[M]⟩` (head, I7 line 134 of the section) and its untwisted dimension-4 comparison; LieGroupoidsPoisson G0 and G0.1 normal form (head, 149, 220–225); SmoothBundlesConnections B1.1 and B1.5 (head, 280, 391); BordismFormalGroups F3–F5 with BP⟨1⟩, Wilson, Hopf rings and the explicit hand-off to StringOrientation (main, 295–327); DGFloer Layer 1 item 2 (main, 461); LieHighestWeight Layer 8 compact real algebra sublane (main, 1197 and its "compact real algebra suppliers" bullet); AffineMorseLefschetz projective zero locus (main, 5–7, 54); TopologicalKTheory stable BO/BSO (main, 106); ModularForms q-expansion (main, 1110); TangentialBordism B3.6–B3.9, B4.7, B5, B6 (head, 574–700, 869, 913, 1188); HomotopySpheres Stage 4B (648), 4C.3 change of framing (697–698), Stage 9 π₃ˢ (1254); EllipticCohomology E4, E4.S, E5 (head, 358, 374, 738); FourManifolds consumes S1 (head, 62, 860). Ownership statements on main agree with this roadmap: GeneralizedCohomology (59, 626, 2589), BordismFormalGroups (33–34, 323), PositiveScalarCurvature (56–57; it expects StringOrientation to consume its scalar-curvature theory, which this README does not cite; not a defect of this folder).

**Sources, the seeded sample (15 targets, none by heading):** rows 16, 17, 22, 23 (two sources), 28, 29, 30, 32, 33, 36, 37, 38 of the table, plus Hovey's abstract (hovey-mstring lines 8–11, 26–34: no p-torsion for p ≥ 5, rings are quotients of polynomial rings by regular sequences) and McTague's Proposition at line 342 (forgetful map away from 6). All verified except row 38 (R06). The gate: every check passed; the dependency check is clean only because no edge is extractable (R01, R03).

**Ownership against open pull requests:** checked by object in the sibling checkouts the brief lists (BString, MString, λ, the OP² carrier, the σ orientation, the tmf coefficient engine, diffeologies): no second owner found; the OP² carrier, the Hovey presentation, the coefficient engine and the σ orientation are explicitly assigned to TangentialBordism, StringOrientation, EllipticCohomology and EllipticCohomology respectively by those roadmaps. Open pull requests not given with files were not checked.

## Not verifiable

- stolz-conjecture (Stolz, Math. Ann. 304, 1996, DOI 10.1007/BF01446319): paywalled; the sources service refused the DOI and the arXiv search timed out twice. Cited by locator only; recorded in `needs-references.toml`. The conjecture as restated (positive-dimensional closed String manifold with Ric > 0 has vanishing Witten genus, one direction only) agrees with McTague's paraphrase at mctague-cayley-plane lines 116–120, which states the biconditional form Stolz asked as a question.
- Milnor–Stasheff, Borel–Hirzebruch, Borel–de Siebenthal, Cheeger–Simons, Gawędzki–Reis, Meinrenken, Carey–Johnson–Murray–Stevenson–Wang, Redden, Hovey–Ravenel, Wilson: books or journal articles cited without locators and not in the sample; not fetched. The one numerical input taken from Borel–Hirzebruch (p(OP²) = 1 + 6u + 39u²) was checked indirectly by the Â₄ = 0 and L₄ = 1 computations in row 27.

## Source issues

- **Misprint** in mctague-cayley-plane at page 16, lines 1017 and 1020 (proof setup for Lemma 8): the source says the vertical p₁ pulls back to 4n_f(x₁²+x₂²) and writes 4n_f in the string condition; it should be 4n_f²(x₁²+x₂²), since e₁,…,e₄ pull back to n_f times the x's and p₁ is quadratic in them; affects nothing (only how large n_f must be).
- **Misprint** in waldorf-string-connections at equation (4.2.1), page 30, line 1092: the source says the degree-3 transgression is exp of the integral of the real 3-form H; it should be exp(2πi ∫H), as the paper's forms are real (Theorem 1.3.3(a), line 1187); affects a stated result's normalization only.
