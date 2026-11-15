# FIX-DESIGN-Varifolds~11: repair of the Varifolds design

The review REV-DESIGN-Varifolds~10 has two findings, F01 (P3) and F02 (P3). Both are right and both
are applied. F02's pattern also occurred in 9.2 and the Layer 9 Dependencies line, which are
repaired the same way.

Files edited:

- `packages/Varifolds/design/README.md`
- `packages/Varifolds/design/plan.json`

`packages/Varifolds/sources.toml` is unchanged: no new source is cited.

## F01 (P3) — applied

**Verified.** spt X is the closure of {X ≠ 0}. If X vanishes on an open O, then O misses
{X ≠ 0}, and since O is open it also misses the closure spt X. So O ⊇ spt‖V‖ ∩ spt X forces
spt‖V‖ ∩ spt X = ∅. The old bullet was true but said only "disjoint supports".

**Change (4.1, Locality bullet).** Old: "δV(X) = 0 when X vanishes on an open set containing
spt‖V‖ ∩ spt X". New: V is carried by G_k(spt‖V‖), and div_S X(x) depends only on ∇X(x). So δV(X)
depends only on ∇X along spt‖V‖: δV(X) = 0 when ∇X = 0 at every point of spt‖V‖, "in particular
when spt X ∩ spt‖V‖ = ∅". This contains the review's clause word for word, and gives it as a
special case of the one-jet form. The restriction clause is kept.

- **Why the stronger form holds.** W is second countable, so the open set W ∖ spt‖V‖ is ‖V‖-null.
  Hence V(G_k(W ∖ spt‖V‖)) = 0. The integrand tr(P_S ∘ ∇X(x)) is zero on G_k(spt‖V‖) when ∇X
  vanishes on spt‖V‖. The one-jet form is what the existing Check "δV(X) is not determined by X on
  spt‖V‖" needs as its counterpart.
- **New Check (4.1).** Take V = v(L, 1), L the x-axis of ℝ², and X = ψ y_2² e_1. Then spt X meets
  L, but DX = 0 on L, and div_L X = ∂_1(ψ y_2²) = 0 on L, so δV(X) = 0.
- **plan.json 4.1.** The "locality" API statement now says the same. A test "one-jet locality" is
  added.
- **Same construction elsewhere.** I searched the README and plan.json for "vanishes on an open set",
  "containing spt" and "∩ spt". There is no other occurrence. The locality entries of 1.4 and 9.1
  in plan.json are about convergence and reg^r, and are unaffected.

## F02 (P3) — applied

**Verified.** The *Needs:* lines name these targets:

- Layer 6: 6.1 names 4.1–4.4; 6.2 names 4.1–4.4; 6.3 names 1.4, 3.3, 4.4, 6.1–6.2; 6.4 names 2.3,
  3.3, 4.3, 6.3; 6.5 names 4.1–4.4.
- Layer 7: 7.1 names 1.2, 1.4, 4.3, 4.5, 6.2–6.3; 7.2 names 1.4, 3.2, 4.5, 6.1, 6.3; 7.3 names 3.3,
  4.5, 6.1, 6.3–6.4, 7.1–7.2; 7.4 names 1.4, 7.1, 7.3; 7.5 names 2.1–2.2, 4.5, 6.1–6.3, 7.1–7.2; 7.6
  names 2.1, 3.1, 3.3, 4.5, 7.4–7.5.

No Layer 5 target appears, and plan.json agrees: no 6.x or 7.x prerequisite is a 5.x target. I
also read the bodies of Layers 6 and 7. None of their statements or routes uses 5.1 or 5.2:

- 6.4 uses C² submanifolds and [Σ] from 2.3, and divergence along Σ.
- 7.1's C² metrics are ambient metrics.

The great-circle Check of 6.2 uses Λ = 0. That follows from 4.1's definition directly: for a closed
geodesic, ∫⟨∇_τX, τ⟩ ds = ∫ d/ds⟨X, τ⟩ ds = 0. A Check is not a dependency.

**Change.**

- Layer 6 Dependencies: "Layers 1–5; …" → "Layers 1–4; …".
- Layer 7 Dependencies: "Layers 1–6; …" → "Layers 1–4 and 6; …".

**Same pattern elsewhere.** 9.2's *Needs:* said "Layers 1–8", so Layer 9's Dependencies line also
named Layer 5. 9.2 uses only the notions it lists:

- weight, mass, support and convergence (Layer 1);
- rectifiability, integrality, tangent spaces and fibre measures (Layers 2–3), and dilations
  (Layer 3);
- δV, ‖δV‖, H, σ, η and stationarity (Layer 4);
- densities (Layer 6);
- VarTan (Layer 7);
- reg^r and sing^r (9.1).

Layers 5 and 8 add no notion. The old range also left out 9.1, although 9.2 lists reg^r and sing^r.
plan.json's 9.2 prerequisites (1.3, 3.1, 3.2, 4.4, 6.3, 7.2, 9.1) already had no 5.x or 8.x target.

- 9.2 statement: "Every notion of Layers 1–8" → "Every notion of Layers 1–4, 6 and 7 and of 9.1".
  The same change is made to the plan.json 9.2 statement.
- 9.2 *Needs:* "Layers 1–8" → "Layers 1–4, 6 and 7, Layer 9.1".
- Layer 9 Dependencies: "Layers 1–8" → "Layers 1–4 and 6–8". Layer 8 is still needed, by 9.3 and
  9.4 through 8.2.

After the change, I computed each layer's *Needs:* lines against its Dependencies line by script.
Each Dependencies line now names exactly the earlier layers that its *Needs:* lines name:

| Layer | Earlier layers named in *Needs:* | Dependencies line |
|---|---|---|
| 1 | none | Mathlib, Tau Ceti, GeometricCurrents G6 |
| 2 | 1 | Layer 1 |
| 3 | 1, 2 | Layers 1–2 |
| 4 | 1, 2, 3 | Layers 1–3 |
| 5 | 2, 3, 4 | Layers 2–4 |
| 6 | 1, 2, 3, 4 | Layers 1–4 |
| 7 | 1, 2, 3, 4, 6 | Layers 1–4 and 6 |
| 8 | 4, 6, 7 | Layers 4, 6 and 7 |
| 9 | 1, 2, 3, 4, 6, 7, 8 | Layers 1–4 and 6–8 |

So Layer 5, which delivers the submanifold first variation and the headline 5.2, is now an end
layer that no later layer consumes. The README never says otherwise: "How to read the build" and
Downstream consumers make no claim that a later layer uses Layer 5. Varifolds, Part II starts from
Layers 1–8, as before.

## Checks run

**Dependency check** (the brief's command, run after the last edit):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. No supplier was added or removed.

**`roadmaps resolve`** on the README:

- No cross-roadmap citation was found missing.
- No Lean name was found missing.
- No backticked name was added.

**Other checks.**

- `plan.json` parses.
- The new test has a name, a kind and a statement, and `gaps` stays empty.
- Grep of the added lines found no LaTeX delimiter, machine path or process word.

**Suggested.lean:** there is none at the design stage. No `#check` comparison was possible or
needed, and no Lean name was added or changed.

**Gate failures listed in the brief:** none.

**Ownership:** no construction was added. The locality law is an elementary property of 4.1's own
definition. Overlap report: no open pull request changes this roadmap, and no id is dropped. No
source was fetched, and `needs-references.toml` was not written.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.1 one-jet locality | V = 0 | spt‖V‖ = ∅, so the hypothesis holds vacuously; δV(X) = 0 | holds | none |
| 4.1 one-jet locality | k = 0 | div over the zero plane is 0, so δV = 0 (4.1's degenerate bullet) | consistent | none |
| 4.1 one-jet locality | k = N = 2, V = vol of the flat torus, X = e_1 (parallel, compactly supported) | ∇X ≡ 0, so the law gives 0; ∫ div X = 0 | holds | none |
| 4.1 one-jet locality | v(L, 1) on the x-axis; X = ψ y_2² e_1 | DX = y_2² e_1⊗Dψ + 2ψy_2 e_1⊗e_2 = 0 on L; div_L X = ∂_1(ψ y_2²)\|_{y_2=0} = 0, so δV(X) = 0 | holds; disjoint supports do not cover it | new Check |
| 4.1 one-jet locality | v(L, 1); X supported in {y_2 > 1} (the review's test) | disjoint supports; δV(X) = 0 | holds | none |
| 4.1 hypothesis cannot drop to "X = 0 on spt‖V‖" | vertical lift of H¹⌞L, X = ψ y_2 e_2 | X = 0 on L but ∇X = ψ e_2⊗e_2 ≠ 0 on L; δV(X) = ∫ψ(t, 0) dt ≠ 0 | law correctly does not apply | existing Check kept |
| 4.1 hypothesis cannot drop to "X tangent on spt‖V‖" | unit circle C, X = ψ y | X ⊥ C, ∇X = id on C; δV(X) = 2π ≠ 0 | law correctly does not apply | none |
| 4.1 "carried by G_k(spt‖V‖)" | the vague weight δ_0 + H¹⌞L | the complement of spt = L is open and null; V(G_k(ℝ² ∖ L)) = 0 | holds (second countable) | reason stated |
| Layer 6 line | Needs of 6.1–6.5 | {1.4, 2.3, 3.3, 4.1–4.4, 6.1–6.3}; no 5.x | "Layers 1–4" is exact | changed |
| Layer 7 line | Needs of 7.1–7.6 | {1.2, 1.4, 2.1–2.2, 3.1–3.3, 4.3, 4.5, 6.1–6.4, 7.x}; no 5.x | "Layers 1–4 and 6" is exact | changed |
| 9.2 scope | notions listed in 9.2 | owners: 1.x, 2.x, 3.x, 4.x, 6.3, 7.2, 9.1; none in 5 or 8 | "Layers 1–4, 6 and 7 and 9.1" | changed |
| Layer 9 line | Needs of 9.1–9.4 | {1.2–1.4, 2.2–2.3, 3.1–3.2, 4.1–4.4, 6.1–6.4, 7.2, 8.2, 9.1} | "Layers 1–4 and 6–8" is exact | changed |
| Cycles | Layer 6/7 lines | no new edge; removing edges cannot create a cycle | gate: 0 problems | none |

## For the maintainer

- No id, heading or Lean name changed. 4.1, 9.2 and the layer titles are as before.
- No other roadmap cites this one: `roadmaps grep --fixed Varifolds` finds no match on main or in
  any open roadmap pull request, and no other board package names it.
- The review's "Source issues" and "For the human reviewers" sections (the two licence notes) list
  no finding. Nothing was changed because of them.
