# Human-review response for ArithmeticKTheory

One comment is answered: CBirkbeck's review of `a9ba426` (2026-11-07T18:28:35Z), which has four numbered findings, F01–F04. F04 names two separate wrong pointers, so this report numbers five points:

| Point | Review finding |
| --- | --- |
| H01 | F01 |
| H02 | F02 |
| H03 | F03 |
| H04 | F04, the K-book locator |
| H05 | F04, the library attribution |

**What `97c9c8c` already did.** Commit `97c9c8c`, already on the branch, applied all five repairs. I checked each one against the cited roadmap heads, the pins and the sources.

**What this job changed.** Searching for the same defects elsewhere found three more, fixed in local commit `e627510` (not pushed):

- **A wrong Tau Ceti name.** README line 233 named a Tau Ceti declaration that does not exist under that name.
- **An imprecise library claim.** The `Suggested.lean` docstring statement added by `97c9c8c` described the pinned libraries inaccurately.
- **A misprinted source locator.** A Ravenel locator in a §7.5 Check pointed at a theorem whose printed formula is misprinted.

**Truncated comment.** The quoted comment is cut off inside its "Sources opened" table, after the row for 6.12. Anything after that point, including the "Source issues" list it refers to, could not be read and is not answered here. All four numbered findings come before the cut.

## H01 (CBirkbeck) — applied

**Old text.** The scope sentence at README 71–76 said "Section 7.5 owns the vanishing of the fourth stable stem, together with … η⁴=0". The `Suggested.lean` theorem `subsingleton_homotopyGroup_sphere_add_four` stated the same thing.

**New text.** README 71–76 now says "Stable stems belong to HomotopySpheres: §3A.3 constructs the stable stem …, and §9.2 proves π₄⁽S⁾=0 …". §7.5 now owns only sphereAdamsNovikovLowE2 and the 2-primary d₃ onto E₃^(4,8).

**What was deleted.**
- From §7.5: stableStemFour_eq_zero, eta_pow_four_eq_zero, the classical/unstable transfer paragraph, the n≥6 and η³=12ν Checks, and the basic-law clause.
- From `Suggested.lean`: the Lean theorem, `universe u`, and "the fourth stable stem" in the Layer 7 heading.

**What replaced it.**
- A "From TauCetiRoadmap.HomotopySpheres" contract (README 518–526) cites §3A.3, §9.2 and `sphere_homotopyGroup_fourthStem`.
- The K₄(ℤ) paragraph (README 4054–4057) now uses "π₄S=0 (HomotopySpheres §9.2, carried to the sphere spectrum by GeneralizedCohomology G2.5)".
- The *Needs:* line (4108–4120) and Layer 7 Dependencies (4242–4246) follow.

**Evidence that the new citations resolve.**
- **HomotopySpheres** (head of its pull request, merge order line 72, before this roadmap at line 133). Its README 916–923 is §3A.3: suspension homomorphisms and the stable stem as a sequential colimit in `AddCommGrpCat`. Its README 2709–2716 is §9.2, "Prove π₄⁽S⁾=0 … `sphere_homotopyGroup_fourthStem` … n≥6". Its `Suggested.lean` line 177 declares that theorem with `(x : Sphere n)`. It cites no ArithmeticKTheory target, so there is no cycle.
- **GeneralizedCohomology** (main). README 393 identifies π_n S, n≥0, with "the supplier's stabilized sphere colimit", and its line 37 names HomotopySpheres Stage 3A as that supplier. So README 468–470 here is accurate.

**The new 2-primary d₃ argument** (README 4001–4012) uses only:
- π₄S=0;
- GeneralizedCohomology G3 item 9: π_n E_(p)=π_n E⊗ℤ_(p) (its README 884–886);
- BordismFormalGroups F4's strong convergence to X_(p) for bounded-below X (its README 450);
- this roadmap's sphereAdamsNovikovLowE2.

The bidegree computations are in the adversarial-pass table below.

**Library claim in the docstring (fixed here).** `97c9c8c` wrote "the pins have comodules over bialgebras only". That misstates the pins:
- Tau Ceti has `TauCeti.LazardRing.coproduct`, `conjugation` and `rightUnit`, the Lazard Hopf algebroid (L, LB) (`TauCeti/RingTheory/FormalGroup/CoordinateChange/HopfAlgebroid.lean:171, 293`, `Lazard.lean:130`).
- Its `Comodule` class is over `[Coalgebra R C]` with `[CommSemiring R]` (`TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:50`), not only over bialgebras.
- It has no comodules over a Hopf algebroid, no cobar complex and no p-typical BP_*BP: there are no p-typical, Araki or BP constructions in the source tree.

The docstring (`Suggested.lean` 31–36) now says exactly that.

**Stale sentence in another roadmap (not editable here).** K3BlochGroups README line 1358, at its head, says the Moore-spectrum divisibility "that ArithmeticKTheory §7.5 proves on its way to η⁴=0". That argument has left §7.5, so the sentence should be dropped there. K3BlochGroups says it does not use that divisibility, so nothing breaks. Its other two citations of §7.5 (line 111, sphereAdamsNovikovLowE2, and line 1367, the d₃ onto E₃^(4,8)) still resolve.

## H02 (CBirkbeck) — applied

**Change.** The paragraph citing GeometryOfNumbersAndQuadraticArithmetic §6.1a for `stableStem`, `stableStem.ι` and `stableStem.tailIso` (old README 411–414) is deleted, along with every other mention of those names. The stable-stem carrier is now cited only as HomotopySpheres §3A.3 (README 71–72 and 518–520). A grep of the README for `stableStem`, `tailIso`, `sphereSpectrumHomotopyIso`, `TopCat.sphere` and `HomotopyGroup.Pi` returns nothing.

**Evidence.**
- At its head, GeometryOfNumbersAndQuadraticArithmetic README line 43 lists those four names as moved to HomotopySpheres §3A.3. Its line 2267 keeps only `sphereSpectrumHomotopyIso` in §6.1a.
- The remaining citation of §6.1a here (README 401, coherent C₂ actions) refers to the spectra paragraph that is still there (its line 2257).
- `roadmaps resolve` on the README now reports no cross-roadmap citation and no Lean name found nowhere.

## H03 (CBirkbeck) — applied

**Change.** The Ravenel entry (README 5195–5206) now cites the author's posted copy by its own page numbers. Old pages → new pages:

| Item | Old | New |
| --- | --- | --- |
| A2.1.27(d)–(e) | 348–349 | 350–351 |
| 4.3.14–4.3.15 | 121 | 123 |
| 4.4.1–4.4.2 | 128 | 130 |
| 4.4.37 | 141 | 143 |
| Fig. 4.4.45 | 142 | 144 |
| 4.4.47 | 143 | 145 |
| A2.2.1 | — | 353 |
| A2.2.2 | — | 354 |
| A2.2.6 | — | 356 |

Hatcher is cited nowhere any more, and its References entry is gone.

**Page check.** I fetched the posted copy through the sources service as `ravenel` (author-page, `https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel.pdf`). Every page matches:

| Item | Cache line | Printed page |
| --- | --- | --- |
| A2.1.27 | ravenel line 18302 | 350, continuing on 351 at line 18314 |
| 4.3.14 | ravenel line 6284 | 123 |
| 4.3.15 | ravenel line 6295 | 123 |
| 4.4.1 | ravenel line 6667 | 130 |
| 4.4.2 | ravenel line 6677 | 130 |
| 4.4.37 | ravenel line 7270 | 143 |
| Fig. 4.4.45 | ravenel line 7320 | 144 |
| 4.4.47 | ravenel line 7390 | 145 |
| A2.2.1 | ravenel line 18519 | 353 |
| A2.2.2 | ravenel line 18530 | 354 |
| A2.2.6 | ravenel line 18662 | 356 |

The remark that the formula holds only modulo p for Hazewinkel's generators is at ravenel line 18659–18660 (p. 356), with A2.2.3 at ravenel line 18539–18541.

**Misprinted locator (fixed here).** The Theorem 4.4.47 statement prints d₃(ᾱ_(4i+3))=ᾱ₁³ᾱ_(4i+3) (ravenel line 7391), which has the wrong internal degree:

- d₃ maps Ext^(1,8i+6) to Ext^(4,8i+8);
- ᾱ₁³ᾱ_(4i+3) lies in Ext^(4,8i+12);
- the paragraph before it (ravenel line 7382–7385) has the correct ᾱ₁³ᾱ_(4i+1).

The §7.5 Check (README 4025–4030) now cites that paragraph and names the misprint.

**Still to do: the manifest entry.** `sources.toml` still has no `ravenel` entry, and this job may not edit it. The worker should record:

- `id = "ravenel"`
- Douglas C. Ravenel, *Complex Cobordism and Stable Homotopy Groups of Spheres*, second edition, 2004
- `locator_scheme = "theorem"`, `locator = "A2.1.27, 4.3.14–4.3.15, 4.4.1–4.4.2, 4.4.37, Fig. 4.4.45, 4.4.47, A2.2.1–A2.2.6"`
- `cited_for = ["7.5"]`, `licence_class = "author-page"`
- a `version_note`: page numbers are those of the posted copy, two higher than the AMS Chelsea printing.

## H04 (CBirkbeck) — applied

**Change.** The §8.2 locator (README 4310–4312) changed from "VI.1.1 and VI.1.3, pp. 464–465" to "Example VI.2.1.2 and the Lee–Szczarba paragraph after it, p. 470".

**Evidence.**
- **New locator.** kbook line 28417–28435 is on PDF page 478, printed p. 470. It gives w₂(ℚ)=24 and Lee–Szczarba's K₃(ℤ)≅K₃(ℚ)≅ℤ/48, the value §8.2 states (48=2·w₂(ℚ), consistent with VI.9.5 at n=3).
- **Old locator.** VI.1.1 (kbook line 28040, p. 463) and VI.1.3 (kbook line 28097, p. 464) are rigidity statements.

**Other VI.1 citations.** The other VI.1.x citations in the README (lines 1656–1658, 1885, 1970, 2008, 2180, 2223) cite rigidity and torsion facts. Their pages agree with the cache:

| Item | kbook line | Printed page |
| --- | --- | --- |
| VI.1.5 | 28208 | 466 |
| VI.1.6 | 28266 | 467 |
| VI.1.7 and VI.1.7.1 | 28316–28322 | 468 |
| VI.2.1 | 28399 | 469 |

## H05 (CBirkbeck) — applied

**Change.** The §2.2 *Needs:* line (README 864–867) changed from "Tau Ceti's `Set.unitEquivUnitsInteger`, `Set.unitValuation`, …" to "Tau Ceti's `Set.unitValuation`, `Set.unitValuation_ker` and localized class maps; Mathlib `Set.unitEquivUnitsInteger` and …". `Set.unitEquivUnitsInteger` is Mathlib `RingTheory/DedekindDomain/SInteger.lean:124`.

**Other attributions checked.** I checked every backticked library name in the README against both pins (98 names). One more was wrong:
- README line 233 named "`CategoryTheory.ExactStructure`" as Tau Ceti's. The declaration is `TauCeti.ExactStructure`: `structure ExactStructure` at `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`, inside `namespace TauCeti` (line 63).
- No Mathlib file at the pin mentions `ExactStructure`.
- Line 233 now reads "`TauCeti.ExactStructure` (in `TauCeti.CategoryTheory.Exact.ExactStructure`)".

**The §7.3 attributions** (README 3703–3704 and 3788–3789) are also correct:
- `integerClassGroupEquiv` is Tau Ceti `RingTheory/DedekindDomain/SInteger/ClassGroup.lean:145`.
- `ClassGroup.equivPic` is Mathlib `RingTheory/PicardGroup.lean:876`.
- `ClassGroup.relNorm` is Tau Ceti `RingTheory/ClassGroup/RelNorm.lean:130`; Mathlib has only `Ideal.relNorm`.

## Build

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested`: `Build completed successfully (18239 jobs).` There are three `declaration uses 'sorry'` warnings, at lines 59, 65 and 78. `Suggested.lean` is unchanged since this build; the last amend touched only README.md.

## Gate

After commit `e627510`:

`gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Before the commit, the run failed only on `dirty=2`, the two edited files.

Depcheck (`--movable`):

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

## Signatures

- **Declarations unchanged.** Neither `97c9c8c` nor this job changed a remaining declaration. `97c9c8c` deleted one theorem; this job changed only the module docstring.
- **Types compared.** The four elaborated types in the worker's `signatures.md` come from its `#check @name` file at this head, and I compared each with its README statement:
  - `sUnitSubmonoid`, `integer_isLocalization_iff` and `integer_isLocalization_of_torsion_classGroup` against §1.1 (README 594–613). Each carries Dedekind R, field F with `IsFractionRing R F`, and arbitrary S.
  - `regularPrime_dividedBernoulli_num` against §7.2 (README 3646–3648): `p.Prime`, `Odd p`, ¬p ∣ h(ℚ(ζ_p)), k≥1.
- **No dropped binders.** None was found.
- **No separate `#check` file.** I did not elaborate one myself, because the brief allows only the module build as a Lean command.

## Adversarial pass on the statements changed in `97c9c8c` and here

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.5 stem-four E₂ at odd p | p=3 (q=4), p=5 (q=8); s=0,1 | t−s=4 and t≥qs force s(q−1)≤4. At p=3: s=1, t=5, and 4∤5. At p=5 no s≥1. s=0: 0<4<2(p²−1)=16 or 48 | 0 at every odd p | none |
| §7.5 stem-four E₂ at p=2 | s∈{0,2,4} (t=s+4 even, t≥2s) | (0,4): 0<4<6, so zero line. (2,6): cocycles ⟨e₁+e₃, e₂+e₃⟩, d[t₂]=e₁−e₂, d[t₁³]=−3(e₂+e₃), so 0. (4,8): C^(5,8)=0 and coboundaries ±2·[t₁\|t₁\|t₁\|t₁], so ℤ/2 | ℤ/2·α₁⁴ | none |
| §7.5 d₃ onto E₃^(4,8) | outgoing r=2,3,4; incoming r=2,3,4,5 | Out: (6,9) has odd t; (7,10) and (8,11) have t<2s. In: (2,7) and (0,5) have odd t; (−1,4) has s<0; (1,6) is allowed. E_∞^(4,8)=E₃^(4,8)/d₃E₃^(1,6)=0 | onto | none |
| d₃ grading (negative control) | the wrong convention (s,t)→(s+r,t+r+1) | (1,6)→(4,10) is stem 6, not stem 4; the stated (4−r,9−r) source is the stem-lowering convention | stated convention correct | none |
| π₄(S_(2))=π₄S⊗ℤ_(2) (G3 item 9) | stems 3 and 4 | π₃: ℤ/24⊗ℤ_(2)=ℤ/8, ⊗ℤ_(3)=ℤ/3. π₄: 0⊗ℤ_(2)=0 | consistent | none |
| §7.5 Check, Ravenel 4.4.47 | i=0 | d₃: Ext^(1,6)→Ext^(4,8). ᾱ₁³ᾱ₁ ∈ Ext^(4,8) ✓; the printed ᾱ₁³ᾱ₃ ∈ Ext^(4,12) ✗ | source misprint | locator now cites the paragraph before 4.4.47 |
| §7.5 Check, Araki right unit | p=2,3 | ℓ₁=v₁/(p−p^p): v₁−2t₁ at p=2, v₁−24t₁ at p=3. Hazewinkel ℓ₁=v₁/p: v₁+pt₁. v₂(−2)=v₂(2)=1 | groups unchanged | none |
| K₄(ℤ)⊗ℤ[1/2]=0 | cofiber C of S[1/2]→K(ℤ)[1/2] | H_i(C)=0 for i≤4, since H_0 matches, H_(1..4)(K)=0 and H_(≥1)(S;ℤ[1/2])=0. So π₄K is a quotient of π₄S[1/2]=0. Control: even if π₄S were ℤ/2, π₄S[1/2]=0 | holds; the 2-part of π₄S is not needed | none |
| HomotopySpheres native form | n=5,6 | Freudenthal is an isomorphism iff n+4≤2n−2 iff n≥6. π₉(S⁵)=ℤ/2≠0 | "n≥6" is sharp | none |
| §8.2 K₃(ℤ) locator | VI.2.1.2 against VI.9.5 at n=3 | w₂(ℚ)=24; 2·24=48; kbook p. 470 states ℤ/48 | agrees | none |
| §2.2 `Set.unitEquivUnitsInteger` | ℚ with S=∅ | S.unit=ℚ^× elements of valuation 1 everywhere, {±1}=ℤ^× | agrees | none |
| §7.3 adapter | ℓ=3, 37 | ℓ=3: Cl(ℤ[ζ₃])=0, so A/3=Pic/3=0. ℓ=37: Cl=ℤ/37 and (1−ζ) is principal, so the quotient is by the trivial subgroup: A/37=ℤ/37=Pic(ℤ[ζ₃₇,1/37])/37 | agrees | none |
| README 233 exact-structure name | the pin | `TauCeti.ExactStructure` exists; there is no `CategoryTheory.ExactStructure` in either pin | wrong name | renamed |
| `Suggested.lean` docstring | the pins | Tau Ceti: Lazard (L, LB) structure maps, `Comodule` over `Coalgebra R C`. No Hopf-algebroid comodules, cobar complex or BP_*BP in Mathlib or Tau Ceti | old wording inaccurate | reworded |

## Ownership and citations

- **π₄ˢ and the stable stem.** HomotopySpheres is the owner (§3A.3, §9.2), at merge order line 72.
- **sphereAdamsNovikovLowE2 and the d₃.** This roadmap is the owner. A search of main and the open heads (`roadmaps grep`) finds no other computation of these E₂ groups:
  - BordismFormalGroups F3–F4 (main) supply BP_*BP, the cobar complex and the spectral sequence only.
  - EllipticCohomology (main, README 954–957) constructs p=3 representatives α₁∈E₂^(1,4) and β₁∈E₂^(2,12) for its own calculation. These are different groups at a different prime.
  - K3BlochGroups consumes this roadmap's target.
- **No name collisions.** No declaration of `Suggested.lean` collides with another roadmap's name.
- **Citation resolver.** `roadmaps resolve` reports no cross-roadmap citation found nowhere and no Lean name found nowhere.
- **The one `citations.md` lead.** `VanishingCycles.etaleTateTwists` at README 296 is EtaleCohomologyFoundations F.0.3's name on main (its README 233).
- **Overlaps.** None reported. No open pull request changes this roadmap or drops an id it cites.
- **Ids this pull request drops.** It drops no cited id: K3BlochGroups cites §7.5 and sphereAdamsNovikovLowE2, which remain.

## Sources

- **ravenel.** Fetched as above (author-page). Not yet in the manifest; see H03 for the entry to record.
- **kbook.** Read in the cache, at the lines quoted in H04.
- **Missing texts.** Every text this round needed was readable, so `needs-references.toml` was not created.

## Suspicious text

None in the review text.
