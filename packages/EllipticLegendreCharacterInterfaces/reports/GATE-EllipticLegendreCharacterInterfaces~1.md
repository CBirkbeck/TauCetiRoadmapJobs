# Review answer: EllipticLegendreCharacterInterfaces

One review was posted (CBirkbeck, 2026-10-25T17:07Z, head `f140b9b`). Its two findings make the
six points below. The review's "Checks found sound" section asks for nothing and needs no answer.
Repairs are in commit `3184462` on top of `f140b9b`. That commit changes
`TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md` and the docstrings of `legendre` and
`scaledLegendre` in `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean`. No
declaration type changed.

Merge order (`ORDER.txt`): this roadmap is line 105. ComputationalNumberTheory is line 154,
MordellLawrenceVenkatesh 173, EllipticCurveModularityPartII 188, ErdosProgressionPowers 263 and
ArithmeticDynamics 268. Every neighbour named in the review therefore comes after this roadmap.
This roadmap is the supplier and they are its consumers. Their reciprocal edits belong in their
own pull requests. This job may edit only this folder.

## H01 (CBirkbeck) — applied differently

The conflict is real. At MordellLawrenceVenkatesh head `73dc3e8`, §6.4 ("The Legendre family and its cyclic variant", README lines 2083–2113) plans the coefficient model `y² = x(x − 1)(x − t)` over every commutative ring, its Δ and its j. That repeats §§0.1 and 0.4 here. Because MordellLawrenceVenkatesh comes later in the merge order, the model stays here, and README line 13 now names it as a consumer: "MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers §2.1 consume them". README line 638 adds: "consumes the coefficient model of §0.1 and its discriminant and j-invariant from §0.4, and keeps the cyclic variant…".

The same defect also appears in ArithmeticDynamics (head `d7b0a19`, README lines 13 and 174). It takes the coefficient model, Δ and j from MordellLawrenceVenkatesh §6.4, so it is now listed beside MordellLawrenceVenkatesh in both places. The edits those two roadmaps need are listed under H04.

## H02 (CBirkbeck) — applied differently

The duplication is real. ComputationalNumberTheory head `37b9f6f`, §3.17 (README lines 1679–1688), states the normal-form character-sum count and trace over every odd finite field, singular models included. It gives its own proof and does not cite this roadmap. That is §5.1 here.

README line 13 used to say "ComputationalNumberTheory §3.17 uses this point-count identity; its arithmetic counting applications remain there". At that head the claim was false. It now reads "ComputationalNumberTheory §3.17 is a consumer of this identity and owns only its finite-enumeration form of the count and its computational applications". Downstream consumers (line 638) is changed the same way. The ComputationalNumberTheory edit is listed under H04.

## H03 (CBirkbeck) — applied differently

The stale contract is real. ErdosProgressionPowers head `e007747` still does the following:

- It takes the ordinary model from MordellLawrenceVenkatesh §6.4 (README lines 61–63 and 490; §2.1 at line 1037).
- It cites this roadmap as "LG.0–LG.5" with a rational normalization (line 491) and a prime-field subgroup for p≡3 mod 4 (line 496).
- It restates both general extensions inside its own §2.1 (lines 1056–1088).

Those extensions are §0.9 (every field with 2≠0) and §3.1 (every odd finite field) here.

Two README changes follow. Line 13 adds "the general-field normalization and the odd-finite-field two-by-four subgroup theorem belong to §§0.9 and 3.1". Line 638 replaces "Its §2.1 requests these interfaces and formulates general-field normalization and odd-finite-field subgroup assertions; §§0.9 and 3.1 provide those general statements here" with a section-by-section import list:

- §§0.1–0.2 (models), §0.3 (labelled parameters) and §0.9 (normalization).
- §§1.2, 1.5 (good-prime units, conductor divisibility).
- Layer 2 (descent readings, halving).
- §3.1 (subgroup) and §3.7 (exact two-part).
- §4.1 (order-four witness) and Layer 5 (trace identities).

Its Layer 2 keeps the progression-specific arguments, the progression hypotheses and the nontriviality of the odd character conductor.

## H04 (CBirkbeck) — applied differently

The README cannot record "outstanding migration" or merge conditions. Roadmaps are timeless and may not carry process narrative (repository README, "Roadmaps are timeless"). So the README states the target contracts, and the open coordination is recorded here instead. All four consumers come later in the merge order, so this roadmap can merge first.

Each consumer's pull request then needs these edits:

1. **MordellLawrenceVenkatesh §6.4.** Replace the first bullet (the coefficient model over every commutative ring) and the Δ/j bullets with an import of EllipticLegendreCharacterInterfaces §§0.1 and 0.4, and add that import to its *Needs* line and supplier contracts. Keep the cyclic variant, the abelian-by-finite family and the good-model statements.
2. **ArithmeticDynamics.** Change scope line 13 and the supplier paragraph at line 174 to take the model, Δ and j from EllipticLegendreCharacterInterfaces §§0.1 and 0.4 instead of MordellLawrenceVenkatesh §6.4.
3. **ComputationalNumberTheory §3.17.** Keep only the finite-enumeration statement, that `pointCount` is the filtered affine solution count plus one. Import the character-sum count and trace identity from EllipticLegendreCharacterInterfaces §5.1, and add it to *Needs*.
4. **ErdosProgressionPowers.** Replace the "LG.0–LG.5" labels with section citations (§§0.1–0.3, 0.9, 1.2, 1.5, Layer 2, §§3.1, 3.7, 4.1, Layer 5). Take the ordinary model from §0.1 instead of MordellLawrenceVenkatesh §6.4. Delete the §2.1 extensions of normalization to all fields and of the subgroup theorem to all odd finite fields. Drop the rational-only and prime-field-only wording of the contract at lines 488–500.

## H05 (CBirkbeck) — applied differently

Both of the reviewer's facts check out:

- Tau Ceti `8384538` defines `TauCeti.freyCurve A B = (0, B − A, 0, −(A*B), 0)` in `TauCeti/AlgebraicGeometry/EllipticCurve/FreyCurve/Basic.lean`, together with `freyCurve_Δ`, `freyCurve_c₄` and `isElliptic_freyCurve_iff_ne_zero`.
- Neither that file nor `Legendre.lean` exists at the pinned Tau Ceti `a91d3aa`; there is no "Frey" anywhere in the pinned Tau Ceti or Mathlib sources.

The supplier contracts are written against the pins, and the house rules forbid a "once the library revision is available" note. So the shared interface is taken from the roadmap level instead. EllipticCurves on main, section "Worked examples", "The Frey–Hellegouarch curve", already owns `freyCurve A B` over every commutative ring, with Δ=16A²B²(A+B)², c₄=16(A²+AB+B²) and the ellipticity criterion.

The README changes:

- **Specializations.** L(λ) and L(d,λ) are now stated as its specializations at (A,B)=(1,−λ) and (d,−dλ): scope line 7, Conventions line 17, and the API bullets at lines 77 and 105.
- **Supplier contract.** Line 49 adds a new EllipticCurves paragraph.
- **Frey route.** §§0.4–0.5 (lines 150, 166) gain the Frey route, and their *Needs* lines cite the worked example.
- **New Checks.** §0.2 line 115 checks the sign of B: the pair (2,−6) gives L(2,3), while the pair (2,6) gives roots 0,2,−6. §0.5 line 173 checks Δ=36864 and c₄=448 against 147456 and 832 for the sign-reversed pair.

The `legendre` and `scaledLegendre` docstrings now name their Frey pair. When the pin moves past `8384538`, each definition becomes a one-line specialization of `TauCeti.freyCurve`.

## H06 (CBirkbeck) — answered

The two book locators the reviewer could not check (S09 §X.1 Proposition 1.4; K84 p.41) are settled in the manifest as uncertified. The README already cites them by locator only and says so (References, lines 647–648). The BS20 lemma numbering the reviewer confirmed on arXiv 1709.01022 agrees with the published version cited here.

The Lake build the reviewer did not rerun was run for this answer at commit `3184462`: success, listed below.

## Build

`lake build TauCetiRoadmap.EllipticLegendreCharacterInterfaces.Suggested`: `Build completed successfully (8995 jobs).` The only warnings are the seven expected "declaration uses `sorry`" warnings, at lines 34, 45, 58, 70, 79, 89 and 97.

Signature check: `#check @name` for all nine declarations (`legendre`, `scaledLegendre` and the seven theorems), plus a proved coefficient example `scaledLegendre (2 : ℚ) 3 = ⟨0, -8, 0, 12, 0⟩`, was appended temporarily, elaborated in one build, and removed before the commit. Each elaborated type matches its README statement. No section `variable`s are used, so no binder was lost. No type changed in this round; only two docstrings did.

## Gate

`gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Direction check (`gate --depcheck … --movable`), complete output:

```
depcheck: 55 roadmaps, 631 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The only new cross-roadmap citation is EllipticCurves (on main, already a supplier).

`roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. That includes `freyCurve`, which resolves to the EllipticCurves README on main.

## Ownership

- **Generic Frey model.** EllipticCurves (main, worked example) owns the generic Frey model and its Δ, c₄ and ellipticity. This roadmap owns only the Legendre specializations (§§0.1–0.5).
- **Search.** A regex search (`roadmaps grep`) for the Legendre coefficient model across main and all 367 indexed open heads found ownership claims only in MordellLawrenceVenkatesh, ArithmeticDynamics and ErdosProgressionPowers, all later in the merge order and listed in H04. The other hits, in InverseGaloisAndArithmeticFundamentalGroups and ColemanIntegrationPartII, are passing mentions of the family or a Check, not targets.
- **EllipticCurvesPartII.** The board package EllipticCurvesPartII (merge order line 106) is an import index that points to this roadmap and claims nothing.
- **Other citations rechecked:**
  - ModularCurves §§4C and 9E (main).
  - ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 and its six named squareclass declarations (main).
  - EllipticCurveModularityPartII §5.1, "Native torsion and rationality predicates", which defines `FullRationalTwo` (head `46ba4f1`).
  - ArithmeticDynamics §§6.35, 6.111, 6.112 (head `d7b0a19`).

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: L(λ) is the Frey pair (1,−λ); L(d,λ) is (d,−dλ); A+B = 1−λ, d(1−λ) | λ=2; λ=0; λ=1; d=0; d=1 | (1,−2)→(0,−3,0,2,0)=L(2); (1,0)→(0,−1,0,0,0)=L(0), B=0; (1,−1)→A+B=0; (0,0)→all coefficients 0=L(0,λ); (1,−λ)=L(1,λ)=L(λ) | holds, degenerate cases included | added |
| §0.1 bullet: L(λ)=Frey(1,−λ), B−A=−(1+λ), −AB=λ | λ=−1 over ℚ; zero ring | (1,1)→(0,0,0,−1,0), y²=x³−x as in the §0.1 Check; zero ring: both sides 0 | holds | added |
| §0.2 bullet: L(d,λ)=Frey(d,−dλ) over every commutative ring | d=2,λ=3 over ℚ (also elaborated in Lean); d=0 | (2,−6)→(0,−8,0,12,0)=L(2,3); proved Lean example `scaledLegendre 2 3 = ⟨0,-8,0,12,0⟩` elaborated; d=0→zero tuple | holds | added |
| §0.2 Check: sign of B | (2,−6) vs (2,6) | (2,6)→(0,4,0,−12,0), x³+4x²−12x=x(x−2)(x+6), roots 0,2,−6 ≠ 0,2,6 | excludes the wrong sign | added |
| §0.4 Frey route: Δ=16λ²(1−λ)², c₄=16(λ²−λ+1); elliptic iff 1, −λ, 1−λ ≠ 0 | λ=2; λ=1/2; λ=−1; 𝔽₃ λ=2; char 2; λ=0,1 | 16·1·4·1=64, c₄=16·3=48; 16·1·¼·¼=1, c₄=16·¾=12; Δ=64, c₄=48, j=48³/64=1728; Δ=64≡1, c₄=48≡0, j=0; 16=0 so Δ=0; B=0 or A+B=0 so Δ=0 | agrees with every §0.1/§0.4 Check | added route |
| §0.5 Frey route: Δ=16d⁶λ²(1−λ)², c₄=16d²(λ²−λ+1); elliptic iff d, dλ, d(1−λ) ≠ 0 | d=2,λ=1/2; d=2,λ=3; d=0 | (2,−1): 16·4·1·1=64, c₄=16·3=48; (2,−6): 36864, 448; d=0: 0, 0, not elliptic | agrees with the §0.5 Checks | added route |
| §0.5 Check: sign-reversed pair (2,6) | direct b-invariants of a₂=4, a₄=−12 | b₂=16, b₄=−24, b₈=−144; Δ=−256·(−144)−8·(−13824)=147456; c₄=256+576=832; Frey formula 16·4·36·64=147456, 16·52=832 | the first draft wrongly said "same Δ" ((A+B)² is 64, not 16); corrected before commit | added, corrected |
| Lean docstrings of `legendre`, `scaledLegendre` | type unchanged (#check) | `{R} [CommRing R] → R → WeierstrassCurve R`; `… → R → R → WeierstrassCurve R` | no binder change | docstring only |
| Scope line 13 and Downstream line 638 (consumer contracts) | each consumer section read at its head | MordellLawrenceVenkatesh §6.4 README lines 2083–2113; ArithmeticDynamics lines 13, 174, 9096, 10362, 10391; ComputationalNumberTheory lines 1679–1688; ErdosProgressionPowers lines 55–68, 483–500, 1034–1085; EllipticCurveModularityPartII §5.1 line 568 | every section named exists with the stated content; the import direction matches the merge order | rewritten |

## Sources

No new source was cited and nothing was fetched through the sources service, so there is no `needs-references.toml` request. The Frey identities come from the EllipticCurves roadmap on main, and the arithmetic in the table above was recomputed by hand.

Pinned Tau Ceti `a91d3aa` was checked locally. Tau Ceti `8384538` was read on GitHub only to verify the reviewer's description, and neither the README nor the Lean file names any of its declarations. Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show`, and with the sibling checkouts for ComputationalNumberTheory, ErdosProgressionPowers and ArithmeticDynamics.
