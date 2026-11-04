# FIX-RT-DirectSummandsAndBigCohenMacaulay~2

This round merges two red-team passes: a (F01–F06) and b (F01–F03). None of the findings overlap, so each is settled in its own section.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F01 (P1) — applied

The witness holds. Before the repair, §3.5 quantified over the arbitrary Q₀ and α₀ of §3.4. Take A₀=B₀=ℤ₂, g=1, Q₀=A₀[1], α₀=id and m=3: the image is 1 in A∞/8, and `2^{1/2}`·1≠0 there. §3.5 now fixes Q₀=B₀/A₀ and takes α₀ to be its connecting morphism (§0.7). It also defines Q∞ and adds the Check "B₀=A₀ gives zero; the unrelated identity is not almost zero mod 8". §3.7 is the only consumer and already uses this obstruction. §§3.4 and 3.6 are general or conditional, so they stay as they are.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F02 (P2) — disputed

Round 1 disputed this finding, and it now comes back with no new mathematical claim. Nobody disputes the three statements; the dispute is whether they belong in `Suggested.lean`, which only states the roadmap's headlines:
- §0.5 is the Bartijn–Strooker completion theorem (BMPSTWW line 517, citing BH93).
- §0.6 is the faithful flatness of balanced big Cohen–Macaulay modules over a regular local ring. Its proof is one paragraph: projective dimension, then a Tor induction.
- §1.2 is the Matlis-duality splitting argument (HOCHSTERLC, Theorem 5.1).

All three are inputs to the stated headlines, not results the roadmap is built to reach. Pass b of this same round checked the same question independently and agreed (its round-1 table: "§§0.5, 0.6, 1.2 are consumed by the stated headlines and are not end theorems"). The package review (~2, F08) deleted them on exactly this ground. Restoring them would reverse an accepted repair and turn the file back into a catalogue of inputs. The README keeps each one as a prose target with its exact hypotheses and Checks. Two review rounds now disagree on this point, so a maintainer should decide it.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F03 (P2) — not actionable in this package: re-raised scope decision

Round 1 marked this finding not actionable as a scope change: it would mean owning Heitmann–Ma Theorems 3.1 and 4.1 (HEITMANNMA18 lines 438 and 544–556). Under the brief, a finding re-raised after that verdict goes to a human, not to another round. The witness is not in dispute; the dispute is the policy. Edits: none. `pureSubring_cohenMacaulay` keeps `hsep`, and the Scope paragraph still assigns the case without separability to a Part II.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F04 (P3) — applied

The §7.7 trace lemma now has locators:
- STACKS, Duality for Schemes, Lemma 48.29.2 (0E9Z, pp. 77–78, line 3650), which for r=0 gives a section O→f^!O.
- Lemmas 48.15.6 and 48.15.7 (0BR0, 0BRT).
- Example 48.7.3 (0B6L, p. 21, line 1039), which identifies the finite trace with evaluation.

The text says that 48.29.2 assumes a global immersion into a smooth proper scheme, so it is applied locally through affine opens embedded in projective space over the base. Compatibility with the field trace and the gluing remain owned here. The duality chapter was fetched legally through the sources service and recorded as an extra text under the existing STACKS key.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F05 (P3) — applied

Four bullets that only gave proof routes or references move into the prose; the claims themselves are unchanged:
- §2.2: the g=1 Faltings case.
- §2.3: the Kummer-purity route, and the cross-reference to §5.4 for W(k)⟦T⟧⁺.
- §4.1: B° is almost Cohen–Macaulay (§4.8).

§2.3 gains a new Check: for ℤ₂⊂ℤ₂[√2], the functional a+b√2↦a sends (1,√2) to (1,0), half the trace is the same ℤ₂-valued functional, and the zero functional fails.

## RT-DirectSummandsAndBigCohenMacaulay~2a/F06 (P2) — applied

The witness holds, and I checked it. Over V=O_K (K the completion of ℚ₂(`2^{1/2^∞}`)), take 𝔞 the maximal ideal and the map (⊕V)ᵃ→Vᵃ sending eₙ to `2^{1/2ⁿ}`. Every V-linear map 𝔞→⊕V has finite support, and Hom(𝔞,V)=V. So every composite back to Vᵃ is multiplication by an element of 𝔞, never 1: there is no section, although there are ε-sections.

Changes:
- Conventions now define "almost split for an idempotent ideal 𝔞" as "𝔞 kills α", which is equivalent to having ε-retractions r_ε∘u=ε. The witness above is included.
- §7.4: "left inverse in the almost derived category" becomes this ε-form, and the text says outright that no categorical left inverse is claimed.
- §7.4 proof: the ε-retractions of the trace are composed with the δ-retractions obtained from the almost isomorphism. The second step uses K°°⊗Q′=0, so ε acts by zero on the cone Q′. Sums of these maps cover K°° because (K°°)²=K°°.

§3.5 and §7.8 use the same convention. §3.6 consumes exactly "the obstruction is almost zero".

## RT-DirectSummandsAndBigCohenMacaulay~2b/F01 (P3) — applied

BMPSTWW lines 516–518 attribute the completion statement to BH93, Exercise 8.1.7 and Theorem 8.5.1. §0.5 now cites BH93 in its locator list and in the proof route, with the outline (complete; lower local cohomology vanishes; M̂/mM̂=M/mM). BH93 is added to References and sources.toml as uncertified: the service found only a paywalled CUP page.

## RT-DirectSummandsAndBigCohenMacaulay~2b/F02 (P3) — applied

In §4.10 the locator list now leads with HH92 (uncertified: the service reached only JSTOR), then BMPSTWW line 561 (attributing the result to HH92 and HH95) and ANDRE18B line 184 ("equicharacteristic case known"). This replaces line 747, the proof of 0.7.2, which now cites only the Check about the `S_{m,i}` it actually describes. HH92 is added to References and sources.toml. I did not invent a theorem number for HH92: its locator is recorded as attributed by BMPSTWW.

## RT-DirectSummandsAndBigCohenMacaulay~2b/F03 (P3) — applied

KOVACS00 line 11 (Theorem 1, p. 187) checks out: if Y has rational singularities and O_X→Rφ_*O_Y has a left inverse, then X has rational singularities. The §7.1 elliptic-cone Check now cites it and computes R¹φ_*O_Y=H¹(E,O_E)=ℂ. The §7.1 locator list adds the same citation. I repaired the same pattern in §7.1's prose ("Kovács, as recalled in Bhatt 2012"), which also names Theorem 1 for that direction.

## Checks

- `lake env lean packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean`, re-run after adding the module header: exit 0, with 10 `declaration uses sorry` warnings, no other warning and no errors.
- Module-system warning: the worker's targeted build fails on any warning other than `sorry`, and lake reported that `Mathlib` is designed for the module system. `Suggested.lean` now opens with `module` and reads `public import Mathlib` and `public import TauCeti.RingTheory.RegularLocalRing.Basic`. The pinned Tau Ceti module is itself a `module` file, and the gate's import rule accepts `public import`. The declarations sit inside `public section … end`. Nothing else in the file changed. The edits from the earlier attempt are kept as they were, including the Stacks duality locators (lines 1039, 1786, 1797 and 3650 begin Example 48.7.3 and Lemmas 48.15.6, 48.15.7 and 48.29.2).
- Binder audit: I elaborated the file together with `#check @…` for all 19 declarations in one scratch file (exit 0, no errors). I compared all 19 elaborated types with the earlier signature list after normalising whitespace: all 19 are identical, and each matches its README statement. The module header changed visibility only, no statement.
- Dependency check: `depcheck: 188 roadmaps, 1236 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `sources check packages/DirectSummandsAndBigCohenMacaulay/sources.toml`: 0 problems.
- There were no gate failures to repair.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions: almost split ⇔ 𝔞·α=0 ⇔ ε-retractions | A=V, u=id; A=K°, u: K°→K°/p | id: α=0, r_ε=ε·id. K°/p: r_ε∘u=ε forces εp=0, false for ε≠0 | Equivalence comes from the Hom exact sequence of the triangle; holds |
| Conventions: weaker than a categorical section | (⊕V)ᵃ→Vᵃ, eₙ↦`2^{1/2ⁿ}` | ε-section 1↦(ε/`2^{1/2ⁿ}`)eₙ when v(ε)≥2⁻ⁿ; any map 𝔞→⊕V has finite support, so composite = c with c∈𝔞, c≠1 | Witness included in the README |
| §3.5 with Q₀=B₀/A₀ | B₀=A₀; A₀=ℤ₂, g=1, m=3, Q₀=A₀[1], α=id | Q₀=0 and α₀=0; unrelated α image 1 ∈ A∞/8, v(`2^{1/2}`)=1/2<3 so nonzero | Added as a Check |
| §3.5 for a quadratic cover | p odd, A₀=ℤ_p⟦x⟧, B₀=A₀[y]/(y²−x−p) | Q₀=A₀·ȳ is free, so α₀=0 and its image is 0 on every annulus | Consistent with §3.7 Check |
| §7.4 ε-form | A=K°, Y=Spec A (identity); Y=Spec(K°/p) | identity: r_ε=ε·id; K°/p excluded by surjectivity (εp≠0) | Holds; existing negative Check unchanged |
| §7.4 proof: (K°°)²=K°° | K = completed ℚ₂(`2^{1/2^∞}`), ε=`2^{1/4}` | ε=`2^{1/8}`·`2^{1/8}` with both factors in K°° | Product step valid; value group 2-divisible |
| §7.4 proof: K°°⊗Q′=0 ⇒ ε·id_{Q′}=0 | Q′=K°/𝔪 in degree 0 | ε·(K°/𝔪)=0 holds directly; K°°⊗K°/𝔪=𝔪/𝔪²=0 | Factorization Q′→K°°⊗Q′→Q′ equals ε; holds |
| §7.7 trace lemma locator (0E9Z, r=0) | y²=x over K⟦x⟧; blow-up of K⟦x,y⟧ | Jacobian 2y: section sends 1↦2, y↦0 (=Tr); blow-up: ω=O(E), section vanishes once on E | Locally consistent with Lemma 48.29.2's map ∧⁰Ω=O→ω |
| §2.3 new Check | A=ℤ₂, B=ℤ₂[√2] | c(1)=1, c(√2)=0; Tr(a+b√2)=2a, so ½Tr=c; zero map gives 0 on 1 | Discriminates the zero functional |
| §7.1 Kovács Check | cone x³+y³+z³ over ℂ | E smooth cubic of genus 1: H¹(E,O_E)=ℂ≠0, so vertex not rational; Theorem 1 excludes a retraction | Holds |
| §0.5 BH93 route | R=k[X]_(X), M=R; M=0 | completion k⟦X⟧, quotient k≠0, X injective; M=0 gives quotient 0, so hypothesis fails | Unchanged statement |
| §4.10 HH92 citation | R=ℚ[ε]/ε² → ℚ | dim 0, m·ℚ=0, ℚ≠0: balanced | Unchanged statement |

## Ownership and sources

- No new target or ownership move. The ε-retraction convention is a definition about this roadmap's own obstruction (§0.7).
- The trace-lemma locators come from the Stacks duality chapter, fetched legally (open repository) and recorded under the existing STACKS key with its line locators.
- BH93 and HH92 are recorded as uncertified, each with its DOI. The service found no legal copy (a CUP book page and a JSTOR page); neither is listed in needs-references.toml, as the brief directs for paywalled locators.
- Ownership against open pull requests was not re-searched: no construction was added.

## Notes for the maintainer

- 2a/F02 and 2a/F03 are both re-raised findings and need a human decision:
  - F02: should `Suggested.lean` carry the three Layer 0–1 input theorems? Package review ~2 and red-team rounds 1–2 disagree.
  - F03: should the Heitmann–Ma case without separability, with Theorems 3.1 and 4.1, move from a Part II into this roadmap?
- No Lean name changed, so no other roadmap is affected.
- design/plan.json still has the old §7.4 wording in its statement fields. Only its `gaps` list is editable in this job, so the README is the authoritative statement.

## Gate repair

- tex=1 (the "A proof route is the following. B = H⁰(Y, O_Y) …" paragraph of §7.4): the subscript notation looked like TeX outside code spans. `Y×_Spec B Spec C` and `RΓ(Y×_{Spec B} Spec C, O)` are now code spans in the ASCII form `Y ×_(Spec B) Spec C` and `RΓ(Y ×_(Spec B) Spec C, O)`, and `p^N` became `pᴺ`. The mathematics is unchanged and nothing else was edited.
