# GATE-EllipticLegendreCharacterInterfaces~4: answers to human review

Review: CBirkbeck, 2026-10-25T21:48:03Z, on head 2b50d7a. Its single blocking finding makes four points, one per consumer roadmap (H01–H04). Its scope notes make five more:

- H05: keep the §0.2 and §0.8 additions.
- H06: ModularCurves keeps the geometric universal family and the Legendre-line invariant theory.
- H07: the current upstream Tau Ceti.
- H08: the BS20 line numbers, and the uncertified book citations.
- H09: the build was not rerun.

The Frey item and the "Checks found sound" list ask for nothing.

Nothing changed this round and no commit was made, so the head is still 2b50d7a9. The four consumer heads are the same as last round: MordellLawrenceVenkatesh 73dc3e8, ComputationalNumberTheory 37b9f6f, ErdosProgressionPowers e007747 and ArithmeticDynamics d7b0a19. The cited lines are unchanged. In `ORDER.txt` all four come after this roadmap: it is line 105, they are lines 174, 155, 265 and 270. The review says itself that the remaining repair is in those four contracts, and that rewording this README will not discharge it. This pull request may edit only its own folder.

## H01 (CBirkbeck) — answered

MordellLawrenceVenkatesh §6.4 at 73dc3e8 still says the coefficient model "is to be defined" over every commutative ring. It still lists the model, Δ=16t²(t−1)² and j=2⁸(t²−t+1)³/(t²(t−1)²) as its own bullets, and its *Needs* do not cite this roadmap.

These are exactly §0.1 here (`legendre`, over every commutative ring) and §0.4 (Δ=16λ²(1−λ)², c₄=16(λ²−λ+1), and j=256(λ²−λ+1)³/(λ²(1−λ)²) for 2≠0, λ≠0,1). So the MordellLawrenceVenkatesh edit loses nothing: replace those three bullets with a citation of "EllipticLegendreCharacterInterfaces §§0.1, 0.4" in its supplier contract and *Needs*. The cyclic family, the abelian-by-finite structure and the good-model statements stay there. README lines 13 and 640 already state this split, so nothing changes here.

## H02 (CBirkbeck) — answered

ComputationalNumberTheory §3.17 at 37b9f6f (its README lines 1681–1696) still states and proves `pointCount = q+1+Σχ(f(x))` and the trace for every normal form over every odd finite field. Its *Needs* cite only Tau Ceti and Mathlib.

§5.1 here has the same hypotheses: odd characteristic, a₁=a₃=0, singular equations included. It also has the same 𝔽₂ non-example (count 3 against formula 4). I recomputed the identity on 2771 equations with no failure (table below). So the consumer edit is to cite §5.1 and keep only the filtered-enumeration bullet and the computational applications. Nothing changes here.

## H03 (CBirkbeck) — answered

ErdosProgressionPowers at e007747 is unchanged:
- its contract (lines 483–500) still calls LG.0 rational and LG.3 prime-field;
- it still takes the ordinary model from MordellLawrenceVenkatesh §6.4;
- §2.1 still does both extensions itself: to every field (lines 1056–1063) and to every odd finite field (lines 1081–1088).

Every one of those items now has a target here, at full generality:
- the ordinary model: §0.1;
- G_(D,λ) and the u²-scaling (x,y)↦(u²x,u³y): §0.2;
- the ordering scalars D, Dλ, −D, D(λ−1), D(1−λ), −Dλ: §0.8, in the same order as its line 1061;
- normalization over a general field: §0.9;
- the two-by-four subgroup over every odd finite field: §3.1.

So the Erdős edit is deletion plus re-citation, and it needs no new target here.

## H04 (CBirkbeck) — answered

ArithmeticDynamics at d7b0a19 (supplier paragraph, lines 172–174) still takes the coefficient model and Δ=16t²(t−1)² from MordellLawrenceVenkatesh §6.4. The review offers two repairs: cite §§0.1 and 0.4 here directly, or keep §6.4 as a forwarding contract once H01's edit is made. Both are forward edges, since ArithmeticDynamics is line 270 and this roadmap line 105. README line 13 already leaves §§6.35 and 6.111–6.112 (Lattès maps and torsion images) with ArithmeticDynamics, so nothing changes here.

## H05 (CBirkbeck) — answered

Both additions are kept unchanged, with their Checks at lines 112 and 206:
- README line 106 (§0.2): the change with scaling u⁻¹ carries L(d,λ) to L(u²d,λ), and on points sends (x,y) to (u²x,u³y).
- README line 196 (§0.8): the scalars d, dλ, −d, d(λ−1), d(1−λ), −dλ for the orders (012), (021), (102), (120), (210), (201).

I recomputed both on new instances:
- (d,λ,u)=(3,−2,5) gives (0,75,0,−11250,0), which is L(75,−2).
- Roots (−1,4,6) give d′=5, 7, −5, 2, −2, −7, and each translate equals L(d′,λ′).

## H06 (CBirkbeck) — answered

README line 11 already says this: "ModularCurves §4C owns the universal Legendre curve … ModularCurves §9E owns the Legendre line, its S₃ action and invariant-ring description." On main (56b9472):
- ModularCurves §4C item 1 (line 1104) constructs the Legendre problem over ℤ[1/2], with universal curve y²=x(x−1)(x−λ);
- §9E has the Legendre line Λ with its S₃ action at line 2030, and ℚ(λ)^{S₃}=ℚ(j) at line 2037.

No target here builds a family or an invariant ring.

## H07 (CBirkbeck) — answered

The pinned libraries have no Legendre model:
- Tau Ceti a91d3aaf: no file under `TauCeti/AlgebraicGeometry` mentions `freyCurve` or `Legendre`, and no declaration in `TauCeti/` is named `freyCurve` or `legendreCurve`.
- Mathlib 6b7abb3c: no file under `Mathlib/AlgebraicGeometry/EllipticCurve` mentions `freyCurve` or `legendre`.

So §§0.1, 0.8 and 0.9 duplicate nothing at the pins this roadmap is held to. The review's reading of current Tau Ceti c864af4 is that unscaled normalization needs a square root of a root difference, or an extension. That agrees with the §0.8 Check that L(2,3) is not ℚ-isomorphic to L(3). I did not read c864af4 itself for this reply.

## H08 (CBirkbeck) — answered

The line numbers refer to the line-numbered extraction of the publisher PDF named in References (Annals 191 (2020), 355–392). Extraction pages 13, 14, 16 and 17 are journal pp.367, 368, 370 and 371. I rechecked these lines this round:
- 462–464: the pointer to Koblitz p.41;
- 513: equation (17), p.367;
- 526: Lemma 6.2, p.367;
- 544: the six λ-invariants, p.368;
- 547: Lemma 6.3, p.368;
- 554: the halving test;
- 568: the Lemma 6.4 step;
- 658: the descent map, p.370;
- 663: Lemma 6.5, p.370;
- 703: the twist by 2, p.371;
- 710 and 715: the root images;
- 718: the printed order-four point.

Silverman §X.1, Prop. 1.4 and Koblitz p.41 remain marked uncertified in References (lines 649–650) and in the manifest. They are cited by locator only, which the review accepts.

## H09 (CBirkbeck) — answered

I reran `lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested` at head 2b50d7a: "Build completed successfully (8995 jobs)". The only warnings are the seven `declaration uses 'sorry'` lines, at Suggested.lean lines 34, 45, 58, 70, 79, 89 and 97. The gate and direction-check results are below.

## Build

`lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested`: Build completed successfully (8995 jobs). The only warnings are the seven `declaration uses 'sorry'` lines (Suggested.lean lines 34, 45, 58, 70, 79, 89, 97).

## Gate

No change, no commit. I ran the gate against origin/main twice, before and after refreshing it to 56b9472. Both runs gave the same line:

    gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

Direction check (`gate --depcheck … --movable`):

    depcheck: 55 roadmaps, 635 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line for this roadmap.

## Signatures

`Suggested.lean` is byte-identical to the head from which the job's signature file was elaborated. So I did not elaborate a new `#check @name` file. I compared each of the 9 elaborated types there with its README statement:
- `legendre` and `scaledLegendre` (§§0.1–0.2) are over `CommRing`.
- `exists_scaledLegendre_of_full_two_torsion` (§0.9) has Field, `DecidableEq`, 2≠0, `IsElliptic`, and a doubling kernel of cardinality 4.
- `legendre_units_of_good_reduction` (§1.2) has p≠2 and good reduction of the minimal model over ℤ_p.
- `scaledLegendre_halving_iff_squares` (§2.8) has d≠0 and λ≠0,1.
- `legendre_two_by_four_subgroup` (§3.1) has `Finite F`, 2≠0, η≠0 and η²≠1.
- `legendre_minus_one_point_count_v_two` (§3.7) has q≡5 mod 8.
- `symmetric_cubic_trace_zero` (§5.1) has q≡3 mod 4 and every a.
- `quadraticTwistOf_frobeniusTrace` (§5.2) has 2≠0, normal form and every d.

No binder is missing and none changed.

## Adversarial pass

No statement was added or changed this round. The rows below recompute the statements the review asks the consumers to import, on instances not used in earlier rounds.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 Δ, c₄ and j of L(λ) (to MordellLawrenceVenkatesh §6.4 and ArithmeticDynamics) | λ=5, −3/2, 9/4, 1/3, −7 over ℚ, computed from the full b-invariant formulas; degenerate λ=0, 1 | (Δ,c₄) = (6400,336), (225,76), (2025/16,61), (64/81,112/9), (50176,912). j = 148176/25, 438976/225, 3631696/2025, 21952/9, 740772/49, each equal to 256(λ²−λ+1)³/(λ²(1−λ)²). At λ=0 and λ=1: (Δ,c₄)=(0,16) | Holds. The degenerate parameters have Δ=0, so no j is formed | none |
| §0.5 Δ and c₄ of L(d,λ) | (d,λ) = (3,5), (−1/2,9/4), (0,5) | Δ = 4665600, 2025/1024, 0, each equal to 16d⁶λ²(1−λ)². c₄ = 3024, 61/4, 0, each equal to 16d²(λ²−λ+1) | Holds, including d=0 | none |
| §5.1 count = q+1+Σχ(f(x)) (to ComputationalNumberTheory §3.17) | Every normal form over 𝔽₃ (27 equations), 𝔽₅ (125), 𝔽₇ (343), 𝔽₁₁ (1331) and 𝔽₉ (729); 216 over 𝔽₂₅. Negative control: y²=x³+1 over 𝔽₂ | 0 failures in 2771 equations. 𝔽₂: count 3, formula 4 | Holds. Odd characteristic is needed | none |
| §5.1 symmetric cubic, q≡3 mod 4 | Every a over 𝔽₇, 𝔽₁₁, 𝔽₁₉, 𝔽₂₇. Controls: 𝔽₅, 𝔽₁₃ | Counts {8}, {12}, {20}, {28}, i.e. q+1. 𝔽₅: {2,4,6,8,10}. 𝔽₁₃: {8,10,14,18,20} | Holds. The congruence is necessary | none |
| §5.2 twist trace, using the pinned `quadraticTwistOf 0 (−d/4)` coefficients | Every (a₂,a₄,a₆,d) over 𝔽₅ (625 cases) and 𝔽₇ (2401); 2187 cases over 𝔽₉ | The twisting discriminant t²−4n equals d in every case. trace(twist) = χ(d)·trace(W) with 0 failures, d=0 and singular W included | Holds | none |
| §3.1 ℤ/2×ℤ/4 in L(η²)(F) (to ErdosProgressionPowers §2.1) | Every η≠0 with η²≠1 over 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃, 𝔽₉, 𝔽₂₅, 𝔽₂₇ | 2, 4, 8, 10, 6, 22, 24 admissible η respectively. Every one has three nonzero 2-torsion points and a point of order 4, hence ⟨Q,T′⟩≅ℤ/4×ℤ/2 | Holds for q≡1 and q≡3 mod 4, and for prime and non-prime fields | none |
| §3.7 v₂(#L(−1)(F)) = 3 for q≡5 mod 8 | 𝔽₅, 𝔽₁₃, 𝔽₂₉, 𝔽₃₇, 𝔽₅₃, 𝔽₁₂₅. Controls: 𝔽₄₁, 𝔽₁₇, 𝔽₉ | Counts 8, 8, 40, 40, 40, 104, all with v₂=3. Controls: 32, 16, 16, with v₂ = 5, 4, 4 | Holds. The congruence is necessary | none |
| §0.9 full two-torsion ⇒ C•E = L(d,λ) (to ErdosProgressionPowers §2.1) | 4000 random general models (a₁,…,a₆) over each of 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉ | Models with exactly four points killed by 2: 153, 295, 420, 433. After completing the square, every one has three distinct roots and translates to x(x−d)(x−dλ) with d≠0 and λ≠0,1 | Holds, including characteristic 3 | none |
| §0.2 square scaling (H05) | (d,λ,u) = (3,−2,5) and (−1/3,4,−2/7) over ℚ. Point map over 𝔽₁₁ at (3,9,2) and (5,4,7) | (0,75,0,−11250,0) = L(75,−2). (0,20/147,0,64/21609,0) = L(−4/147,4). All 7 and all 15 affine points land on L(u²d,λ) | Holds | none |
| §0.8 ordering scalars (H05) | Roots (−1,4,6) and (2/5,−3,7) | (−1,4,6): (d′,λ′) = (5,7/5), (7,5/7), (−5,−2/5), (2,−5/2), (−2,7/2), (−7,2/7). (2/5,−3,7): d′ = −17/5, 33/5, 17/5, 10, −10, −33/5. In all 12 cases the translate equals L(d′,λ′) | Holds | none |

## Ownership and citations

I checked ownership against open work by object, at these copies:
- ComputationalNumberTheory, ErdosProgressionPowers and ArithmeticDynamics: the given sibling checkouts, at the heads above.
- EllipticCurveModularityPartII: its sibling checkout at 46ba4f1.
- MordellLawrenceVenkatesh: the roadmap index, at 73dc3e8.

Two consumer statements agree term by term with the targets here: MordellLawrenceVenkatesh's j formula with §0.4, and Erdős's ordering scalars with §0.8. So each consumer edit is a citation. No statement was added this round, so no new ownership question arises and no notion moved down.

On main (56b9472) the citations resolve:
- EllipticCurves' Frey–Hellegouarch worked example, line 1583;
- ModularCurves §4C (line 1100) and §9E (line 2008);
- ClassicalArithmeticCompletion §1.7 (line 501), §1.8 (line 545) and §1.51 (line 1789).

The citation resolver reports no unresolved cross-roadmap citation or Lean name. No supplier later in the merge order is cited.

## Sources

No new source was cited and none was fetched. `needs-references.toml` was not created. The review contains no instruction-like text. Its suggested fixes are edits to four other roadmaps' folders, which this job does not touch.
