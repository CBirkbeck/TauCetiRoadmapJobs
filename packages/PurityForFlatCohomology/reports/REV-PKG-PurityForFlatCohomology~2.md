<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6409920390 -->
Review (claude) of 84e8f65

Verdict: accepted
Conditional on the announced gaps: `prismatic-dieudonne-perfectoid`, `complete-intersection-presentations`, `flat-local-complete-intersection`, `ci-defect-additivity`, `regular-tower-tilt`

1. **F01** (P3) §1.1 points to the wrong Check for the non-Noetherian exception

   Location: `packages/PurityForFlatCohomology/README.md` line 579, "In the API and Checks below `R` is
   Noetherian, except in the last Check."

   Claim: the last Check of §1.1 is the non-Noetherian one.

   Witness: the Checks of §1.1 are lines 608–621; the valuation-ring Check is the fifth (lines 615–619) and
   the last (lines 620–621, "A Cohen presentation needs `B` regular: `k⟦x, y⟧/(xy) → …`") is about a
   Noetherian ring.

   Repair: either move the valuation-ring Check to the end of the list, or write "except in the fifth
   Check (the valuation ring)". Tested: with the Check moved last, the sentence is true and nothing else
   refers to the order.

2. **F02** (P3) a private extraction line number used as a locator in a target

   Location: README line 904, "as in [CS24] §2.3.3, footnote 13 (CS24 line 997), and factor `B` through it."

   Claim: "CS24 line 997" locates the footnote for a reader.

   Witness: the line number is that of the worker's cached text extraction (where line 997 is indeed
   footnote 13); a reader of the roadmap has the paper, whose locator is "footnote 13, p. 24". The house
   style wants theorem, section and page numbers. (The five "line N" annotations in `## Source corrections`,
   lines 2333–2338, were accepted in round 1; the fix worker may harmonise them in the same way, but this
   finding is only about the new occurrence inside a target.)

   Repair: replace "(CS24 line 997)" by "(p. 24)", giving "as in [CS24] §2.3.3, footnote 13, p. 24".

3. **F03** (P3) the ownership paragraph credits DeformationAndDerivedPatchingAlgebra with an import it does not make

   Location: README lines 124–127 ("The virtual dimension and complete intersections (§1.1), the
   counterexamples of §1.3, factoriality … (§§7.4–7.6): imported by DeformationAndDerivedPatchingAlgebra")
   and lines 2307–2309 (the same list under `## Downstream consumers`).

   Claim: DeformationAndDerivedPatchingAlgebra plans, hence will import, the counterexamples of §1.3
   (Cohen–Macaulay non-complete-intersections with `depth > vdim`; Kohn's three-generated ideals of maximal
   projective dimension with `depth 0`).

   Witness: DeformationAndDerivedPatchingAlgebra at head `a3b5dea`: grep for `Kohn`, `Burch`, `three
   elements`, `projective dimension`, `étale depth`, `virtual dim` finds nothing; its `depth` hits (lines 13,
   43, 78) are the SchemeAndStackFoundations §0.17 supply and junk-value conventions. Its §3.4 (line 628) and
   §6.9 (line 1337) do plan the objects of §1.1 and §7.6, so the rest of the clause stands.

   Repair: delete "the counterexamples of §1.3," from line 124–125 and "the counterexamples of §1.3," from
   line 2308. Tested: no `*Needs:*` line or other sentence depends on it; §1.3 remains owned here by the
   Scope list (line 50 onward) with no change.

Reviewed at the head of pull request 2153 of the board repository, `84e8f65` (the fable-rev203 checkout
was at that head; `gh pr view` reports the same `headRefOid`). Files read in full:
`packages/PurityForFlatCohomology/README.md` (2404 lines), `Suggested.lean` (157 lines), `sources.toml`
(32 entries), `metadata.toml`, `design/plan.json` (key `gaps`), the round-1 review and the round-2 repair
report `reports/FIX-PKG-PurityForFlatCohomology~2.md`, and the diff `abded8a..84e8f65` of the package.

## Round-1 findings, one by one

- **F01 (P2) — repaired as specified.** The "Downstream boundary" paragraph is replaced by
  "**Owned here and imported by later roadmaps**" (README lines 111–129), one clause per object (Layer 2
  §§2.1–2.4; Layer 3 §§3.1–3.5; §§1.4–1.5; §1.1, §1.3, §§7.4–7.6; §7.11), each naming the later roadmap
  and the statement it plans; `## Downstream consumers` (lines 2296–2309) now says "import". No `*Needs:*`
  line changed, and the dependency check is unchanged in direction (below). What the downstream roadmaps
  say at their heads, for the maintainer (ownership moves are the maintainer's decision; this is a record,
  not a finding):
  - PrismaticCohomologyPartIII (pull request 1070, head `d797991`) §6.0, its README lines 111–134: still
    constructs `Prismatic.FlatCohomology.perfectDieudonneComparison`, `pContinuity`, `excision` and
    animated flat cohomology; no occurrence of `PurityForFlatCohomology` (its only "Purity" strings are the
    [CS] bibliography entry and "almost purity").
  - DeformationAndDerivedPatchingAlgebra (pull request 1034, head `a3b5dea`): §3.4 (line 628) defines
    "absolute local complete intersection" (completion a quotient of a regular local ring by a
    regular-sequence ideal, the object of §1.1 here) and §6.9 (line 1337) states `localCI_parafactorial`
    "prove the CI theorem here"; no occurrence of `PurityForFlatCohomology`.
  - SchemeAndStackFoundationsPartII (board design `packages/SchemeAndStackFoundationsPartII/design/README.md`):
    lines 7–9 and 62 import the perfect-base classification, `pContinuity` and `excision` from
    PrismaticCohomologyPartIII §6.0 (gaps `animated-flat-cohomology`, `cohomology-deformation`,
    `perfection-covers` against that roadmap); line 11 plans the ample-line-bundle Brauer comparison in its
    Layer 1. It has no torus, multiplicative-type or residue target (grep for tori/torus/multiplicative
    type/residue: only "derived residue condition" hits), so the repair's omission of the round-1 list's
    §§7.15, 8.2, 8.13 entries is correct.
  - EtaleDualityAndPerverseSheavesPartII (board design): line 1099 plans EQ.7
    `local-lefschetz-hyperplane-theorem`, and lines 17, 1112, 1250 say this roadmap *consumes* EQ.7.
  So at their heads none of the four imports from here; the package states the intended end state, as the
  round-1 repair asked. One clause of the paragraph has no counterpart in the downstream roadmap even as a
  plan: see R03 below.
- **F02 (P3) — repaired.** §2.3 `*Needs:*` (lines 893–894) and the API bullet (lines 897–906) now make
  stability of pro-ppf maps under base change and composition a target here, with its own argument, and
  cite PerfectoidQuotientsPartII §§Q7.1, Q7.3 for the ind-fppf (faithfully flat) case only; the same change
  in §3.4 `*Needs:*` (lines 1039–1040), the Layer 2 and 3 Dependencies (lines 946, 1094) and the supplier
  contract (lines 322–324). Resolved at the supplier: `packages/PerfectoidQuotientsPartII/design/README.md`
  §Q7.1 (line 359, `IsIndFppf` = filtered colimit of *faithfully* flat finitely presented algebras; line 371
  the characterisation "faithfully flat and a filtered colimit of flat finitely presented algebras", which
  is exactly "pro-fppf = faithfully flat pro-ppf" of §2.3) and §Q7.3 (line 441: composition, base change,
  nonempty finite products, filtered colimits), as the contract now says. The argument added for
  composition is CS24 footnote 13 (CS24 line 997) without faithful flatness; checked below (adversarial
  table, row §2.3). One style point on the new text: R02.
- **F03 (P3) — repaired** (the first of the two offered forms, no Lean type change). Scope line 53–54
  "predicate on local rings (used only for Noetherian ones)"; Convention 2 (lines 137–143) restricts
  Cohen's theorem and every statement to Noetherian `R`; §1.1 (lines 576–579) names `sInf ∅ = 0`; a new
  negative-control Check (lines 615–619) with the rank-one valuation ring, `𝔪 = 𝔪²`; docstrings of
  `IsCompleteIntersection` and `virtualDimension` (`Suggested.lean` lines 85–87, 96–97). The `#check` audit
  (below) shows all nine types unchanged. At the pin, `Mathlib/Data/Int/ConditionallyCompleteOrder.lean`
  lines 36–39 give `sInf s = … else 0` when `s` is empty or unbounded, so the README's junk value is the
  pinned one. The sentence "except in the last Check" misplaces the Check: R01.
- **F04 (P3) — repaired.** §7.1 third Check (lines 1594–1601): `c ≥ 1`, `d = c + 1`, `max(d − 1, 1) = c`,
  bijective for `i < c`, injective on `H^c`; the `c = 2` reading; the sharpness witness at `c = 1`
  (recomputed in the table).
- **F05 (P3) — settled as not actionable, reason correct.** The round-1 repair itself asked for nothing
  in the package files ("None in the package files beyond R01"); `design/plan.json` `gaps` holds the five
  entries whose slugs equal the five `What <Supplier> must provide (gap:…)` contracts of the README (lines
  280, 284, 288, 326, 345); re-adding the design's `SF-PII-*`, `EDP-PII-*`, `BR-RESIDUE-*` entries would
  name roadmaps later in the merge order (lines 119, 198 against 66). Not re-raised.
- **F06 (P3) — repaired differently, correctly.** ArithmeticGaloisDuality (pull request 858, head
  `09ad340`, merge order line 48) §R02.2.4 at its lines 1444–1480 states both the finite-coefficient
  Laurent-field sequences (`k` perfect, `gcd(m, char k) = 1`, residue normalised by the Kummer class of
  `t`) and the Witt sequence `0 → Br(k) → Br(K) → H¹(k, ℚ/ℤ) → 0` for every complete discretely valued `K`
  with perfect residue field, "proved separately from perfectness of the residue field". The package cites
  it in §8.15 (lines 2214–2222) for exactness only, in the scope list (105–106), the build diagram (39), a
  new contract (362–368), the Layer 8 Dependencies (2294), and pins the sign by a new §8.15 Check
  (2229–2235) instead of asserting that the cup product and the crossed product agree in the supplier's
  normalisation. That is the right choice: the supplier's Brauer residue is "valuation, then
  `H²(G, ℤ) = H¹(G, ℚ/ℤ)`" (its proof sketch, line 1470) with the sign of that identification unstated, so
  only the kernel is supplier-independent, which is all exactness needs. Values recomputed in the table.

## Verified sound

**Checkout, pins, policy.** Head `84e8f65` = pull request 2153 head. Mathlib pin
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
(`lake-manifest.json` and the two package checkouts' `HEAD`), equal to the README's contracts (lines 176,
211). Greps over the README: no LaTeX delimiters, no "optional/deferred/for later", no process words
("so far", "to be checked", "checkpoint", "handoff", "packet", "round", "current", "removed"), no
pull-request numbers; `Suggested.lean`: no `lemma`, `set_option`, `#print`, `#eval`, `#synth`; imports
`import Mathlib` and `import TauCeti.AlgebraicGeometry.LineBundle.Class` only (olean present at the pin).
`sources.toml`: 32 entries, 21 `certified`, 11 `uncertified` (exactly the settled ones of the brief),
none flagged unverified; no local path. No `needs-references.toml` exists and none was needed.

**Elaboration.** `lake env lean` on `packages/PurityForFlatCohomology/Suggested.lean` from the content
checkout: exit 0 in 5.1 s, output exactly four `declaration uses 'sorry'` warnings at lines 116, 127,
137, 149, nothing else.

**`#check` audit** (scratch copy with `#check @name` for all nine declarations, elaborated once): the
elaborated types agree with the round-1 audit and with README §§0.1, 1.1, 1.8, 7.7:
`puncturedSpectrum : (R : Type u) → [CommRing R] → (Spec (.of R)).Opens`;
`CohenPresentation : (R : Type u) → [CommRing R] → [IsLocalRing R] → Type (u+1)`;
`IsCompleteIntersection : … → Prop`; `virtualDimension : … → ℤ`;
`finiteEtalePullback : {X Y : Scheme} → (Y ⟶ X) → ((@IsFinite ⊓ @Etale).Over ⊤ X ⥤ (@IsFinite ⊓ @Etale).Over ⊤ Y)`;
`zariskiNagata_full_faithful_connected : ∀ R [CommRing R] [IsLocalRing R] [IsNoetherianRing R], 2 ≤ virtualDimension R → Full ∧ Faithful ∧ ConnectedSpace (puncturedSpectrum R)`;
`zariskiNagata_isEquivalence : … 3 ≤ virtualDimension R → (finiteEtalePullback (puncturedSpectrum R).ι).IsEquivalence`;
`localPicard_torsion_eq_one : … IsCompleteIntersection R → 3 ≤ ringKrullDim R → ∀ x : LineBundleClass (puncturedSpectrum R), IsOfFinOrder x → x = 1`;
`localPicard_subsingleton : … (IsCompleteIntersection R ∧ 4 ≤ ringKrullDim R) ∨ IsRegularLocalRing R → Subsingleton (LineBundleClass (puncturedSpectrum R))`.
The file has no `variable` block, so no binder can be lost; every theorem carries `[IsNoetherianRing R]`
explicitly, the three definitions do not (deliberate, README lines 576–579). Also checked at the pin:
`CategoryTheory.Sheaf.cohomologyPresheaf` requires `[HasSheafify J AddCommGrpCat]` in the site's
morphism universe, and the only `HasSheafify` instances under `Mathlib/AlgebraicGeometry/` are for
`AffineEtale.topology` and `smallEtaleTopology` (`Sites/AffineEtale.lean` lines 105, 112), none for
`Scheme.fppfTopology`; `PreGaloisCategory` occurs in no file outside `Mathlib/CategoryTheory/Galois/`;
`IsAzumaya` (`Mathlib/Algebra/Azumaya/Defs.lean` line 60) is over a ring, no Brauer group of a scheme:
the module docstring's "not statable" claims hold.

**Padding probe.** Each of the four sorried theorems replaced by `first | simp | rfl | infer_instance |
exact?` on a scratch copy: all four fail (`exact?` could not close the goal, lines 121, 130, 142, 153 of
the copy). No declaration restates a definition, mirrors a Check or computes a value; the five
definitions are exactly those the four headlines need, none sorry'd. Headline list from the README (lines
42–46 and the docstring): the two statable pairs are stated; the eleven unstatable headlines are each
named in the module docstring with the missing carrier.

**Dependency check** (`gate --depcheck … --name PurityForFlatCohomology --order … --movable`):

    depcheck: 56 roadmaps, 650 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line (one edge more than round 1: ArithmeticGaloisDuality, merge-order line
48 < 66). Merge-order positions read: DerivedDeRhamCohomology 20, ArithmeticGaloisDuality 48,
PerfectoidQuotientsPartII 64, PrismaticCohomologyPartII 65, this roadmap 66, PrismaticCohomologyPartIII 67,
DeformationAndDerivedPatchingAlgebra 69, EtaleDualityAndPerverseSheavesPartII 119,
SchemeAndStackFoundationsPartII 198. No `*Needs:*`, supplier-table row or "Supplied by" names a later
roadmap; the four later roadmaps appear only in the ownership paragraph and `## Downstream consumers`.

**Citations resolved.** `roadmaps resolve` on the README (index of 2026-10-26T06:01Z, main `d654849`,
367 open heads): one lead, "PerfectoidQuotientsPartII §§Q5.2", which is an accepted board design
(`packages/PerfectoidQuotientsPartII/design/README.md`, merge order line 64) whose §Q5.2 exists: false
positive of the index; no Lean-name lead. Re-resolved by hand this round: PerfectoidQuotientsPartII
§§Q7.1, Q7.3 (above), ArithmeticGaloisDuality §R02.2.4 (above), the four downstream roadmaps (above).

**Declared gaps.** The five slugs of `design/plan.json` `gaps` (`prismatic-dieudonne-perfectoid`
→ PrismaticCohomologyPartII Layer 4; `complete-intersection-presentations`,
`flat-local-complete-intersection`, `ci-defect-additivity` → DerivedDeRhamCohomology §§0.21, 0.19, 0.21;
`regular-tower-tilt` → PerfectoidQuotientsPartII §Q10.1) each have a named earlier supplier and the same
slug in the README's contracts (lines 280–290, 326–332, 345–354); each `needs` is one sentence with its
hypotheses. Round 1 verified minimality against the suppliers; nothing in this round's changes touches
them.

**Sources: the seeded sample.** No locator is flagged unverified. Each sampled target read at its locator
in the cached texts (cited as `<id> line N`; printed pages from the page markers):

- 0.5: CS24 Lemma 7.2.7 (lines 3796–3827, pp. 90–91): (a) regular element in each `𝔪_{X,z}` gives
  injectivity for separated `Y`; (b) regular sequence of length 2 gives bijectivity for `X`-affine `Y`;
  proof reduces to `𝔸¹_X`, Čech complex as colimit of Koszul complexes `K(m_1^n, m_2^n)` (Stacks 0913,
  07DV), EGA IV_2 5.10.5 in the Noetherian case: as restated, no Noetherian hypothesis.
- 1.8: CS24 Theorem 3.3.1 (lines 1418–1424, p. 34): (a) `vdim ≥ 2` ⇒ fully faithful, `U_R` connected,
  `π_1(U_R) ↠ π_1(R)`; (b) `vdim ≥ 3` ⇒ equivalence and isomorphism; Remark 3.3.2 (line 1460, p. 35);
  SGA1 V Proposition 6.9 (lines 4650–4656, printed p. 113: `u` surjective ⇔ `H` fully faithful ⇔ `H`
  preserves connectedness) and Corollaire 6.10 (lines 4659–4662, p. 114: `u` isomorphism ⇔ `H`
  equivalence); SGA2 X Théorème 3.4 (lines 3390–3393): (i) regular of dimension `≥ 2` pure, (ii)
  complete intersection of dimension `≥ 3` pure, as the fourth Check says.
- 2.4: CS24 Theorem 4.1.8 (lines 1567–1588, p. 38): triangle (4.1.8.1) on `S_ét` with `V − 1`,
  (4.1.8.2) `RΓ_Z(S, G) ≅ RΓ_Z(W_n(S), 𝕄(G))^{V=1}` functorial in `S, Z, G`; proof with the cutoff
  cardinal, the perfect subsite, Lemma 4.1.6, Stacks 023M: as restated; Corollary 4.1.9 (lines 1589–1594,
  pp. 38–39) `H^i(A, G) = 0` for `i ≥ 2`.
- 3.2: CS24 Proposition 5.2.4 (lines 2256–2257, p. 54: `π_0` is an equivalence on étale and finite
  étale algebras), Theorem 5.2.6 (lines 2318–2327, p. 56: fppf hyperdescent, Postnikov limit (5.2.6.1),
  `RΓ_ét ≅ RΓ_fppf` for smooth `G` (5.2.6.2), Bégueri resolution (5.2.6.3) exact on the fppf site of every
  animated `R`-algebra because `Res → Q` is fppf), (1.4.2) at line 320; Bég80 Proposition 2.2.1 (line 746).
- 4.4: CS24 Proposition 4.1.13 (lines 1651–1668, p. 40): complete Noetherian local `𝔽_p`-algebra,
  complete intersection, perfect residue field, `G` finite flat of `p`-power order, `H^i_𝔪 = 0` for
  `i < dim R`; proof: Cohen presentation, Lemma 4.1.12 to the limit of `p^j`-th root rings, Lemma 4.1.11
  to `R_∞`, (4.1.8.2), projective dimension `≤ 1`, Stacks 07DV, the regular sequence `p, a_1, …`: the
  README's route step by step.
- 6.2: CS24 Theorem 6.2.3 (lines 3491–3498, pp. 83–84) and footnote 25 (lines 3542–3546, p. 84: the
  André-lemma variant BS22 7.14 with Corollary 5.5.3, Theorem 5.4.4 and Lemma 6.2.2), the route the
  README takes; Theorem 1.1.1 (line 66, p. 3).
- 6.3: CS24 Theorem 6.2.4 (lines 3540–3541, p. 84): finite étale `G`, `i < vdim(R)`; lines 1384–1390 on
  dropping the order hypothesis; Theorem 1.3.1 (line 288, p. 8).
- 7.5: EGA IV_4 Définition 21.13.7 (line 13005, printed p. 316), Proposition 21.13.8 (lines 13007–13015:
  `Γ` bijective and `Pic(U) = 0`; for Noetherian `A`, (i) ⇔ depth `≥ 2`), Exemples 21.13.9 (i)–(ii)
  (lines 13020–13024), Proposition 21.13.10 (line 13115, p. 318), Corollaire 21.13.6 (iii) (lines
  12991–13004: descent along faithfully flat `f` with `Y′ = f^{-1}(Y)`) and (21.13.12.1) (lines
  13184–13187); SGA2 XI Définitions 3.1, 3.2 (lines 3604, 3610, printed p. 101), Lemme 3.6 (lines
  3636–3638, p. 102: descent of parafactorial pairs along faithfully flat quasi-compact maps), Théorème 3.13
  (lines 3754–3758, p. 105); CS24 footnote 26 (lines 3833–3838, p. 91). All as restated.
- 7.15: CS24 §7.2 and the proof of Theorem 7.2.8 (lines 3849–3869, p. 92: "realizing `T` as the kernel
  of a morphism between tori", `T = 𝔾_m`); C19 §2 (lines 111–178); SGA 3 IX 1.1, 2.11, X 4.5 are
  uncertified (below). The `[m]`-factorisation bullet is the README's own and is checked in the table.
- 7.17: CS24 Theorem 7.2.9 (lines 3871–3878, p. 92) with footnotes 27–28 (lines 3879–3884) and the proof
  (lines 3887–3890, p. 93: Lemma 7.1.1, `T = 𝔾_m`, Gro68a 1.4 for torsion): hypotheses `d ≥ 3`, complete
  intersection of dimension `≥ d` with factorial strict henselizations or regular of dimension `≥ d − 1`,
  injective `i < d`, bijective `i < d − 1`: exactly as restated.
- 8.2: C19 Lemma 2.1 (lines 111–129, pp. 3–4), Proposition 2.2 (lines 130–135, p. 4), Proposition 2.3
  with (3) and (3′) (lines 147–157, p. 4), Corollary 2.4 (lines 172–175, p. 5), Definition A.1 (lines
  568–570, p. 15), Lemma A.2 (lines 574–575, p. 15): (a)–(e) as restated, (b) with the added
  "commutative" recorded under Source corrections.
- 8.6: C19 Theorem 6.1 (lines 493–496, p. 13): regular of dimension `≥ 2` along `Z`, `X ∖ Z → X`
  quasi-compact, isomorphism for `q ≤ 2`, injective for `q = 3`.
- 8.14: Poo17 Proposition 6.8.1 and the construction after it (lines 8099–8123, printed pp. 196–197):
  completion, `K^{unr}` with `Br(K^{unr}) = 0` (`C_1` for perfect `k`; `p`-primary parts excluded
  otherwise), Hochschild–Serre, valuation to `H²(G_k, ℤ)`, `H^1(k, ℚ/ℤ) ≅ H²(k, ℤ)`; Warning 6.8.2 (lines
  8125–8128) is the imperfect-`k⟦t⟧` Check; C19 6.4 (lines 551–554, p. 14).
- 8.15: C19 6.4 (lines 551–554): exact `0 → H²(𝒪, 𝔾_m)[ℓ^∞] → H²(K, 𝔾_m)[ℓ^∞] → H^1(k, ℚ/ℤ)[ℓ^∞]` for
  `ℓ ≠ char k`, and for `ℓ = char k` with `k` perfect, after Gro68b 2.1; Poo17 Proposition 6.8.1 (above).
- 8.17: C19 footnote 5 (lines 560–563, p. 14): a point `y` of height `≥ 2` and residue characteristic `p`
  generalises to a height-one `x` of residue characteristic `p` whose residue field has a nontrivial
  discrete valuation by EGA II 7.1.7, hence is imperfect; EGA II Proposition 7.1.7 (lines 5519–5521,
  p. 137): a Noetherian local domain that is not a field, with fraction field `K` and `L/K` finitely
  generated, is dominated by a discrete valuation ring with fraction field `L`.
Also re-read for the repaired passages: CS24 §4.1.5 (lines 1538–1546, p. 37: pro-ppf and pro-fppf
definitions, "by §2.3.3 the pro-ppf maps are stable under base change and composition", a pro-fppf cover
is an fpqc cover) and footnote 13 (lines 997–1000, p. 24); Stacks 07C3 (Algebra chapter, line 14640:
for a set `𝓔` of finitely presented `R`-algebras, `Λ` is a filtered colimit of members iff every
finitely presented `B → Λ` factors through a member).

**Pinned declarations opened this round.** `Int` `ConditionallyCompleteLinearOrder` instance
(`Mathlib/Data/Int/ConditionallyCompleteOrder.lean` lines 29–39, `sInf s = … else 0`);
`Submodule.spanFinrank` (`Mathlib/Algebra/Module/SpanRank.lean` line 66, `0` when not finitely generated,
line 118); `RingTheory.Sequence.IsWeaklyRegular.nil` (`Mathlib/RingTheory/Regular/RegularSequence.lean`
line 267) and `Ideal.ofList_nil` (line 43): the empty sequence is weakly regular with ideal `⊥`, which the
new §1.1 Check uses; `CategoryTheory.Sheaf.cohomologyPresheaf`, `Scheme.fppfTopology`, `HasSheafify`
(by `#check`); `IsAzumaya` (`Mathlib/Algebra/Azumaya/Defs.lean` line 60).

**Adversarial table** (sampled targets, headlines, repaired passages).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 non-Noetherian Check (F03) | valuation ring `R`, value group `ℚ`, `𝔪 = 𝔪²` | `𝔪ⁿ = 𝔪`, `lim R/𝔪ⁿ = R/𝔪 = k`; presentation `B = k`, kernel `0 = ofList []`, `IsWeaklyRegular.nil`; every regular `B ↠ k` has `ker = 𝔪_B`, `μ(𝔪_B) − μ(𝔪_B) = 0`, set `= {0}`, `sInf = 0` | `IsCompleteIntersection R` holds, `virtualDimension R = 0`, `R` not Noetherian: Check true | R01 (position only) |
| §1.1 `virtualDimension` junk | non-Noetherian `R` with no regular `B ↠ R̂`; Noetherian `R` | set `∅`, pinned `sInf ∅ = 0`; singleton by SGA2 XIV 5.2, `sInf` = the value | junk never used (all headlines Noetherian) | none |
| §1.8 `zariskiNagata_*` | `k⟦x,y⟧/(xy)`; `A_1`; 3-dim node; field; `k⟦x,y⟧/(x,y)²` | `vdim 1`: `U_R` two punctured lines, not connected; `vdim 2`: `π_1(U_R) = ℤ/2 ≠ 1`, (b) fails; `vdim 3`: covers extend (SGA2 X 3.4(ii)); `vdim 0`, `−1`: `U_R = ∅`, excluded by `2 ≤` | thresholds `2`, `3` sharp; Lean hypotheses exclude every degenerate case | none |
| §1.8 Galois-category clauses | `H = finiteEtalePullback`, SGA1 V 6.9/6.10 | fully faithful ⇔ `π_1` surjective; equivalence ⇔ isomorphism | README (a), (b) are 6.9, 6.10 verbatim in content | none |
| §0.5 Hartogs | `k[x,y]`, origin; `Z = V(x)`; doubled origin | `Γ = k[x,y]`; `k[x^{±1},y] ≠ k[x,y]`; two sections agree off `0`, differ | (b) needs length 2, (a) needs separated | none |
| §2.3 pro-ppf base change (F02) | `A → A′ = colim A′_i` flat fp, `A → C` | `C ⊗_A A′ = colim C ⊗_A A′_i`, each flat fp over `C` | holds | none |
| §2.3 pro-ppf composition (F02) | `A → A′ → A″`, fp `B → A″` | `A′⊗_A B → S → A″`, `S` flat fp over `A′` (07C3 for `A′ → A″`); `S = S_i ⊗_{A′_i} A′` with `S_i` flat fp over `A′_i` (fp descends; flatness by EGA IV 11.2.6.1), hence flat fp over `A`; `B → A′_i ⊗ B → S_i → A″` | 07C3 for `A → A″` with the set of flat fp algebras up to isomorphism; faithful flatness nowhere used | R02 (locator style) |
| §2.3 pro-ppf vs pro-fppf | `A → 0`; `ℤ → ℚ` | `0` flat fp, pro-ppf, not faithfully flat; `ℚ = colim ℤ[1/n]` flat fp, pro-ppf, not pro-fppf | pro-fppf = faithfully flat pro-ppf = `IsIndFppf` by Q7.1 line 371 | none |
| §2.4 key formula | `ℤ/p`; `μ_{p^n}` over perfect `A`; `α_p` over `𝔽_p[t]` | Artin–Schreier `A^{φ=1}`, `A/(φ−1)A`; `𝕄(μ_{p^n}) = W_n(A)` with `V = p·φ^{-1}` nilpotent (`V^n = p^n φ^{-n} = 0`), so `V − 1` invertible and `RΓ(A, μ_{p^n}) = 0`, matching `A^×` and `Pic A` `p`-divisible; `α_p`-torsor `s^p = t` nontrivial over `𝔽_p[t]` | perfectness needed | none |
| §3.2 Bégueri resolution Check | `G = μ_n`, `G^* = ℤ/n` | `Res_{(ℤ/n)/R}𝔾_m = 𝔾_m^n`; `ζ ↦ (ζ^i)_{i∈ℤ/n}` is the character `i ↦ ⟨ζ, i⟩`; diagonal `i ↦ ζ` has `χ(0) = ζ ≠ 1` | map is the Cartier adjoint, diagonal excluded | none |
| §3.2 derived reduction Check | `A′ = 𝔽_p ⊕ 𝔽_p[1] = 𝔽_p/^L p`, `G = μ_p` | `e^*L_{μ_p}` in degrees `−1, 0`; cofibre `RHom(e^*L, 𝔽_p[2])` in degrees `−2, −1`; `H^0(A′, μ_p) ≅ Ext¹(e^*L, 𝔽_p) = 𝔽_p ≠ 0 = μ_p(𝔽_p)`; `H^i` agree for `i ≥ 1` | differs exactly in degree `0`, as the Check says and §3.3 (`i ≥ 1` bijective) allows | none |
| §4.4 char `p` purity | `𝔽_p⟦x,y⟧`, `μ_p`; `𝔽_p⟦x⟧/(x²)`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)` | `H^0_𝔪 = H^1_𝔪 = 0`, `H²_𝔪` needs §6.5; depth `0`, nothing claimed; `vdim 1`, not CI, `H^0_𝔪(α_p) ∋ xy ≠ 0` | CI hypothesis cannot become `vdim` | none |
| §6.2 CI purity | field; DVR, `μ_p`; `k⟦x,y⟧/(xy)`, `ℤ/2`; `W(k)⟦x,y⟧/(p−xy)`; §7.8 `n = 3` | `U = ∅`, nothing; `H^0_𝔪 = ker(μ_p(R) → μ_p(K)) = 0`; `H^0_𝔪 = ker(ℤ/2 → (ℤ/2)²) = 0`; `𝔪 = (x,y)` since `p = xy ∈ 𝔪²`, regular of dim 2, `U_R` connected, `H^1(R) ↪ H^1(U_R)` (§1.8(a)); Veronese cone `H²_𝔪(μ_2) ≠ 0`, `2 < 3` | hypotheses exact; route's `vdim = dim` for CI by §1.1 | none |
| §6.3 étale coefficients | `k⟦x,y⟧/(xy)`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`, `ℤ/p`; `k⟦x,y⟧/(x,y)²` | `vdim 1`, `H^0 = 0`, `H^1 ≠ 0` (two components); `R_red = 𝔽_p⟦z,t⟧`, `U_R` connected nonempty, `H^0_𝔪(ℤ/p) = 0` while `H^0_𝔪(α_p) ≠ 0`; `vdim −1`, `U = ∅`, `H^0_𝔪 = ℤ/p` | bound sharp, nothing asserted for `vdim ≤ 0` | none |
| §7.1 Check (F04) | smooth `X`, `Z` codim `≥ c ≥ 1`, `d = c + 1`; `c = 2`; `c = 1`, `X = 𝔾_m`, `Z = {1}`, `p ≠ char k` | `max(d−1, 1) = c`; bijective `i < c`, injective `i = c`; `c = 2`: `H^1` iso, `H^2` injective; `c = 1`: units `k^×t^ℤ` vs `k^×t^ℤ(t−1)^ℤ`, `k^×` `p`-divisible, `Pic = 0` both, `H^1 = ℤ/p ↪ (ℤ/p)²` | Check now equals the theorem's bound and is sharp | none |
| §7.1 `c = 0` guard | `Z` a component | `d = 1`, regular of dim `≥ 1` fails at a generic point | excluded by `c ≥ 1` | none |
| §7.5 parafactorial | `k⟦x,y⟧`; DVR; `A_1`; 3-dim node; wrong models | depth 2, `Pic(U) = 0`; `Γ(U) = K ≠ R`; depth 2, `Pic(U) = Cl = ℤ/2`; `Pic(U) = ℤ·(x,z)`; "Pic only" passes the DVR wrongly, "depth only" passes `A_1` wrongly | Checks separate both wrong models | none |
| §7.7 `localPicard_*` | 3-dim node; `A_1`; regular dim 2, 1, 0; elliptic cone | `Pic(U) = ℤ` torsion free, nonzero; `ℤ/2` at dim 2, no claim; `0`, `Pic(Spec K) = 0`, `Pic(∅)` singleton; `Pic(U_S)_tors` infinite at dim 2 | Lean `(CI ∧ 4 ≤ dim) ∨ Regular`, `CI ∧ 3 ≤ dim` match CS24 7.2.1 | none |
| §7.15 `[m]` factorisation | `M = X^*(T)`, `mM_tors = 0`; `T = μ_n`, `m = n`; `T = 𝔾_m`, `m = 1` | `mM ⊂ M` free, `S = D(mM)` torus, `T = D(M) ↠ D(mM)` with kernel `D(M/mM) = T[m]`, `S ↪ T` dual to `x ↦ mx`, composite dual `x ↦ mx` = `[m]`; `S = D(0) = 1`, `T[n] = μ_n`; `S = T`, identity | bullet correct | none |
| §7.15 definition | `𝔾_a`; `α_p`; norm-one torus | group-like elements of `k[x]` are `1`, so `𝔾_a = D(0)` would be trivial; `α_p^∨ = α_p` not étale; character module `ℤ_sign` | Checks exclude the non-examples | none |
| §7.17 higher degrees | regular, `Z` codim `≥ 2`, `d = 3`; 3-dim node, `𝔾_m` | bijective `i ≤ 1`, injective `i = 2`; `H^1(R) = 0 ≠ ℤ = Pic(U_R)` | factoriality needed | none |
| §8.2 (b)–(e) | `R′ = R`; `ℝ`; `R′ ⊗_R R′` in (e) | identities; `H²(ℝ, ℤ/2) = ℤ/2`, not dim `≤ 1`; product of regular local rings of dim `≥ 2`, `Pic(V) = 0` by §7.7 | hypotheses as C19 2.2–2.4 | none |
| §8.6 torus purity | `𝔾_m`, `q = 0, 1`; `Z = ∅`; `Z = V(x) ⊂ 𝔸²`; `A_1`; `𝔸²_ℂ ∖ 0` | units by Hartogs, `Pic(X) = Pic(X∖Z)`; identity; `H^1_Z = ℤ`; `Pic(U) ≠ 0`; `Br′ = 0` both | codim `≥ 2` and regularity needed; `q = 3` injective only | none |
| §8.14–8.15 residue (F06) | `ℤ_p`; `ℂ⟦t⟧`; imperfect `k⟦t⟧`, `ℓ = p`; `ℝ⟦t⟧` | `∂` iso `ℚ/ℤ`; `∂ = 0`; `Br(k((t)))[p] ≠ 0`, `H^1(k, ℚ/ℤ) = 0`, excluded; `ℤ/2 → (ℤ/2)² → ℤ/2` exact | hypotheses match Poo17 6.8.1 | none |
| §8.15 new Check (F06) | `𝒪 = 𝔽_q⟦t⟧`, `L = 𝔽_{q^n}((t))`, `π = t` | `Br(𝔽_q) = 0` ⇒ residue injective; Convention 8: `(L/K, σ, t) ↦ χ` with `χ(σ) = 1/n`; `σ = Frob_q^{-1}` gives `χ′(Frob_q) = −1/n = −χ`; residue a homomorphism ⇒ classes inverse, order `n`; geometric normalisation swaps `±χ`, same kernel | sign pinned against a supplier whose sign is unstated; exactness independent of sign | none |
| §8.15 supplier use (F06) | AGD Witt sequence, `𝒪 = k⟦t⟧`, `ℓ ≠ char k`, `q = 2`, `r = 1` | `H²(K, μ_m) ≅ Br(K)[m]` (Kummer, `Pic K = 0`), `H^1(k, ℤ/m) = H^1(k, ℚ/ℤ)[m]`, `H²(k, μ_m) = Br(k)[m]` | `m`-torsion of the Brauer sequence recovered; only the kernel is used | none |
| §8.17 | `ℤ_p⟦x⟧`, `y` closed, `𝔭 = (p)`; `𝔭 = (x)`; `𝔽_p⟦x,y⟧`; dim 1 | `k(x) = 𝔽_p((x))`, `v(x) = 1`, `x = s^p` would need `v(s) = 1/p`; `k = ℚ_p`, char 0, not chosen; any height-one prime (`p = 0`), e.g. `(x)` with `𝔽_p((y))`; vacuous | existence of `𝔭 ∋ p` of height 1 by Krull when `p ≠ 0`, any when `p = 0`; `dim 𝒪_{X,y}/𝔭 ≥ 1` so EGA II 7.1.7 applies | none |
| Ownership paragraph (F01) | four heads | PCIII d797991 §6.0 lines 111–134; DDPA a3b5dea lines 628, 1337; SSF-PII design lines 7–11, 62; EDP-PII design lines 17, 1099, 1250 | package claim vs heads recorded; one clause unsupported | R03 |

**Ownership by object.** `roadmaps grep` was used in round 1 over the same index for the objects of this
roadmap; this round re-checked the objects the repairs touch: "pro-ppf"/"pro-fppf" is planned only here
and (ind-fppf, faithfully flat) in PerfectoidQuotientsPartII §Q7, and (as import) in
SchemeAndStackFoundationsPartII; the residue sequence of a complete discretely valued field is
ArithmeticGaloisDuality §R02.2.4 and is now cited, not restated. Ownership against open pull requests
was checked through `roadmaps grep` (which indexes the 367 heads) and the board packages index
(AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory: unrelated by title, not opened).

## Not verifiable

- SGA 3 IX 1.1, 2.11 and X 4.5 (§7.15), Gro68 Brauer III 2.1 (§8.15), Aus62 1.3, Avr77 3.6, MB85
  Lemme 2, Bou78 IV 5.1 and V 4.9, Gab04b, BH 2.3.1, SGA 4 and SGA 5 passages: settled `uncertified`
  sources, cited by locator through CS24/C19 as the manifest records.
- Stacks tags other than 07C3 and 07DV (09Q1, 09Q7, 0DXR, 0DX9, 0EHC, 0EJP, 023M, 09ZL, 0913): the
  cache holds only the Algebra chapter; 0913 is not in it. They are cited for the same statements by CS24
  at the lines quoted above.
- ILO14 XVII "Théorème 0.2 of the published version" and ALB23 "Theorem 5.4": published-version numbers;
  the cached arXiv versions have Théorème 0.9 and Theorem 5.1.4, as the manifest's version notes say
  (checked in round 1, unchanged).
- EGA IV_2 5.10.5 and 6.1.2 were not re-read this round (read in round 1; untouched by the repairs).

## Source issues

- none

(The six source issues of round 1 — CS24 Theorem 7.1.2, proofs of 3.3.1(b), 6.2.7, 7.2.1, 7.2.5, Lemma
4.1.12; C19 Proposition 2.2 — are already in the errata register and in the README's `## Source
corrections`; no new one was found at the fifteen sampled locators.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "84e8f65", "job": "REV-PKG-PurityForFlatCohomology~2", "model": "fable", "worker": "fable-rev203"} -->
