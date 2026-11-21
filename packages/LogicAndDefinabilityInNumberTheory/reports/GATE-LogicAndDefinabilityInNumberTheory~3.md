# GATE-LogicAndDefinabilityInNumberTheory~3: answers to human review

One comment (0stellensatz, 2026-11-21T14:42:39Z) makes three points: H01 reports what PadicallyClosedFields states, H02 places §2.2 against it, and H03 offers to make PadicallyClosedFields the supplier of the fixed-F elimination. All three are checked against PadicallyClosedFields at the head of its open pull request (c07ebef, read with `roadmaps show PadicallyClosedFields`) and against this roadmap at 260ffb1. No file changed and there is no commit.

## H01 (0stellensatz) — answered

The description of PadicallyClosedFields is accurate at its head. Its Layer 4 defines `pcLang d` as its one-sorted valued-field language `valLang` plus constants `u₁, …, u_d` (an `𝔽_p`-basis of `O/pO`) and predicates `Pₙ`. In that language it states Prestel–Roquette's elimination for all p-adically closed fields of p-rank d (Thm. 5.6, p.91), and the d = 1 case as Macintyre's theorem for ℚ_p. Its Layer 4 Dependencies name only SaturationAndQuantifierElimination §2.2 and its own Layer 3. Nothing in this roadmap cites PadicallyClosedFields, and PadicallyClosedFields does not list this roadmap among its suppliers (its supplier contracts name AxKochenErshov, SaturationAndQuantifierElimination, LocalFieldsRamificationPartII, MassFormula with Completed/LocalFieldsRamification, Mathlib and Tau Ceti). So there is no supply edge between the two in either direction.

## H02 (0stellensatz) — answered

The boundary is as the comment says, and nothing here needs to change. In `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md`, §2.2 states the following, all over a fixed finite F/ℚ_p in the ring language with coefficients from F and the predicates for nonzero n-th powers:
- cell decomposition and preparation (line 270);
- Macintyre's elimination (line 272);
- analytic cells and dimension theory (lines 274–282).

The scope (line 1835) says "not over arbitrary p-adically closed fields". PadicallyClosedFields makes the matching claim twice: its Scope "Boundaries" bullet gives this roadmap the fixed-F elimination, cell decomposition and dimension theory, and its Downstream consumers entry says the two eliminations are stated independently. The statements are different, not duplicates:
- PadicallyClosedFields' theorems have no parameters and are in a language with a divisibility (valuation) symbol, and they cover every p-adically closed field of p-rank d.
- §2.2 names every element of F as a constant, has no valuation symbol, and covers only Th(F). It also comes with the cell decomposition that §§2.4–2.6 use at every prime, which PadicallyClosedFields does not state.

## H03 (0stellensatz) — answered

The suggested derivation is correct mathematically, but §2.2 keeps its own route.

Why the derivation works: give F of degree d the constants `u_i ∈ O_F`. Thm. 5.6 then turns any φ(x, c) into a quantifier-free `pcLang d` formula with constants from F. The divisibility atoms translate into §2.2's language without quantifiers. For a ≠ 0, b/a ∈ O_F holds iff a^ℓ + π·b^ℓ ∈ P_ℓ, by the existing Check at line 296 (x ∈ O_F ⟺ 1 + πx^ℓ ∈ P_ℓ, for a prime ℓ ≠ p) multiplied through by the nonzero ℓ-th power a^ℓ.

Why §2.2 keeps its route anyway: it gets the elimination as a by-product of the quantifier-free cell decomposition, which it has to prove at every prime and ramification index regardless, because a cell projects onto its base (Pas, p.138, `pas_1989` line 96). Citing Thm. 5.6 would therefore save no work in §2.2. It would only make this roadmap depend on an open roadmap, PadicallyClosedFields, that is not in the merge order and that the route does not need.

## Check of the derivation in H03 (no statement added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| x∈O_F ⟺ 1+πx^ℓ∈P_ℓ (line 296), used to translate divisibility atoms | F=ℚ₃, ℓ=2, π=3; x=0, 1, 1/3 | x=0: 1=1², square; x=1: 1+3=4=2², square; x=1/3: 1+3/9=4/3, v₃=−1 odd, not a square | agrees (0,1∈ℤ₃; 1/3∉ℤ₃) | none |
| same, p=2 | F=ℚ₂, ℓ=3, π=2; x=1, 1/2 | x=1: 3 ∈ ℤ₂^×, and cubing is bijective on ℤ₂^× ≅ {±1}×(1+4ℤ₂), so 3 is a cube; x=1/2: 1+2/8=5/4, v₂=−2 ≢ 0 mod 3, not a cube | agrees | none |
| a∣b in O_F ⟺ a^ℓ+πb^ℓ∈P_ℓ (a≠0) | F=ℚ₃, ℓ=2: (a,b)=(3,1), (1,3) | (3,1): 9+3=12=3·4, v₃=1 odd, not a square, and indeed 1/3∉ℤ₃; (1,3): 1+27=28 ≡ 1 mod 3, a unit square in ℚ₃, and indeed 3∈ℤ₃ | agrees | none |
| a=0 atom, and the convention for Pₙ | 0∣b; PadicallyClosedFields reads Pₙ as all n-th powers (0 included), §2.2 as nonzero ones | 0∣b ⟺ b=0 (`x ∣ y :↔ ∃ a ∈ V, a*x = y`); Pₙ(t) in their sense ⟺ t=0 ∨ Pₙ(t) in §2.2's sense | both quantifier-free | none |

## Build, gate and dependency check

- `lake build TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.Suggested`: `Build completed successfully (18248 jobs).` The only warnings are the 11 expected `declaration uses 'sorry'` warnings (lines 44, 54, 70, 77, 86, 94, 102, 120, 128, 158, 174).
- Gate (`--base origin/main`): `gate LogicAndDefinabilityInNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable --pr 2276`): `depcheck: 170 roadmaps, 1988 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Signatures: `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/Suggested.lean` is unchanged at 260ffb1. The elaborated types in the worker's signature listing are those of this head, so the `#check @name` comparison was not run again this round.
- Ownership: checked against PadicallyClosedFields at its head. It is not one of the 162 sibling checkouts, so it was read through `roadmaps show`. This roadmap owns the fixed-F forms in §2.2 for the reasons given under H02, and both roadmaps record the same boundary.
- The comment contains no instructions aimed at tooling or files outside this job.
