# Review of GrothendieckTeichmuller (pull request #1058 at 7337ed3)

**Verdict:** accepted

Incremental re-review of 34 changed lines since 2104451. The change is the four repairs asked for
by the previous review: `Suggested.lean` is now a module-system module (`module`, seven
`public import` lines, `public section`), the Scope paragraph names PeriodsAndSpecialValues as the
owner of the mixed Tate objects, 4.5's source line cites Ihara 1991 §3.3, Harbater–Schneps 2000 §0
and Schneps 1997 §1.3 remark (3), and the word « uncertified » is gone from the prose and the
References. Nothing changed outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckTeichmuller'` is
empty). Gate on this head with `--build`: `build=0 OK`, every check 0. Dependency check:
`depcheck: 205 roadmaps, 1418 edges, 0 problem(s)`, no UPWARD or CYCLE line; the merge order lists
GrothendieckTeichmuller at line 368 and PeriodsAndSpecialValues at line 296. `lake env lean` on
`Suggested.lean`: exit 0, exactly the fifteen `declaration uses 'sorry'` warnings (lines 102, 106,
110, 114, 118, 134, 171, 205, 209, 223, 246, 254, 276, 281, 287) and nothing else. No blocking
finding; one P3 note.

## R01 (P3) — style: the 4.5 sentence moved to its own line is still unwrapped

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` line 627, "Prove
`GTHat.isClosedEmbedding_betaEquiv`: for the topology of the units of `GT̂^{mon}` and Tau Ceti's
congruence topology, `g ↦ β_g` is a closed embedding of `GT̂` into".

Claim: the previous review's R04 asked that the sentence start on a new line *and* be wrapped.

Witness: `awk 'length($0)>100'` over the folder reports exactly two lines: README 627 at 169
characters and `Suggested.lean` 39 at 101 (the latter pre-existing and one character over). Every
other line of the README is at most 100.

Repair: break line 627 after "units of `GT̂^{mon}`" and after "`g ↦ β_g` is a closed embedding", so
each piece is under 100 characters; optionally break `Suggested.lean` line 39 before "The topology".
No mathematics changes.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 1–9 are `module`, a blank line, `public import Mathlib` and
  six `public import TauCeti.…` lines; line 48 is `public section` before the namespace, no `end`
  for the section. The gate's build is `build=0 OK` (no module-system warning), the public olean is
  78 KB, and a scratch importer prints all eight headline types (see Verified sound).
- R02 — repaired: README lines 57–59 now read "Neither is their motivic counterpart (mixed Tate
  motives over `ℤ`, their Galois group and the motivic path torsor are stated in
  PeriodsAndSpecialValues §§PS.9.8–9.10, and Brown's basis theorem in §PS.9.22)". All four sections
  exist at PeriodsAndSpecialValues' open head with those titles (resolved below).
- R03 — repaired: README lines 620–622, "*Source:* `GT̂` as a group of automorphisms of `F̂₂`: Ihara
  1991, §3.3; Harbater–Schneps 2000, §0; `GT̂` profinite as the inverse limit of its images in
  `Aut(F̂₂/N)`: Schneps 1997, §1.3, remark (3)." Each locator verified in the cached texts (below).
- R04 — partly repaired: « uncertified » is gone from lines 203 and 673–674 (Ribes–Zalesskii 2010,
  §9.1 is now cited by locator alone, which is the policy for a paywalled text; the status belongs in
  `sources.toml` when the manifest is created). The unwrapped line is R01 above.

## Verified sound

**The change.** `git diff 2104451 HEAD --stat -- TauCetiRoadmap/GrothendieckTeichmuller`: README
16 lines (+10/−6), `Suggested.lean` 18 lines (+11/−7); the folder holds `README.md` (694 lines),
`Suggested.lean` (290 lines), `metadata.toml`. No `*Needs:*` line, no target statement, no
hypothesis and no Lean declaration body changed: the diff of `Suggested.lean` is the import header
(lines 1–9) and the inserted `public section` (line 48) only, so `signatures.md`'s 43 elaborated
types (0 lost section binders) are those of the previous reviews, which compared them with the
README statement by statement.

**The module form (R01 of the previous review).** `lake env lean` on the file: exit 0, fifteen
`sorry` warnings, no other output. The gate with `--build`: `build=0`, and
`.lake/build/lib/lean/TauCetiRoadmap/GrothendieckTeichmuller/Suggested.olean` is 78 KB (the
`.olean.private` 99 KB), the size the previous review measured for the public form, against the
2 KB-class olean that a bare `module` without `public` would give. A scratch file
`import TauCetiRoadmap.GrothendieckTeichmuller.Suggested` with `#check @…` on the headlines prints:
`eq_of_beta_eq : ∀ {p q : Param}, IsUnit p.lam → p.f ∈ commutatorClosure → q.f ∈ commutatorClosure → beta p = beta q → p = q`;
`closure_artin : Subgroup.closure {a12, a13, a14, a23, a24, a34} = ⊤`;
`isUnit_iff_bijective_beta : ∀ (p : ↥gtMonoid), IsUnit p ↔ Function.Bijective ⇑(beta ↑p)`;
`isGT0_iff : ∀ (p : Param), IsGT0 p ↔ IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ Function.Bijective ⇑(beta p) ∧ RelI p.f ∧ RelII p.lam p.f`;
`GTHat.isGT0 : ∀ (g : GTHat), IsGT0 ↑↑g`;
`GTHat.injective_mk_betaEquiv : Function.Injective fun g => TauCeti.ContinuousOut.mk g.betaEquiv`;
`isClosed_setOf_isGT : IsClosed {p | IsGT p}`;
`GTHat.isClosedEmbedding_betaEquiv : Topology.IsClosedEmbedding GTHat.betaEquiv`; and `Param : Type`,
`gtMonoid : Submonoid Param`, `GTHat : Type`, `beta : Param → F2 →ₜ* F2`. Every declaration is public.
The gate's import scanner accepts the `public import` lines (`imports=0 mathlib-subimports=0
no-import-mathlib=0`); the file keeps the single `import Mathlib` and the six Tau Ceti modules of
the previous head, all of which exist at the pin (resolved in the previous review).

**The PeriodsAndSpecialValues citation (R02).** PeriodsAndSpecialValues is not on main; it is the
new folder of an open pull request, at merge-order line 296, earlier than this roadmap (line 368),
so it may be cited. At its open head, `TauCetiRoadmap/PeriodsAndSpecialValues/README.md` has
`### PS.9.8 Mixed Tate motives over ℤ` (line 2145), `### PS.9.9 Extensions and the motivic Galois
group` (2166), `### PS.9.10 The motivic torsor of paths on the three-punctured line` (2186) and
`### PS.9.22 The motivic Hoffman basis` (2460), whose bullet at line 2470 is the statement
`H = H_MT^+` with Brown's Conjecture 1 as its consequence, as the previous review said. The
sentence is a deferral in the Scope paragraph, not a `*Needs:*` edge: the dependency check reports
no edge and no problem, and nothing in Layers 0–4 consumes it.

**The 4.5 locators (R03).** ihara91 line 9635–9638 (§3.3, printed p. 108): `GT` defined as the
subgroup of `Aut F̂₂` of automorphisms `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f` with `(λ, f)` satisfying
(3.1.1)(I)–(III), "it forms a subgroup". harbaterschneps00 lines 69–75 (§0, printed p. 3118):
`GT̂₀` and `GT̂` as sets of pairs inducing automorphisms of `F̂₂`, with the group structure from
`Aut F̂₂` and `(λ, f)` recovered from `F` since `f ∈ F̂₂'`. schneps97 lines 278–284 (§1.3, remark
(3), printed pp. 189–190): `GT̂` is profinite as the inverse limit of its images in the finite
automorphism groups of `F̂₂/N`, `N` over the characteristic subgroups of finite index. The roadmap's
own route (closedness in `Param` and the units topology) is its own; the source line now claims
only what these texts state.

**Style (R04).** `grep -i uncertif` over the folder: no match. Lines over 100 characters: README
627 (R01 above) and `Suggested.lean` 39 (101).

**Adversarial table.** Rows for the untouched statements are carried from the previous reports,
which give the values; the new rows are the changed passages.

| statement | instances | values | result | change |
|---|---|---|---|---|
| module header keeps every headline public | 8 headlines + `Param`, `gtMonoid`, `GTHat`, `beta` | importer `#check` types identical to `signatures.md`; olean 78 KB; `lake env lean` exit 0, 15 `sorry` warnings | sound | none |
| Scope: owner of `MT(ℤ)`, `G_MT`, `₀Π₁`, Hoffman basis | PeriodsAndSpecialValues at its open head | §PS.9.8 l.2145, §PS.9.9 l.2166, §PS.9.10 l.2186, §PS.9.22 l.2460; merge order 296 < 368 | sound | none |
| 4.5 source: `GT̂ ⊆ Aut F̂₂` is a subgroup | ihara91 §3.3 | lines 9635–9638: subgroup of `Aut F̂₂`, pairs with (I)–(III) | matches | none |
| 4.5 source: `(λ, f)` recovered from `F` | harbaterschneps00 §0 | lines 71–73: `λ` from `F(x) = x^λ`, `f` from `F(y)` and `f ∈ F̂₂'` (this roadmap's 1.4) | matches | none |
| 4.5 source: `GT̂` profinite | schneps97 §1.3 (3) | lines 278–284: inverse limit of images in `Aut(F̂₂/N)`, `N` characteristic of finite index | matches | none |
| line lengths | README, Suggested.lean | 627 → 169 chars; Lean 39 → 101; all others ≤ 100 | R01 (P3) | wrap |
| 4.5 `ContinuousAut.compactSpace`/`t2Space`, 3.3 Hopf input, units topology, headline signatures | as in the r5 report | values there (r5) | sound (r5) | none |
| Scope rows (Brown Conj. 1, `d_N` count, `GT̂¹` slice, HLS levels, degenerate `(0,0,3)`, Hatcher's cycles) | as in the r4 report | values there (r4) | sound (r4) | none |
| Conventions law, Drinfeld (4.11), 0.1 (two rows), 1.3, 3.2, 3.3, 4.3 (two rows), 4.5 (four rows), 2.4 Check 3 | as in the r3 report | values there (r3) | sound (r3) | none |
| `subst`, 0.2–0.4, 1.1, 1.2, 1.4, 1.5, 2.1, 2.3 Check 3, 2.4 Check 2, 3.1, 3.2 Check 2, 3.3 units, 3.4, 3.5, 4.1, 4.2, 4.4, Scope HMM | as in the r2 report | values there (r2) | sound (r2) | none |

**Seeded sample.** Of the sampled targets (0.1, 0.3, 0.4, 1.1–1.4, 2.1, 2.2, 2.4, 3.1, 3.3, 4.1,
4.2, 4.4) the diff touches only 0.1's Ribes–Zalesskii citation (the word « uncertified » removed;
the locator §9.1 and the Herfort–Ribes Theorem B locator, herfortribes85 line 39, are those the
r2 review verified). The other locators were verified in the previous reviews against guillot14,
schneps97, lochakschneps94, drinfeld90, ihara91, harbaterschneps00 and herfortribes85 and stand.

**Supplier order, ownership, padding, headlines.** Depcheck as in the header; the README's supplier
contracts consume nothing from another roadmap, and the one new cross-roadmap mention is a Scope
deferral to an earlier roadmap. No folder changed, so the ownership check of the previous reviews
against main and the open pull requests stands. `Suggested.lean`'s declarations are unchanged: the
headline list (docstring lines 24–36, five headlines plus 3.5 named as not a headline) and the
one-tactic probe of the previous reviews apply. `citations.md`'s three leads (`GTHat.isGT0`,
`GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`) are this roadmap's own
theorems at `Suggested.lean` lines 254, 276 and 287.

## Not verifiable

- As in the previous reviews: Hatcher–Lochak–Schneps 2000 read in the authors' preprint, Brown
  2012 as arXiv 1102.1312v1, Grothendieck 1984 in the French text, Ribes–Zalesskii 2010 §9.1
  paywalled (cited by locator; Herfort–Ribes 1985, proof of Theorem C′, herfortribes85 lines
  258–260, gives the same free-product decomposition in a readable text), Ihara 1994, Belyi 1979,
  Montpellier folder 145. None is touched by this change beyond the wording noted under R04.

## Source issues

- none at this round (the previous reviews' entry on guillot14 Lemma 5.19 stands).
