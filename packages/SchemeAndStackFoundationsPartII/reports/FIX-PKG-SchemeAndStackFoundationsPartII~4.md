# FIX-PKG-SchemeAndStackFoundationsPartII~4

Repair round for the two findings of `REV-PKG-SchemeAndStackFoundationsPartII~3` on `packages/SchemeAndStackFoundationsPartII`. Only `README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-SchemeAndStackFoundationsPartII~3/F01 (P2) — applied

Old → new (§1.4, formerly §2.4): "For discrete A the three sites recover their ordinary counterparts" → objects are all animated A-algebras, flatness bears on covers only. New bullets: restriction to flat B-algebras (CS24's sites), the ordinary subcategory (Tau Ceti's topology), values at ordinary algebras via `gap:animated-flat-cohomology`, no site equivalence. Added the B=k⊕k[1] negative control.

**Verification.** The finding is right.
- CS24 §5.2.3 (CS24 lines 2241–2254) puts the topology on the ∞-category of all animated rings, with covers the faithfully flat maps. Line 2253–2254 only says that a 0-truncated ring gets no new covers.
- CS24 §5.2.5 (lines 2279–2290) builds the topoi of A on A-algebras étale, fppf or flat over A. Its "reproduces the classical cohomology" (lines 2288–2290) is a statement about values at a 0-truncated A, not an equivalence of sites.
- The old line was false for the big site. Over A=k the object B=k⊕k[1] has π₁B=k, and no ordinary k-algebra has a nonzero π₁. For faithfully flat B→B′, the flat tensor formula of §1.2 (CS24 line 2212) gives π₁B′=π₁B⊗_kπ₀B′=π₀B′≠0. So no covering family of B consists of ordinary algebras.

**What the repair states, in place of the old bullet:**
- **Definition.** The big sites have all animated A-algebras as objects and all A-algebra maps as morphisms. Covering families are families of étale, fppf or flat maps that are jointly faithfully flat on π₀; for fpqc, a finite subfamily must already be jointly faithfully flat.
- **Relation to the CS24 §5.2.5 sites.** For each object B, the slice is the big site of B. Its full subcategory of B-algebras étale, fppf or flat over B contains the covers of its own objects and the derived tensor products of their terms. So the inclusion is continuous and cocontinuous, restriction commutes with sheafification, and the value at B can be computed on CS24's site.
- **Ordinary subcategory.** The discrete objects are the ordinary π₀A-algebras, because maps from A into a discrete ring factor through π₀A. Covers of a discrete object are discrete, so the induced topology is the ordinary big topology. In the fppf case it is `TauCeti.CommAlgCat.fppfTopology` of π₀A, which is A itself when A is discrete.
  - I checked this against the pinned definition at `TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61`: the topology induced along `algSpec` from `Scheme.fppfTopology.over`.
  - A covering sieve of that topology contains a jointly surjective family of flat finitely presented C-algebras. To see this, take affine opens of the flat, locally finitely presented scheme family; each such open is finitely presented over the affine base.
- **Values at ordinary algebras.** The value at an ordinary C is classical étale, fppf or fpqc cohomology of the restriction to ordinary algebras. For this roadmap's coefficients this is the ordinary-algebra comparison of the already declared `gap:animated-flat-cohomology`; §5.0 records it on the pinned carrier, and §5.0 itself is unchanged.
- **No site equivalence.** An explicit bullet says the comparisons concern the subcategory and its values, not the whole site. Every covering family of a non-discrete object has a non-discrete term.

**Other changes for F01:**
- `gap:animated-flat-cohomology` is added to the §1.4 *Needs* and to the Layer 1 Dependencies.
- The Layer 1 Examples gain one sentence on k⊕k[1] as an object over k.
- The ℤ/4 Check and the A→k Check are restated to match the new definition.

**Pattern search.** I searched the README and `Suggested.lean` for other site-equivalence claims ("ordinary counterpart", "recover", "unchanged by", "classical site", "0-truncated", "big site", "whole site"). None remain. §5.0's comparison bullet already speaks only of ordinary R-algebras and is correct as stated.

## REV-PKG-SchemeAndStackFoundationsPartII~3/F02 (P2) — applied

Old → new: Layers 1 and 2 swapped. Layer 1 is now flat animated algebras, sites, henselization and towers (§§1.1–1.6, formerly §§2.1–2.6); Layer 2 is animated group points and cotangent deformation (§§2.1–2.4, formerly §§1.1–1.4). All internal references renumbered; the build paragraph states that Layers 1–3 are independent and meet in Layer 4.

**Verification.** The finding is right. Before this round, the old Layer 2 *Needs* lines cited nothing from old Layer 1, and the old Layer 3 cited nothing from old Layers 1 or 2. So the order 1,2,3 was forced only by the order of CS24 §§5.1, 5.2 and 5.3–5.4.

**Why the new order.** The animated sites (new Layer 1) are where the cohomology lives. The animated point functors (new Layer 2) are the coefficient presheaves whose sheafifications on those sites give RΓ(A,G). Layer 3 stays where it is, because Layer 4 needs it. The build paragraph now says that Layers 1, 2 and 3 use none of one another's targets and names where they meet:
- §4.3 uses §1.6, §2.3 and §3.3;
- §4.4 uses §1.5.

Both claims match the *Needs* lines.

**Edits.**
- Old → new numbering: §§1.1–1.4 → §§2.1–2.4 and §§2.1–2.6 → §§1.1–1.6. Layers 0 and 3–6 are unchanged.
- A placeholder substitution renumbered 22 own-section references, by section title. These are the *Needs* lines of the moved sections, §§4.3, 4.4, 6.1 and 6.2, the Layer 4 and Layer 6 Dependencies, and the Layer 1 Examples.
- Also updated: the Scope sentence "Layer 1 here proves the animated-point cotangent interfaces" (→ Layer 2) and the Downstream consumers sentence (→ Layer 2).
- Supplier references such as SchemeAndStackFoundations §2.5, Layer 2 §§2.1–2.6, Layer 1 §§1.13–1.15, DerivedModuleAlgebra §§1.2–1.4 and PurityForFlatCohomology §2.1 were left untouched; a grep listed every remaining §1.x and §2.x occurrence, and I checked each by hand.
- `Suggested.lean` cites only README §§4.5, 5.2, 5.3, 6.2 and "Layer 5", so no docstring changes.

**Who cites the old numbering.** No other roadmap cites a numbered section of this one. I checked `roadmaps grep 'SchemeAndStackFoundationsPartII…(§|Layer)'` over main and the open heads, and grepped the board packages. The only hits are descriptive prose in PurityForFlatCohomology (see the maintainer notes), so no old → new table is added to the README.

## Checks run

**Elaboration.** I ran `lake env lean` on `packages/SchemeAndStackFoundationsPartII/Suggested.lean` from the content checkout.
- Exit 0, about 5 s.
- Exactly two warnings, both `declaration uses sorry`, at lines 97 and 125 (`flatCohomology_henselian_invariance`, `flatCohomology_algebraization`).
- The file is byte-identical to the round's start, and no `TauCeti.*` build was needed.

**Binder check.** I made a scratch copy with `#check @` for all six declarations, plus `TauCeti.CommAlgCat.fppfTopology`, `TauCeti.CommAlgCat.generate_singleton_op_mem_fppfTopology`, `TauCeti.HopfAlgebra.pointsFppfSheaf` and `AlgebraicGeometry.Scheme.fppfTopology`, and elaborated it once (exit 0).
- The six elaborated types are unchanged and agree with the README: `CommRing`, the native finite locally free G, the sheaf-category `HasExt`, `HenselianRing R I` with the separate `1 ≤ n` and `2 ≤ n` clauses, the uniform, topological-ring, openness, henselian and ideal-basis hypotheses, and `2 ≤ n`.
- No binder was lost and nothing changed.

**Dependency check.** Output:

```
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` reports one cross-roadmap lead: "PerfectoidQuotientsPartII §Q7.1: no roadmap … on main or in an open pull request". This is not a defect. It is the board package `packages/PerfectoidQuotientsPartII` (merge order line 220, before this roadmap at line 257), whose README has `### Q7.1 Ind-fppf ring maps` at line 814. Lean names found nowhere: none.

**Internal order.** A script read every *Needs* line and listed its own-section references. Every edge points to an earlier section, and none links Layers 1, 2 and 3 to one another:
- Layer 1: 1.2→1.1, 1.3→1.1/1.2, 1.4→1.1/1.2.
- Layer 2: 2.2→2.1, 2.3→2.2, 2.4→2.2/2.3.
- Layer 3: 3.3→3.2.
- Into later layers: 4.3→1.6/2.3/3.3/4.1/4.2, 4.4→1.5/4.3, 4.5→3.1/3.3/4.2–4.4, 6.1→1.1/1.3, 6.2→1.6/3.1/4.1/4.5/6.1.

**Gap consistency.** The 19 README `What … must provide (gap:…)` paragraphs equal the 19 plan `gaps` entries in slug, supplier and `needs` text. Every `gap:` reference is declared and every declared gap is used. `design/plan.json` is unchanged.

**Policy greps.** The README contains no LaTeX delimiters, `#NNN` numbers, machine paths, or the words "removed", "current", "so far", "optional" or "deferred".

**Ownership.** No object is new in this round: §1.4 restates the existing definition with its objects made explicit. Searching main, the open heads and the board for an animated étale, fppf or fpqc site gives only PurityForFlatCohomology's description of PrismaticCohomologyPartIII §6.0. That roadmap builds animated fppf cohomology on such a site inside a proof route and does not export the site as a target. This matches this roadmap's Scope paragraph (unchanged since earlier rounds).

No gate failures were listed in the brief.

## Adversarial pass on changed and added statements

| Statement | Instances | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| §1.4 objects and covers | A=k, B=k⊕k[1]; A=0; k×k with one component; ℤ→{ℤ_(p)}_p for fpqc | B is an object with π₁B=k. Over 0 the only object is 0, covered by the empty family (Spec 0=∅). One component hits 1 of 2 points. Each ℤ_(p) has image {(0),(p)}; the family is jointly surjective, but every finite union of images misses infinitely many primes | Not an fpqc cover; the finite-subfamily clause is needed | Definition rewritten |
| Restriction to algebras flat over B (CS24 §5.2.5 sites) | B=k; B=k⊕k[1] with étale algebras | Flat k-algebras are discrete, i.e. all ordinary k-algebras; RΓ(k,G_a)=k[0] on both sites. Étale B-algebras ≃ étale k-algebras (CS24 Prop. 5.2.4, line 2256): a separable k′ lifts with π₀=π₁=k′ | Values agree; the subcategory contains its covers and their tensor products | New bullet |
| Discrete objects = ordinary π₀A-algebras | A=k⊕k[1], C=k; A=(ℤ/p²)/^Lp, C=ℤ/p² | Map(A,k)≃Hom(k,k) is a point, so k is an object. The second A has π₀=𝔽_p, so ℤ/p² (characteristic p²) is not an A-algebra, though it is an algebra over the base ℤ/p² of the Koszul quotient | Rules out the wrong model "ordinary algebras over the base ring" | New bullet; first instance is a Check |
| Induced fppf topology = `TauCeti.CommAlgCat.fppfTopology` | ℤ→ℤ[1/2]×ℤ[1/3]; ℤ→ℤ[1/2]; faithfully flat finitely presented singleton | D(2)∪D(3)=Spec ℤ, so the first is a cover in both; the second misses (2) in both; the singleton covers by `generate_singleton_op_mem_fppfTopology` | Covering families agree | New bullet |
| Values at ordinary C | C=ℤ/4 with G_a; C=𝔽_p[t] with α_p; C=k with G_a | ℤ/4 in degree 0; H¹=𝔽_p[t]/𝔽_p[t]^p≠0, while the étale value is 0; k in degree 0 | Consistent with §5.0's Checks | New bullet and Check |
| Not a site equivalence | B=k⊕k[1]→B′ faithfully flat; split cover B→B×B; B=0 | π₁B′=π₀B′≠0; π₁(B×B)=k²≠0; the zero object is discrete and covered by the empty family | Every cover of a non-discrete object has a non-discrete term; this needs π₀B≠0, which holds for B≠0 | New bullet and negative-control Check |
| Check: A=k⊕k[1], A→k | π₁A⊗_kk vs π₁k | k vs 0, so A→k is not flat and not a cover; k is still an object, being an ordinary π₀A-algebra | Agrees with §1.1's Check | Reworded |
| Layer order | All *Needs* lines (script above) | 0 edges among Layers 1–3, 0 forward edges; Layer 4 uses 1.5, 1.6, 2.3, 3.1, 3.3; Layer 6 uses 1.1, 1.3, 1.6, 3.1 | (0,1,2,3,4,5,6) is a topological order of the new layers | Layers 1 and 2 swapped |
| Build-paragraph meeting claims | §4.3 and §4.4 *Needs* | §4.3 lists §1.6, §2.3, §3.3; §4.4 lists §1.5 | Matches | New text |
| Layer 1 Examples sentence | k⊕k[1] over k; k itself | Same as the negative control; RΓ(k,G_a)=k[0] | Agrees with the §1.4 Checks and the Conventions Check H^(−1)(k⊕k[1],G_a)=k | New text |

## For the maintainer

- **Numbering.** Layers 1 and 2 of this roadmap swapped numbers: §§1.1–1.4 → §§2.1–2.4 and §§2.1–2.6 → §§1.1–1.6. No roadmap on main, at an open head, or among the board packages cites these numbers.
- **Stale prose in PurityForFlatCohomology.** Its README (open head line 209; board package `packages/PurityForFlatCohomology/README.md` line 134) describes this roadmap as importing a Purity result in "its Layer 1 Brauer comparison". This roadmap has had no Brauer layer since an earlier round, and its Layer 1 is now the flat animated algebras. That sentence is descriptive, not a citation of a target, so nothing here depends on it. Purity may want to drop the layer number in its next revision.
- **No Lean changes.** `Suggested.lean` is unchanged, and no declaration name that other roadmaps could cite has changed.
- **Ownership against open pull requests** was checked with `roadmaps grep` over main and the indexed open heads (index of 2026-11-11), and over the board packages.
