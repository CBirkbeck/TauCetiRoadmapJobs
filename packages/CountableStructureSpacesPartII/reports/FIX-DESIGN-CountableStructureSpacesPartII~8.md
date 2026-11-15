# FIX-DESIGN-CountableStructureSpacesPartII~8

Repair of the design (`packages/CountableStructureSpacesPartII/design/README.md`, `sources.toml`)
against the one finding of REV-DESIGN-CountableStructureSpacesPartII~7. The finding is right and
is applied. `design/plan.json` is unchanged: it cites neither work and has no conventions section.
No `Suggested.lean` exists at the design stage, so no Lean file was changed and no elaboration or
`#check` inventory applies.

## F01 (P3) — applied

Verified: before the edit, `kechris-cdst` and `hjorth-2000` occurred in the README only in the
References list and nowhere in `plan.json`. The manifest gave both `cited_for` as "background" only.

Change. Convention 4 gains: "This is the logic action of S∞ on the space of countable structures
(kechris-cdst §16.C; becker-kechris-bams lines 159–164, where `g · x` reads `x` at the image of each
tuple under `g⁻¹`)". hjorth-2000 is deleted from the References and from `sources.toml`.

Evidence for the citation. camerlo-gao-boolean line 93 cites "[Kec95, 16.C]" for the Borel action
of S∞ whose orbits are the isomorphism classes, and its bibliography (line 1408) identifies [Kec95]
as *Classical Descriptive Set Theory*. So the uncertified §16.C locator is corroborated by a
certified text. becker-kechris-bams lines 162–163 define `g · x = y` by `y_i(s) = x_i(g⁻¹(s))`. That
is the pinned `eval_perm_smul` (`ModelTheory/RelationalConfiguration/Basic.lean:309`,
`(σ • c).eval a = c.eval (a.map σ.symm)`).

Manifest. The hjorth-2000 entry is removed. Nothing cites it, and no statement here relies on
Hjorth's Chapter 1, which cannot be read here; it is not guessed at. kechris-cdst: the locator is
narrowed to the section actually cited, §16.C. Its old list (§9.B, §26.C, §27, §27.D) supported no
statement. Its `cited_for` becomes "Conventions: the logic action". becker-kechris-bams `cited_for`
also gains "Conventions: the logic action"; its locator already lists lines 159–164.

Pattern search: every id in the README References and every manifest key was counted in the README
text outside the References and in `plan.json`. Results: paolini-shelah-tfab 13/16,
becker-kechris-bams 5/6, camerlo-gao-boolean 8/15, kechris-cdst 1/0, friedman-stanley-1989 7/6,
gao-idst 3/2, becker-kechris-1996 2/1, hjorth-kechris-1996 2/1, mekler-1981 1/0 (Scope and
ownership), montalban-cst2 3/4, montalban-cst1 6/9. No other work is cited nowhere. The manifest's
11 keys equal the References' 11 entries. No other `cited_for` reads "background".

## Adversarial pass on the changed statement

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Convention 4: the action is the logic action of becker-kechris-bams lines 162–163 | one unary `P`, `x` = code of `P = {0}`, `g` = 3-cycle `0 ↦ 1 ↦ 2 ↦ 0` | source: `y(s) = x(g⁻¹ s)`. `g⁻¹ 1 = 0`, so `y(1) = 1`. `g⁻¹ 0 = 2`, so `y(0) = 0`. `g⁻¹ 2 = 1`, so `y(2) = 0`. `y` = code of `P = {1}`. Pin: `(σ • c).eval a = c.eval (a.map σ.symm)` gives the same | agrees with the convention's witness; none |
| same, binary, non-abelian | `R = {(0,1)}`, `σ = (0 1)`; S₃ with `σ = (0 1)`, `τ = (1 2)` | `(σ • c)(u,v) = c(σu, σv)`, true iff `(u,v) = (1,0)`. Acting by `τ` and then by `σ` on `P = {0}`: `σ • (τ • c)` has `P = σ(τ{0}) = σ{0} = {1}`, which equals `(στ) • c`, since `στ` sends `0 ↦ 1`; `τσ` sends `0 ↦ 2` | left action, as `instMulActionPerm`; none |
| same, degenerate | `σ = id`; one nullary symbol; empty language | `id • c = c`; a nullary atom has the empty tuple, so `σ⁻¹ ∘ v = v` and its value is fixed; empty language: one code, fixed | consistent with the source (relational languages only, as Tau Ceti's `RelationalConfiguration`); none |
| wrong model: reading `x` at `g(s)` | same 3-cycle | `y(s) = x(g s)`: `g 2 = 0`, so `y` = code of `P = {2} ≠ {1}` | excluded by the witness already in Convention 4; none |
| kechris-cdst §16.C locator | camerlo-gao-boolean lines 87–93, 1408 | line 93 names §16.C of [Kec95] for S∞ acting on `Mod(T)`, with isomorphism as orbit equivalence; line 1408: [Kec95] = *Classical Descriptive Set Theory*, 1995 | locator corroborated; citation added |

## Checks

- Dependency check (`gate`), after the edits:

```text
candidate: CountableStructureSpacesPartII is not in the merge order yet; checked as if placed after NoncompactQuantumSymmetry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

  No UPWARD or CYCLE line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses (unchanged). `sources.toml` parses as TOML with 11 entries.
- No `Suggested.lean` at the design stage: no elaboration, `#check` inventory or binder comparison
  was run, and none is claimed.

## For the maintainer

- No id, section, target or Lean name changed. No other roadmap is affected.
- The `sources.toml` key `hjorth-2000` (settled uncertified) is removed because nothing cites it.
  If a later revision cites Hjorth's monograph, it should restore that key rather than create a new
  one.
- No suspicious instruction was found in the review text.
